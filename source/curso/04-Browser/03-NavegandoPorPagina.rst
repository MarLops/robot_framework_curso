Navegação por página
-----------------

Usualmente,os sites são carregados a medida que navegamos verticalmente , sendo assim
é necessário que o robo certifique-se que toda a página foi carregando

Além disso, uam prática usual é disponibilizar dados por páginas. No caso da amazon,
o número de páginas é disponibilizado no final e o botão next permiti acessar a página seguinte

O primeiro problema pode ser resolvido com o keyworkd "Scroll By" , e o segundo; "Get text"

Scroll By
---------------


O keyword 'Scroll By' permite navegar horizontalmente e/ou verticalmente no site. O exemplo abaixo mostra
a navegação vertical até chegar na metade da página

.. code-block:: robotframework

    *** Test Cases ***
    Navegando
        Scroll By    vertical=50%
        
Se quisemos navegar até o final, podemos mudar o parâmetro ou usar For  


.. code-block:: robotframework

    *** Test Cases ***
    Navegando
        FOR ${i} IN RANGE 2
            Scroll By    vertical=50%
        END

Get text
-----------------

A forma mais simples de extrair texto de um componente é usando 'Get text'.
No caso da amazon, o componente abaixo possui 

.. code-block:: html
    <span class="s-pagination-item s-pagination-disabled" role="button" tabindex="0" aria-disabled="true">20</span>

Se observamos a página, existe varios span com a classe s-pagination-item , porém somente um possui a classe s-pagination-disabled.
Usando o xpath, podemos extrair das duas formas


.. code-block:: robotframework

    *** Test Cases ***
    Obtendo o numero de pagina
        ${pagina}=  Get Text    xpath=//span[contains(@class,'s-pagination-item')][last()]
        RETURN ${pagina}


.. code-block:: robotframework

    *** Test Cases ***
    Obtendo o numero de pagina
        ${pagina}=  Get Text    xpath=//span[contains(@class,'s-pagination-disabled')]
        RETURN ${pagina}


Usando o número de página, FOR RANGE e OperationSystem, vamos criar um robo para extrair todas as páginas
