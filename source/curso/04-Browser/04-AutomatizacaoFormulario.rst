===========================
Select Options By e Checkbox
===========================


No contexto de RPA (Robotic Process Automation), uma das tarefas mais comuns é interagir com formulários web. Isso inclui:

- Selecionar opções em listas (`select`, dropdowns)
- Marcar e desmarcar checkboxes
- Validar estados de campos
- Automatizar fluxos de cadastro e filtros

No :code:`Robot Framework`, principalmente utilizando a biblioteca :code:`Browser`, existem keywords específicas para facilitar esse processo.

Este material apresenta o uso de:

- :code:`Select Options By`
- :code:`Check Checkbox`
- :code:`Uncheck Checkbox`

Esses comandos são muito utilizados em automações RPA corporativas.

----------------------------------------
Cenário comum em RPA
----------------------------------------

Imagine um robô que:

- acessa um portal corporativo
- filtra relatórios
- seleciona um departamento
- marca permissões
- envia formulários automaticamente

Exemplo real:

- Selecionar o setor "Financeiro"
- Marcar "Receber notificações"
- Executar a busca

Essas interações são extremamente comuns em:

- ERPs
- SAP
- CRMs
- Portais internos
- Sistemas governamentais
- E-commerces

----------------------------------------
Select Options By
----------------------------------------

A keyword :code:`Select Options By` é utilizada para selecionar opções em elementos HTML do tipo:

.. code-block:: html

    <select>
        <option>Financeiro</option>
        <option>RH</option>
        <option>TI</option>
    </select>

Exemplo usando Browser Library
===============================

.. code-block:: robot

    Select Options By    id=departamento    text    Financeiro

Estrutura
==========

.. code-block:: robot

    Select Options By    LOCALIZADOR    TIPO    VALOR

Tipos suportados
=================

+------------+--------------------------------+
| Tipo       | Descrição                      |
+============+================================+
| text       | Texto visível da opção         |
+------------+--------------------------------+
| value      | Valor do atributo value        |
+------------+--------------------------------+
| index      | Índice da opção                |
+------------+--------------------------------+

Exemplos
=========

Selecionando pelo texto:

.. code-block:: robot

    Select Options By    id=estado    text    São Paulo

Selecionando pelo value:

.. code-block:: robot

    Select Options By    id=estado    value    SP

Selecionando pelo índice:

.. code-block:: robot

    Select Options By    id=estado    index    2

----------------------------------------
Boas práticas em RPA
----------------------------------------

Em automações RPA, prefira:

- IDs estáveis
- Seletores previsíveis
- Evitar XPath complexo quando possível

Bom exemplo:

.. code-block:: robot

    id=departamento

Evitar:

.. code-block:: robot

    xpath=/html/body/div[4]/div/select

----------------------------------------
Check Checkbox
----------------------------------------

Checkboxes representam opções booleanas:

- verdadeiro/falso
- ativo/inativo
- marcado/desmarcado

HTML exemplo:

.. code-block:: html

    <input type="checkbox" id="receber_email">

Marcando checkbox
==================

.. code-block:: robot

    Check Checkbox    id=receber_email

Esse comando garante que o checkbox fique marcado.

Mesmo que já esteja marcado, o Robot Framework não falhará.

----------------------------------------
Uncheck Checkbox
----------------------------------------

Para desmarcar:

.. code-block:: robot

    Uncheck Checkbox    id=receber_email

Muito útil em RPA quando:

- o sistema mantém estado anterior
- o robô precisa garantir comportamento consistente

----------------------------------------
Validação de checkbox
----------------------------------------

Também é possível validar o estado.

Exemplo:

.. code-block:: robot

    Checkbox Should Be Selected    id=receber_email

Ou:

.. code-block:: robot

    Checkbox Should Not Be Selected    id=receber_email

----------------------------------------
Exemplo completo
----------------------------------------

O código .robot mostra uma automatização completa do preenchimento do formulário http://sampleapp.tricentis.com/
