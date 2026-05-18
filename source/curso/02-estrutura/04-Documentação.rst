
Documentação com libdoc
=======================

O utilitário `libdoc` do Robot Framework gera documentação para bibliotecas, recursos
e arquivos de variáveis. Ele suporta saída em HTML e JSON.

Sintaxe básica
--------------

robot.libdoc [OPÇÕES] <biblioteca_ou_arquivo> <arquivo_de_saida>

Exemplos comuns
---------------

- Gerar HTML para uma biblioteca (ex.: BibliotecaPython):

	robot.libdoc BibliotecaPython BibliotecaPython.html

- Gerar JSON:

	robot.libdoc --format JSON BibliotecaPython BibliotecaPython.json

- Forçar formato HTML explicitamente (opcional):

	robot.libdoc --format HTML BibliotecaPython BibliotecaPython.html

Gerar documentação para múltiplas pastas
---------------------------------------

Libdoc não aceita múltiplos inputs numa só invocação, então execute-o para cada
arquivo/biblioteca. Exemplos em shell e PowerShell:

- Bash (Linux/macOS/WSL):

	for f in path/para/pasta1/*.py path/para/pasta2/*.py; do
			robot.libdoc --format HTML "$f" "docs/$(basename "$f" .py).html"
			robot.libdoc --format JSON "$f" "docs/$(basename "$f" .py).json"
	done

- PowerShell (Windows):

	Get-ChildItem -Path .\pasta1, .\pasta2 -Filter *.py | ForEach-Object {
			$in = $_.FullName
			$name = $_.BaseName
			robot.libdoc --format HTML $in ("docs\$name.html")
			robot.libdoc --format JSON $in ("docs\$name.json")
	}

Dicas
-----

- Garanta que o ambiente Python com Robot Framework esteja ativo (virtualenv/venv).
- Se a biblioteca requer dependências, instale-as antes de executar o libdoc.
- Ajuste caminhos de entrada/saída conforme sua estrutura de projeto.

Referência rápida
-----------------

robot.libdoc --help

