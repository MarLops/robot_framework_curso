# Robot Framework - Curso

Este repositório é dedicado ao aprendizado do [framework robot-framework](https://robotframework.org/). Os seguintes tópicos serão abordados

1. Estrutura básica do framework
2. Criação do arquivo .robot
3. Criação de projetos complexos usando arquivos .robot e .py
4. Extração de dados de aplicação browser
5. Teste de QA para aplicação browser
6. Interação com aplicação browser
6. Integração com banco de dados
7. Extração de dados de aplicação não browser
8. Integração com aplicação não browser

## Guia de instalação

### Pré-requisitos


O curso necessita que o usuário tenha [python](https://www.python.org/downloads/) e [git](https://git-scm.com/) instalados. 
Por default, o python oferece pip como gerenciador de pacotes porém é recomendavel usar [uv](https://docs.astral.sh/uv/).
Como editor de texto, é recomendável instalar [vscode](https://code.visualstudio.com/) pois a robotcorp oferece uma [extensão](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode) que facilita a manipulação dos arquivos .robot

---


### Preparando o ambiente

#### Primeira opção: Usando `uv` (Recomendado)

`uv` é uma ferramenta optimizada para gerenciar pacotes, para instalar, segue os comandos disponível no [site](https://docs.astral.sh/uv/getting-started/installation/#__tabbed_1_1)

Após a instalação, seguir os seguintes passos

1. Fazer clone do projeto
   ```bash
   git clone <>
   ```

2. Sincronizar o projeto
   ```bash
   uv sync
   ```


#### Segunda opção: Usando gerenciador padrão - `pip`

No caso da utilização do gerenciador `pip`, os seguintes passos precisam ser executados

1. Criar o ambiente env:
   ```bash
   python -m venv .venv
   ```

2. Iniciar o ambiente env :
    Windows
    ```cmd
    .venv\Scripts\activate.bat
    ```

    Linux
    ```bash
    source .venv/bin/activate
    ```

3. Instalação dos pacotes
```bash
pip install -r requirements.txt
```

4. Instalação do drive de  browser
```bash
rfbrowser install
```
Caso tenha falha, rodar o comando

```
python -m Browser.entry install
```


## Tutorias
