Param(
    [parameter(Mandatory=$true)]
    [string] $firstname,
    [parameter(Mandatory=$true)]
    [string] $lastname,    
    [parameter(Mandatory=$true)]
    [string]$userPassword
)

try
{    
    Connect-AzAccount -Identity
    
	$securePassword = ConvertTo-SecureString `
                            -String $userPassword `
                            -AsPlainText -Force
    
    $displayname = $firstname + " " + $lastname
    $mailNickname = $firstname + "." + $lastname
    $upn = "$firstname.$lastname" + "@tallesvaliatti.com"

    New-AzADUser `
        -DisplayName $displayname `
        -UserPrincipalName $upn `
        -Password $securePassword `
        -MailNickname $mailNickname `
        -GivenName $firstname`
        -Surname $lastname `
        -AccountEnabled $true
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}