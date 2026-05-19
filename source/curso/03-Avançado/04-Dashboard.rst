Dashboard do Robot Framework
===========================

O `robotdashboard` fornece uma interface web para visualizar relatórios de execução do Robot Framework.

Uso básico
----------

Para iniciar o servidor de dashboard a partir de um arquivo de saída do Robot Framework:

.. code-block:: bash

   robotdashboard -o output.xml 

O argumento -o indica o caminho do arquivo output do robot.
Após rodar o código, o robot gerará dois arquivos, robot_results.db e robot_dashboard.html. 
O primeiro serve como banco de dados para organizar as ifnormações e o segundo é o html com os gráficos. Basta
acessar no browser para ter uma melhor analise dos dados

Criando o servidor
-------

A biblioteca também permite criar um servidor para que possamos acessar a dashboard sem precisar ter acesso ao arquivo html

.. code-block:: bash

   robotdashboard -o output.xml --server 127.0.0.1:8543

Neste caso, a dashboard ficará disponível na porta 8543. Verifique a documentação para verificar como colocar autentificação ou ssl
https://marketsquare.github.io/robotframework-dashboard/dashboard-server.html


Lendo multiplos arquivos 
--------

Muitas vezes temos diversos arquivos output.xml porque rodamos diversos robos
O robotdashboard permite ler arquivo por arquivo ou ler todos os arquivos output de uma determinada pasta

.. code-block:: bash

   robotdashboard -o output.xml -o output1.xml --server 127.0.0.1:8543

.. code-block:: bash

robotdashboard -f ./report --server 127.0.0.1:8543