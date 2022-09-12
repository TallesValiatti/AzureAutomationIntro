# Install
Find-Module az
Install-Module -Name az -Scope CurrentUser

# Verify Version
Get-InstalledModule -Name Az

# Sign In
Connect-AzAccount

# Context
Get-AzContext

# Get Signed In User
Get-AzADUser -SignedIn

# Create User
$Password = 'Abcd123!@!'
$securePassword = ConvertTo-SecureString `
                    -String $Password `
                    -AsPlainText -Force

New-AzADUser `
    -DisplayName Teste1 `
    -UserPrincipalName Teste1@tallesvaliatti.com `
    -Password $securePassword `
    -MailNickname Teste1 `
    -AccountEnabled $true 
            

# Create a Resource Group
New-AzResourceGroup `
    -Name rg-employee-onboarding-eastus `
    -Location "East US"
