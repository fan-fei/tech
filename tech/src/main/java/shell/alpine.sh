#!/usr/bin/expect

if {[file exists ~/.ssh/known_hosts]} {
    file delete [glob ~/.ssh/known_hosts]
}

set timeout 5
set pwd "alpine\r"

spawn ssh -p 2222 root@localhost

expect {
    "yes/no" {
        send "yes\n"
        expect "password:"
        send "$pwd\n"
    }

    "*password:*" {
        send "$pwd\n"
    }
}
expect "*#"
send "mount -o rw,union,update /\r"
expect "*#"
send "cd /var/containers/Data/System/\r"
expect "*#"
send "echo hello\r"
send "dir=\$(find . -name 'internal'| cut -d '/' -f 2)\n cp -rv /var/containers/Data/System/\$dir/Library/activation_records /\r"
expect "*#"

spawn scp -r -P 2222 "root@localhost:/var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist"  "./Desktop/bak/"
expect {
    "*password:*" { send $pwd\r;interact }
}

spawn scp -r -P 2222 "root@localhost:/activation_records" "./Desktop/bak/"
expect {
    "*password:*" { send $pwd\r;interact }
}

spawn scp -r -P 2222 "root@localhost:/var/mobile/Library/FairPlay/" "./Desktop/bak/"
expect {
    "*password:*" { send $pwd\r;interact }
}