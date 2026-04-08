# Example: validate Exchange Online connector posture for a SEPPmail integration
Get-InboundConnector '[SEPPmai*' | Format-List Name,Enabled,EFSkipLastIP,EFSkipIPs
Get-OutboundConnector '[SEPPmai*' | Format-List Name,Enabled,TlsSettings,RecipientDomains
Get-TransportRule | Where-Object {$_.Name -like '*SEPPmail*'} | Format-Table Name,State,Priority
