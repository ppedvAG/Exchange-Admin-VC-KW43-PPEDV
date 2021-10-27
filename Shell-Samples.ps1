Add-PSSnapin *ex*

###Buchungsautomatik mit manuellem Zugriff
Add-MailboxFolderPermission -Identity konferenzraum1:\calendar -User administrator -AccessRights publishingeditor

##Hilfe für cmd-let
get-help Add-MailboxFolderPermission -detailed

##bestehende AD-Gruppe für Mail aktivieren
Enable-DistributionGroup -Identity u-test 

##Postfachgrösse anzeigen
Get-Mailbox | Get-MailboxStatistics | sort totalitemsize -desc | ft displayname,itemcount,totalitemsize 

#Max. Sendegröße auf Postfachächer in DB1 auf 2 MB festlegen
Get-Mailbox -Database db1 | Set-Mailbox -MaxSendSize 2MB

#Überwachung prüfen
Get-Mailbox -Identity administrator | fl aud*

#Überwachung auf Postfächer aktivieren
Get-Mailbox | Set-Mailbox -AuditEnabled:$true

##Adressbuchrichtlinie min. 4 Listen (GAL,OAB,Raumliste,+ min. eine weitere)
New-GlobalAddressList -Name GAL123 
New-OfflineAddressBook -Name OAB123 -AddressLists Kunden

New-AddressBookPolicy -Name AddressPOL1 -GlobalAddressList GAl123 -OfflineAddressBook OAB123 -RoomList "alle räume" -AddressLists Lieferanten

#Adressbuchaktualisierung "Server"
get-addresslist | update-addresslist
get-globaladdresslist | update-globaladdresslist
get-offlineaddressbook | update-offlineaddressbook

#Client

Get-RemoteDomain | fl


New-MailboxDatabase -Name restoreDB -Recovery

New-MailboxRestoreRequest -SourceDatabase recovery -SourceStoreMailbox Userxy -TargetMailbox userxy -TargetIsArchive

setup.exe /m:recoverserver

get-help New-MailboxRepairRequest -detailed
