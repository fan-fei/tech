#!/usr/bin/expect
set user [lindex $argv 0]
set pass [lindex $argv 1]
spawn ssh $user
expect {
"yes/no" { send "yes\r"}
"password:" { send "$pass\r" }
}
interact