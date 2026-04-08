# Example: inspect SEPPmail-related transport rules
$domains = @('example.com','example.org')
foreach ($domain in $domains) {
    Write-Host "Testing domain $domain"
    Get-TransportRule | Where-Object {$_.Comments -match 'SEPPmail' -or $_.Name -match 'SEPPmail'} | `
        Format-Table Name,State,Mode,Priority
}
