#!/bin/zsh
# measuring maxRSS for experiments with Maude
subject="Experiments for ..."
email=canhdo@jaist.ac.jp
fileName="maxRSS.out"
rm -rf $fileName
while sleep 1 && (ps -cm -o pid,command,rss | grep maude > /dev/null 2>&1)
do
ps -cm -o pid,command,rss | grep maude | awk '
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
    totalMem += $3
}
END {
    print getCurrTime() "\t" totalMem
    maxFile = "maxRSS.out"
    cmd = "cat " maxFile " 2>/dev/null"
    err = cmd | getline maxRSS
    close(cmd)
    if (err == 1)
    {
        if (totalMem > maxRSS)
            print totalMem > maxFile
    } else if (err == 0)
    {
        print totalMem > maxFile
    }
}'
done
echo "--------------------------"
if test -f "$fileName"; then
    msg="maxRSS = $(cat $fileName)KB"
    echo $msg
    echo $msg | mail -s $subject $email
    rm -rf $fileName
fi