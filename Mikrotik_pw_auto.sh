#Simple one
:local wifiprofile "You wireless security-profiles name"
# "len=" in the url it is the number of characters for in the generated password
/tool fetch url="https://www.random.org/passwords//?num=1&len=23&format=plain&rnd=new" keep-result=yes dst-path="pass.txt"
delay 3
# The last digit before the closing square bracket must be "len=" from url
:local newPassword [put [pick ([/file get [/file find name=pass.txt] contents]) 0 10]];
:interface wireless security-profiles set $wifiprofile wpa-pre-shared-key="$newPassword";
:interface wireless security-profiles set $wifiprofile wpa2-pre-shared-key="$newPassword";
/file remove [find name="pass.txt"];
/log info message="New Wi-Fi Pass = $newPassword"













#A little bit harder

#######################################
###VoIP Squared WiFi Password Generator Script###
#######################################

:local toEmail youremail@domain.com
:local fromEmail router@yourdomain.com
:local prepend coffee
:local wifiprofile profile33

:local secr [/system resource get write-sect-since-reboot];
/log info message="Sector Writes Since Reboot=$secr"
:local runc [/system script get WiFiPasswordGenerator run-count];
/log info message="WiFiPasswordGenerator Run Count=$runc"
:local date1 [:pick [/system clock get date] 4 6];
/log info message="Month=$date1"
:local time1 [:pick [/system clock get time] 6 8];
/log info message="Seconds=$time1"
:local time2 [:pick [/system clock get time] 3 5];
/log info message="Minute=$time2"
:if ($date1 < 02) do={
:set date1 ("03");
};
:if ($time1 < 10) do={
:set time1 ("12");
};
:if ($time2 < 10) do={
:set time2 ("15");
};
:if ($runc < 10) do={
:set runc ("19");
}
:if ($secr < 10) do={
:set secr ("25");

}
###Remove if you want longer password###
:if ($secr > 99) do={
:set secr ("9");

};
###Remove if you want longer password###


####Use commented line below instead of the one below if you desire a longer password####
#:local newPassword ($date1 * $time1 * $time2 * $secr);
:local newPassword ($date1 * $time1 * $secr);

/log info message="Month x Seconds x Sector Writes Since Reboot=$newPassword"


:set newPassword ($prepend . $newPassword);
:interface wireless security-profiles set $wifiprofile wpa-pre-shared-key="$newPassword";
:interface wireless security-profiles set $wifiprofile wpa2-pre-shared-key="$newPassword";
:log info message="New WiFi Password Set To=$newPassword"
:log info message="Preparing To Email New WiFi Password"
delay 2
:tool e-mail send user=$fromEmail to=$toEmail subject="$[/system identity get name] WiFi Password" body="This Week's Wireless Password Is: $newPassword";
delay 2
:log info message="New WiFi Password Has Been Emailed"
:log info message="See You Next Week"
