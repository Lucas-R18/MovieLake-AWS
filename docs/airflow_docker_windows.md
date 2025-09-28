# 🚀 Guia de Instalação e Execução do Apache Airflow com Docker no Windows

## 1️⃣ Pré-requisitos

-   Instale o [Docker
    Desktop](https://www.docker.com/products/docker-desktop)
-   Verifique a instalação:

``` shell
docker --version
docker-compose --version
```

------------------------------------------------------------------------

## 2️⃣ Baixar o arquivo docker-compose.yaml

Dentro da pasta `airflow-docker`, rode no **PowerShell**:

``` shell
Invoke-WebRequest -Uri "https://airflow.apache.org/docs/apache-airflow/2.10.2/docker-compose.yaml" -OutFile "docker-compose.yaml"
```

------------------------------------------------------------------------

## 3️⃣ Estrutura inicial de pastas e variáveis de ambiente

Crie as pastas necessárias:

``` shell
mkdir dags, logs, plugins
```

Crie o arquivo `.env`:

``` shell
Set-Content -Path .env -Value "AIRFLOW_UID=50000`nAIRFLOW_GID=0"
```

------------------------------------------------------------------------

## 4️⃣ Inicializar o Airflow (primeira vez)

``` shell
docker-compose up airflow-init
```

👉 Esse comando prepara o banco de metadados e cria o usuário admin
(`airflow / airflow`).\
Quando terminar, você verá: **Airflow is ready**.

------------------------------------------------------------------------

## 5️⃣ Subir os serviços do Airflow

``` shell
docker-compose up -d
```

👉 Esse comando sobe os containers (webserver, scheduler, postgres,
etc.) em **background**.

------------------------------------------------------------------------

## 6️⃣ Acompanhar logs (opcional)

``` shell
docker-compose logs -f
```

------------------------------------------------------------------------

## 7️⃣ Acessar o Airflow no navegador

Abra <http://localhost:8080>

**Login padrão:**

    user: airflow
    password: airflow

------------------------------------------------------------------------

## 8️⃣ Parar os containers

``` shell
docker-compose down
```

------------------------------------------------------------------------

## 9️⃣ Verificar containers ativos

``` shell
docker ps
```

👉 Veja se aparece `airflow-webserver` e confirme se está rodando na
porta `8080 → 8080`.

------------------------------------------------------------------------

## 🔟 Ver logs do webserver

``` shell
docker-compose logs airflow-webserver
```

👉 Se houver erro de inicialização (ex: falta de pacotes, problema de
permissões), ele será mostrado aqui.
