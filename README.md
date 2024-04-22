<h1 align="center">
   <a href="#">Template para Infrastrutura como Código</a><br />
   <small>(Terraform)</small>
</h1>

<h3 align="center">
    Este código Terraform implementa uma Arquitetura Azure para o projeto infraestrutura simples.
</h3>

</p>

<h4 align="center">
    Status: Em Evolução
</h4>

<p align="center">
 <a href="#about">Sobre</a> •
 <a href="#how-it-works">Como Funciona</a> •
 <a href="#tech-stack">Documentações</a>

 ## Sobre

Este projeto está em evolução. A ideia final é que os arquivos venham prover:
 - Um Resource Group;
 - Uma VNET;
 - Uma Subnet;
 - Um Network Security Group;
 - Uma Tabela de rotas;
 - Um Banco de Dados PostgreSQL Flexible Server;
 - App Service;
 - App Service Plan;
 - Um container registry

 
![Arquitetura](./companyhelperadvisor.jpg)

## Como funciona

1. Instalar opentofu: https://opentofu.org/docs/intro/install/
2. Instalar az cli: https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli
3. Como realizar login com az cli: https://learn.microsoft.com/pt-br/cli/azure/authenticate-azure-cli
4. Clonar repositório: `git clone <URL para clone>`
6. Dentro da localização do repositório, crie o arquivo `simple_infra.tfbackend` com um conteúdo de exemplo:

    ```
    resource_group_name  = "RG-Simple_Infra_TFstate"
    storage_account_name = "sacomphelpadvichat"
    container_name       = "tfstate"
    key                  = "simleinfra.tfstate"
    ```
7. Execute o seguinte comando para criar o container com versionamento ativado e atualizar a Subnet Delegation:

    ```
    export RESOURCE_GROUP_NAME=RG-Simple_Infra_TFstate
    export STORAGE_ACCOUNT_NAME=tfstatstorageacconte
    export CONTAINER_NAME=tfstate
    export REGION=eastus
    export TAGS='managedBy=Eiji'

    az login --service-principal -u ${ARM_CLIENT_ID} -p ${ARM_CLIENT_SECRET} --tenant ${ARM_TENANT_ID}
    az account set --subscription ${ARM_SUBSCRIPTION_ID}

    # Create resource group
    az group create --name $RESOURCE_GROUP_NAME --location $REGION --tags $TAGS

    # Create storage account
    az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --tags $TAGS

    # Create blob container
    az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --auth-mode login
    ```
8. Dentro do local do repositório, crie o arquivo `simpleinfra.tfvars` com conteúdo de exemplo:

    ```
    simple_infra_project_rg          = "RG-Simple_Infra"
    simple_infra_project_vnet        = "VNet-Simple_Infra"
    simple_infra_project_nsg         = "NSG-Simple_Infra"
    simple_infra_project_rt          = "RT-Simple_Infra"
    simple_infra_project_sbnt        = "SubNet-Simple_Infra"
    simple_infra_project_domain_name = "simpleinfra"
    location                    = "East US"
    administrator_login         = "psqladmin"
    administrator_password      = "password"
    simple_infra_project_db_name        = "simpleinfradb"
    simple_infra_storage_name        = "simpleinfrastorage"
    simple_infra-container-tfstate   = "simpleinfracontainer"
    subscription_id             = "subscription_ID"
    simple_infra_acr_name            = "simpleinfraacr"
    ```
9. Exporte em seu terminal as variáveis abaixo para que o `simple_infra.tfbackend` funcione:

```
    export ARM_CLIENT_ID="ARM_CLIENT_ID"
    export ARM_CLIENT_SECRET="ARM_CLIENT_SECRET".DDdhr
    export ARM_TENANT_ID="ARM_TENANT_ID"
    export ARM_SUBSCRIPTION_ID=subscription_ID
```

10. Execute `tofu init -upgrade -backend-config=./simple_infra.tfbackend`
11. Execute `tofu apply -var-file ./Simple_Infra.tfvars`

## Documentações
- [Terraform (Opentofu)](https://opentofu.org/)
- [Azure Cli](https://learn.microsoft.com/pt-br/cli/azure/)
