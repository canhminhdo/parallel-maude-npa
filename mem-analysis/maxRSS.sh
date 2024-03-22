#!/bin/zsh
# measuring maxRSS for experiments with Maude
echo -n "Enter program name: "
read program
subject="Experiments for ${program}"
email=canhdo@jaist.ac.jp
fileName="maxRSS-${program}.out"
rm -rf $fileName
while sleep 1 && (top -l 1 | grep maude > /dev/null 2>&1)
do
top -l 1 | grep maude | awk '{print $8}' | sort -r | tr '[:upper:]' '[:lower:]' | awk -v maxFile="$fileName" '
function getCurrTime() {
    str = "date +[%Y-%m-%d@%H:%M:%S]"
    str | getline date
    close(str)
    return date
}
BEGIN {
    totalMem = 0
}
{
    while (1) {
        if (match($1, /(.)+(m|mb)$/)) {
            sub("mb", "", $1)
            sub("m", "", $1)
            totalMem += $1
            break
        }
        if (match($1, /(.)+(g|gb)$/)) {
            sub("gb", "", $1)
            sub("b", "", $1)
            totalMem += ($1 * 1000)
            print $1 " GB"
            break
        }
        if (match($1, /(.)+(k|kb)$/)) {
            sub("gb", "", $1)
            sub("b", "", $1)
            totalMem += ($1 / 1000)
            print $1 " B"
            break
        }
        break
    }
}
END {
    print getCurrTime() "\t" totalMem "MB"
    cmd = "cat " maxFile " 2>/dev/null"
    res = cmd | getline maxRSS
    close(cmd)
    if (res == 1)
    {
        if (totalMem > maxRSS)
            print totalMem > maxFile
    } else if (res == 0)
    {
        print totalMem > maxFile
    }
}'
done
echo "--------------------------"
if test -f "$fileName"; then
    msg="Program: ${program}, maxRSS = $(cat $fileName)MB"
    echo $msg
    echo $msg | mail -s $subject $email
    rm -rf $fileName
fi