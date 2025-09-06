#First README

Authenticating the terraform to Azure, we need service principal for this. 

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/blablabla"

{
  "appId": "blablabla",
  "displayName": "blablabla",
  "password": "blablabla",
  "tenant": "blablabla"
}
