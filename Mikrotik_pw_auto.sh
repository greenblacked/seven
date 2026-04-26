# MikroTik RouterOS examples for rotating a Wi-Fi password.
#
# Review and test in a maintenance window before scheduling.
# Avoid logging or emailing plain-text Wi-Fi passwords on shared routers.

# Simple random.org based example.
:local wifiprofile "your-wireless-security-profile"
:local passwordLength 23
:local passwordFile "wifi-pass.txt"

/tool fetch url=("https://www.random.org/passwords/?num=1&len=" . $passwordLength . "&format=plain&rnd=new") keep-result=yes dst-path=$passwordFile
delay 3

:local passwordContents [/file get [/file find name=$passwordFile] contents]
:local newPassword [:pick $passwordContents 0 $passwordLength]

:interface wireless security-profiles set $wifiprofile wpa-pre-shared-key=$newPassword
:interface wireless security-profiles set $wifiprofile wpa2-pre-shared-key=$newPassword
/file remove [find name=$passwordFile]
/log info message=("Wi-Fi password rotated for profile " . $wifiprofile)


# Local entropy example.
#
# Configure e-mail first if you want notification delivery:
# /tool e-mail set server=smtp.example.com from=router@example.com user=router@example.com password=secret

:local toEmail "you@example.com"
:local fromEmail "router@example.com"
:local prepend "coffee"
:local wifiprofile "profile33"

:local sectorWrites [/system resource get write-sect-since-reboot]
:local runCount [/system script get WiFiPasswordGenerator run-count]
:local month [:pick [/system clock get date] 4 6]
:local seconds [:pick [/system clock get time] 6 8]
:local minutes [:pick [/system clock get time] 3 5]

:if ($month < 2) do={ :set month 3 }
:if ($seconds < 10) do={ :set seconds 12 }
:if ($minutes < 10) do={ :set minutes 15 }
:if ($runCount < 10) do={ :set runCount 19 }
:if ($sectorWrites < 10) do={ :set sectorWrites 25 }
:if ($sectorWrites > 99) do={ :set sectorWrites 9 }

:local newPassword ($prepend . ($month * $seconds * $minutes * $sectorWrites * $runCount))

:interface wireless security-profiles set $wifiprofile wpa-pre-shared-key=$newPassword
:interface wireless security-profiles set $wifiprofile wpa2-pre-shared-key=$newPassword
:log info message=("Wi-Fi password rotated for profile " . $wifiprofile)

# Remove this block if you do not want passwords sent by e-mail.
:tool e-mail send user=$fromEmail to=$toEmail subject=("$[/system identity get name] Wi-Fi Password") body=("This week's wireless password is: " . $newPassword)
:log info message="Wi-Fi password notification sent"
