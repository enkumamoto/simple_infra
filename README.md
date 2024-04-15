<h1 align="center">
   <a href="#">Template para Infrastrutura como Código</a><br />
   <small>(Terraform)</small>
</h1>

<h3 align="center">
    Este código Terraform implementa uma Arquitetura Azure para o projeto Company Helper Advisor Chat.
</h3>

</p>

<h4 align="center">
    Status: Concluído
</h4>

<p align="center">
 <a href="#about">Sobre</a> •
 <a href="#how-it-works">Como Funciona</a> •
 <a href="#tech-stack">Documentações</a>

 ## Sobre

O projeto utiliza solicita uma arquitetura simples para sua implementação. Esse padrão teve fornecimento, pelo Departamento de TI da Radix, de um ambiente de rede seguro e isolado para os recursos do projeto.

Isso significa que o projeto realiza uma entrega de qualidade e de baixo custo, o projeto utiliza serviços da Azure como Azure Service Bus, Azure PostgreSQL Flexible Server e Azure App Service para construir uma solução econômica.
Ao mesmo tempo, este projeto pode ser migrado para outro serviço como Azure Container Service (ACS) ou Azure Kubernetes Service (AKS) e se tornar escalável.

![Arquitetura](./companyhelperadvisor.jpg)

## Como funciona

1. Instalar opentofu: https://opentofu.org/docs/intro/install/
2. Instalar az cli: https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli
3. Como realizar login com az cli: https://learn.microsoft.com/pt-br/cli/azure/authenticate-azure-cli
4. Clonar repositório: `git clone <URL para clone>`
6. Dentro da localização do repositório, crie o arquivo `Company_Help_Advisor_Chat.tfbackend` com um conteúdo de exemplo:

    ```
    resource_group_name  = "RG-Company_Help_Advisor_Chat_nexus"
    storage_account_name = "sacomphelpadvichat"
    container_name       = "tfstate"
    key                  = "Company_Help_Advisor_Chat.tfstate"
    ```
7. Execute o seguinte comando para criar o container com versionamento ativado e atualizar a Subnet Delegation:

    ```
    export RESOURCE_GROUP_NAME=RG-Company_Help_Advisor_Chat_nexus
    export STORAGE_ACCOUNT_NAME=sacomphelpadvichat
    export CONTAINER_NAME=tfstate
    export REGION=eastus
    export TAGS='managedBy=Nexus'

    az login --service-principal -u ${ARM_CLIENT_ID} -p ${ARM_CLIENT_SECRET} --tenant ${ARM_TENANT_ID}
    az account set --subscription ${ARM_SUBSCRIPTION_ID}

    # Create resource group
    az group create --name $RESOURCE_GROUP_NAME --location $REGION --tags $TAGS

    # Create storage account
    az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --tags $TAGS

    # Create blob container
    az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --auth-mode login

    # UPDATE SUBNET DELEGATION
    az network vnet subnet update --resource-group RG-Company_Help_Advisor_Chat --name SubNet-Company_Help_Advisor_Chat --vnet-name Vnet-Company_Help_Advisor_Chat --delegations Microsoft.DBforPostgreSQL/flexibleServers
    ```
8. Dentro do local do repositório, crie o arquivo `Company_Help_Advisor_Chat.tfvars` com conteúdo de exemplo:

    ```
    chatbot_project_rg          = "RG-Company_Help_Advisor_Chat"
    chatbot_project_vnet        = "VNet-Company_Help_Advisor_Chat"
    chatbot_project_nsg         = "NSG-Company_Help_Advisor_Chat"
    chatbot_project_rt          = "RT-Company_Help_Advisor_Chat"
    chatbot_project_sbnt        = "SubNet-Company_Help_Advisor_Chat"
    chatbot_project_domain_name = "companyhelpadvisorchat"
    location                    = "East US"
    administrator_login         = "psqladmin"
    administrator_password      = "w@N^$&uQ!r6q92eu#NHnowGAuC"
    chatbot_project_db_name        = "companyhelpadvisorchatdb"
    chatbot_storage_name        = "companyhelpadvisorchatstorage"
    chatbot-container-tfstate   = "companyhelpadvisorchatcontainer"
    subscription_id             = "a6d20b3d-0350-460e-a215-cf251549176b"
    chatbot_acr_name            = "companyhelpadvisorchatacr"
    ```
9. Exporte a variáveis abaixo para que o `Company_Help_Advisor_Chat.tfbackend` funcione:

```
    export ARM_CLIENT_ID=719fdedb-dddf-4070-a705-b9237387fe56
    export ARM_CLIENT_SECRET=4Zr8Q~IjWST9ivoj0mfXtipw7y~Oh_s1F2.DDdhr
    export ARM_TENANT_ID=9339fb1c-0944-4fb9-808d-a278e53590e5
    export ARM_SUBSCRIPTION_ID=a6d20b3d-0350-460e-a215-cf251549176b
```

10. Execute `tofu init -upgrade -backend-config=./Company_Help_Advisor_Chat.tfbackend`
11. Execute `tofu apply -var-file ./Company_Help_Advisor_Chat.tfvars`

## Documentações
- [Terraform (Opentofu)](https://opentofu.org/)
- [Azure Cli](https://learn.microsoft.com/pt-br/cli/azure/)