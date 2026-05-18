Resultado dos testes
=====================

Arquivos gerados pelo Robot Framework
-------------------------------------

Ao executar testes com Robot Framework, três arquivos principais são gerados na pasta de saída:

- output.xml: arquivo XML contendo toda a informação bruta dos testes (suites, casos, passos, tempos, tags e variáveis). É usado como fonte para gerar relatórios e logs.
- report.html: relatório resumido em HTML com o status das suites e casos; fornece navegação pela estrutura de testes e estatísticas gerais.
- log.html: log detalhado em HTML com passos, mensagens, capturas (screenshots) e traceback de falhas; ideal para depuração.

Exemplos de uso
---------------

1) Gerar os arquivos ao executar um teste:

	 robot tests/minha_suite.robot

	 Após a execução, a pasta raiz conterá output.xml, report.html e log.html.

2) Visualizar rapidamente o relatório:

	 - Abrir report.html no navegador para ver um resumo dos resultados.
	 - Abrir log.html no navegador para inspecionar detalhes do que aconteceu em cada passo.

3) Regerar report.html e log.html a partir de um output.xml existente:

	 rebot --output output.xml --report report.html --log log.html

Conteúdo e quando usar cada arquivo
----------------------------------

- output.xml
	- Formato: XML estruturado.
	- Uso: entrada para ferramentas de integração contínua, processamento programático dos resultados e para regenerar reports/logs.

- report.html
	- Conteúdo: resumo por suite/caso, estatísticas (passed/failed/total), tempo de execução e links para o log.
	- Quando abrir: para ter uma visão rápida do estado dos testes e identificar suites com falhas.

- log.html
	- Conteúdo: passo a passo dos testes, mensagens de log, níveis (INFO/DEBUG/ERROR), screenshots e tracebacks.
	- Quando abrir: para investigar falhas, entender a sequência de ações e encontrar a causa raiz.

