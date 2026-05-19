Criando sua própria biblioteca
=============================

Este documento descreve como criar uma biblioteca Python para Robot Framework, instalar essa
biblioteca e usá-la em um teste Robot Framework, de forma semelhante ao uso da biblioteca Browser.

1. Criar a biblioteca Python
---------------------------

Uma biblioteca Robot Framework pode ser uma classe Python simples com métodos públicos.
Cada método público torna-se uma keyword no Robot Framework.

Exemplo de biblioteca: `MinhaBiblioteca.py`

.. code-block:: python

    class MinhaBiblioteca:
        """Biblioteca de exemplo para Robot Framework."""

        def saudacao(self, nome: str = "mundo") -> str:
            """Retorna uma saudação para o nome informado."""
            return f"Olá, {nome}!"

        def somar(self, a: int, b: int) -> int:
            """Retorna a soma de dois números."""
            return a + b

2. Preparar a instalação da biblioteca
--------------------------------------

A melhor forma de instalar a biblioteca é empacotá-la como um módulo Python ou tornar o diretório
visível no `PYTHONPATH`.

Estrutura de exemplo:

.. code-block:: text

    minha_biblioteca/
    ├── minha_biblioteca/
    │   ├── __init__.py
    │   └── MinhaBiblioteca.py
    └── setup.py

O arquivo `setup.py` pode ser simples:

.. code-block:: python

    from setuptools import setup, find_packages

    setup(
        name="minha-biblioteca-robot",
        version="0.1.0",
        packages=find_packages(),
        install_requires=[],
        author="Seu Nome",
        description="Biblioteca de exemplo para Robot Framework",
    )

3. Instalar a biblioteca
------------------------

Para instalar localmente, use pip no diretório que contém `setup.py`:

.. code-block:: console

    pip install <biblioteca>


Ou se tiver usando uv

.. code-block:: console

    uv add <biblioteca>


Na pasta 06-CriandoBiblioteca, tem o arquivo .whl que foi criado baseado no projeto robot_personal_own.
Para instalar , pasta entrar na pasta e rodar


.. code-block:: console

    pip install robot_personal_own-0.1.0-py3-none-any.whl



4. Usar a biblioteca em um teste Robot Framework
------------------------------------------------

Após instalar a biblioteca, importe-a no arquivo `.robot` como qualquer outra biblioteca.
Suponha que `MinhaBiblioteca` esteja disponível após a instalação.

.. code-block:: robotframework

    *** Settings ***
    Library    MinhaBiblioteca

    *** Test Cases ***
    Saudacao funciona
        ${texto}=    Saudacao    Robot
        Should Be Equal    ${texto}    Olá, Robot!

    Soma funciona
        ${resultado}=    Somar    2    3
        Should Be Equal    ${resultado}    5


No caso da biblioteca, vamos usar a classe Main que esta no arquivo main

.. code-block:: robotframework

    *** Settings ***
    Library    my_library.main.Main

Agora podemos usar o keyword My Log.


6. Dicas finais
----------------

- Mantenha os nomes dos métodos claros e autoexplicativos.
- Use tipos e docstrings para melhorar a documentação das keywords.
- Se sua biblioteca precisar de dependências, adicione-as em `install_requires`.
- Para distribuição, publique no PyPI ou em um repositório interno.
