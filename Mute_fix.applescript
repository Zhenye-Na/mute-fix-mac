on run {input, parameters}
do shell script "" with administrator privileges
set the rootPwd to text returned of (display dialog "Input your Admin password:" default answer "" with hidden answer)
try
do shell script "echo " & rootPwd & "|sudo -S killall coreaudiod"
do shell script "echo " & rootPwd & "|sudo -S kextunload /System/Library/Extensions/AppleHDA.kext"
do shell script "echo " & rootPwd & "|sudo -S kextload /System/Library/Extensions/AppleHDA.kext"
do shell script "sudo -k" --logout root
display dialog "The operation has been successfully completed and your system should be able to recover the sound.
If the problem persists, please reboot the system." buttons {"OK"} with icon 1 with title "Success!"
on error
display dialog "The operation can not be performed because you entered the wrong password. Please run this service again and re-enter the correct current admin password." buttons {"OK"} with icon caution with title "Error!"
end try
return input
end run