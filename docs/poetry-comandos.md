# 📖 Guia Rápido – Comandos Úteis do Poetry

O **Poetry** é um gerenciador de dependências e ambientes virtuais para Python.  
Aqui estão os comandos mais usados para o dia a dia:

---

## 🔧 Inicialização e Criação de Projetos

### `poetry init`
Cria o arquivo `pyproject.toml` para um projeto existente.  
- **Interativo** (faz perguntas sobre nome, versão, dependências, etc.).  

⚡ Variações:
```bash
poetry init --no-interaction                # Cria sem perguntar nada
poetry init --dependency requests           # Adiciona dependência
poetry init --dev-dependency pytest         # Adiciona dependência de dev
poetry init --dependency requests --dev-dependency pytest --no-interaction
```

---

### `poetry new`
Cria um **novo projeto** já com estrutura básica.  
```bash
poetry new meu_projeto
```

Estrutura criada:
```
meu_projeto/
├── pyproject.toml
├── README.md
├── src/ (se usar --src)
│   └── meu_projeto/
│       └── __init__.py
└── tests/
    └── __init__.py
```

---

## 📦 Dependências

```bash
poetry add requests             # Instala e adiciona dependência
poetry add requests@^2.31       # Versão específica/compatível
poetry add --dev pytest         # Dependência de desenvolvimento
poetry remove requests          # Remove pacote
poetry update                   # Atualiza dependências
poetry show                     # Lista dependências
poetry show --tree              # Mostra árvore de dependências
```

---

## 📂 Ambientes Virtuais

```bash
poetry install                  # Instala dependências do projeto
poetry lock                     # Gera/atualiza poetry.lock
poetry env list                 # Lista ambientes virtuais
poetry env use python3.10       # Usa versão específica do Python
poetry env remove python        # Remove ambiente atual
```

---

## ▶️ Execução

```bash
poetry run python script.py     # Executa script no ambiente virtual
poetry run pytest               # Roda testes
poetry shell                    # Entra no shell do ambiente virtual
```

---

## 📤 Build e Publicação

```bash
poetry build                    # Gera pacotes (.whl e .tar.gz)
poetry publish                  # Publica no PyPI
poetry publish --build          # Faz build e publica
```

---

## 🔍 Extras Úteis

```bash
poetry check                    # Valida pyproject.toml
poetry export -f requirements.txt --output requirements.txt
                                # Exporta deps para requirements.txt
poetry cache clear pypi --all   # Limpa cache
```

---

## 📌 Resumo Rápido

- **Criar projeto**: `poetry new nome`  
- **Inicializar deps**: `poetry init`  
- **Instalar deps**: `poetry add pacote`  
- **Executar**: `poetry run` ou `poetry shell`  
- **Build & publish**: `poetry build && poetry publish`  


---

## ⚙️ Configurações do Poetry (global e local)

> Dica: Use `--global` para afetar todos os projetos e `--local` para salvar no `pyproject.toml` atual.

```bash
poetry config --list                        # Lista todas as configs ativas
poetry config KEY                           # Mostra o valor de uma chave
poetry config --global KEY VALUE            # Define config global
poetry config --local KEY VALUE             # Define config apenas neste projeto
poetry config --unset KEY                   # Remove uma configuração
```

### Configs comuns e úteis
```bash
# Ambientes virtuais
poetry config virtualenvs.create true                   # (padrão) cria venvs aut'omaticamente
poetry config --global  virtualenvs.in-project true     # cria .venv na raiz do projeto
poetry config virtualenvs.in-project false              # usa pasta global de venvs
poetry config virtualenvs.path                          # mostra/define a pasta global de venvs
poetry config virtualenvs.prefer-active-python true     # usa o Python do shell ativo

# Otimização do instalador
poetry config installer.max-workers 8               # paraleliza downloads/instalações

# Repositórios e credenciais
poetry source add myrepo https://repo.example.com/simple/
poetry source remove myrepo
poetry config http-basic.myrepo USER TOKEN          # auth básica para repositório privado
poetry config pypi-token.pypi <SEU_TOKEN>           # token do PyPI oficial

# Proxy (se necessário)
poetry config http.proxy http://usuario:senha@host:porta
poetry config https.proxy http://usuario:senha@host:porta
```

---

## 📁 Onde fica a pasta do ambiente virtual (venv)

### Ver rapidamente o caminho do venv do projeto
```bash
poetry env info             # mostra detalhes (Paths → Path)
poetry env info -p          # imprime apenas o caminho do venv
```

### Forçar criação do venv **dentro do projeto** (recomendado para times e CI)
```bash
poetry config virtualenvs.in-project true
poetry env use python3.10   # escolha sua versão (ex.: 3.10/3.11/3.12/3.13)
poetry install              # criará ./\.venv/ na raiz do projeto
# Resultado: <seu_projeto>/.venv/
```

### Usar uma **pasta global** para venvs (opção alternativa)
```bash
# Windows (PowerShell) – use aspas e duplas barras invertidas
poetry config virtualenvs.in-project false
poetry config virtualenvs.path "C:\Users\SEU_USUARIO\.virtualenvs"

# Linux/macOS
poetry config virtualenvs.path "$HOME/.virtualenvs"
```

> Para descobrir onde o venv está de fato, prefira `poetry env info -p`.  
> E para ver onde a pasta global está configurada hoje: `poetry config virtualenvs.path`.
