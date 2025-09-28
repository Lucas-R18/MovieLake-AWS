# Configurando o WSL e AWS CLI

```shell
# 1. Instalar o WSL (Ubuntu) - executar no PowerShell (Admin)
wsl --install -d Ubuntu

# 2. Atualizar pacotes no Ubuntu (WSL)
sudo apt update && sudo apt upgrade -y

# 3. Instalar dependências
sudo apt install unzip -y

# 4. Instalar AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# 5. Verificar instalação
aws --version

# 6. Configurar credenciais AWS
aws configure
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region name (ex.: us-east-1 ou sa-east-1)
# - Default output format (json, table ou text)

