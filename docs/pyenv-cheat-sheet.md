# 📘 Pyenv Cheat Sheet

Guia rápido com comandos úteis para gerenciamento de versões do Python usando **pyenv**.

---

## 🔍 Informações básicas
```bash
pyenv --version       # mostra a versão instalada do pyenv
pyenv commands        # lista todos os comandos disponíveis
pyenv help <comando>  # ajuda detalhada de um comando específico
```

---

## 📦 Instalação de versões Python
```bash
pyenv install --list        # lista todas as versões disponíveis de Python
pyenv install 3.10.12       # instala versão específica
pyenv install -v 3.11.9     # instala com logs detalhados
pyenv uninstall 3.9.18      # remove versão instalada
```

---

## ⚙️ Seleção de versões
```bash
pyenv versions               # lista versões instaladas e ativa
pyenv global 3.10.12         # define a versão global (sistema todo)
pyenv local 3.11.9           # define a versão local (diretório/projeto)
pyenv shell 3.12.7           # define versão apenas na sessão atual do shell
pyenv global system          # volta para versão padrão do sistema
```

---

## 🔄 Atualização
```bash
pyenv update                 # atualiza o próprio pyenv (se plugin pyenv-update estiver instalado)
```

---

## 🛠️ Diagnóstico & manutenção
```bash
pyenv doctor                 # verifica se tudo está configurado corretamente
pyenv rehash                 # atualiza shims (quando adiciona/remover versões)
pyenv which python           # mostra caminho do python em uso
pyenv prefix 3.11.9          # mostra caminho da instalação de uma versão
```

---

## 🌐 Integração com virtualenv (se usar `pyenv-virtualenv`)
```bash
pyenv virtualenv 3.10.12 myenv     # cria um ambiente virtual baseado na versão
pyenv virtualenvs                  # lista ambientes virtuais
pyenv activate myenv               # ativa um ambiente
pyenv deactivate                   # desativa o ambiente
```

---

👉 **Dica:** use o `pyenv` para gerenciar versões do Python e o **Poetry** para gerenciar dependências + ambientes virtuais de cada projeto.
