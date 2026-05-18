Pabot
----------


Pabot é uma ferramenta que permite executar robos em paralelo,
aproveitando múltiplos núcleos de CPU para reduzir o tempo total de execução.

Instalação
---------

Instale pabot via pip:

.. code-block:: bash

		pip install pabot

ou

.. code-block:: bash

		uv add pabot

Uso básico
----------

Execute testes em paralelo informando o número de processos:

.. code-block:: bash

		pabot --processes 4 tests/

Onde ``--processes`` define quantos processos (workers) serão usados. Se omitido,
pabot tenta decidir automaticamente um número adequado.

Executar múltiplas robos ao mesmo tempo
---------------------------------------

Se você tem várias robos, basta apontar para a pasta ou para
arquivos separados; pabot distribuirá os testes entre os processos:

.. code-block:: bash

		pabot --processes 4 tests/suite1 tests/suite2 tests/suite3


O pabot possui os argumentos do robot, sendo assim, podemos utilizar outpurdir , variable e os demais , discutidos anteriomente

Links úteis
----------

- Repositório e documentação do pabot: https://github.com/mkorpela/pabot

