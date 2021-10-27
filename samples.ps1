Add-MailboxFolderPermission -Identity konferenzraum1:\calendar -User company\administrator -AccessRights editallitems
get-help Add-MailboxFolderPermission -detailed

Enable-DistributionGroup -Identity U-verteiler

Get-Mailbox

Get-Mailbox -Identity dis* | Add-MailboxPermission -User administrator -AccessRights FullAccess 
Get-Mailbox -Identity dis* | Get-MailboxPermission 

Get-Mailbox -Identity alexander | fl audit*

Get-Mailbox | Set-Mailbox -AuditEnabled:$true

Get-Mailbox | Get-MailboxStatistics | sort totalitemsize -desc | ft displayname,itemcount,totalitemsize 
##
Get-Mailbox -Database db1 | Set-Mailbox -MaxSendSize 5MB

###AdressbuchPolicy

New-GlobalAddressList -Name GlobalTochter 
New-OfflineAddressBook -Name OfflineTochter -AddressLists tochter

New-AddressBookPolicy -GlobalAddressList globaltochter -OfflineAddressBook offlinetochter -RoomList "alle Räume" -AddressLists Tochter

Connect-PSSession -ComputerName ex19