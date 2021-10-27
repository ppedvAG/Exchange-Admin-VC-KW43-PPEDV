Get-MessageTrackingLog -ResultSize Unlimited -Start "Feb 20 2021” | select-object eventid,timestamp,source,messageid,sender,recipients,messagesubject | Out-Gridview



Get-MessageTrackingLog -Sender Administrator@company.local -Start (Get-Date).AddHours(-1)


Get-MessageTrackingLog -Sender Administrator@company.local

Get-MessageTrackingLog -Sender Administrator@company.local -Recipients Lyncuser1@company.local


Get-MessageTrackingLog -Sender Administrator@company.local -Recipients Lyncuser1@company.local,Lyncuser2@company.local



Get-MessageTrackingLog -Start (Get-Date).AddHours(-1) | Where-Object {$_.recipients -like "*@company.de"}


Get-MessageTrackingLog -Start (Get-Date).AddHours(-1) | Where-Object {$_.recipients -match "company.de"}
