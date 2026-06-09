# 🚗 Sistema de Controle de Vagas de Estacionamento

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/postgresql-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

Este repositório contém o projeto final da disciplina de Banco de Dados II, desenvolvido com base em Metodologias Ativas de Aprendizagem. O objetivo principal é a aplicação prática de conceitos avançados de banco de dados relacional através do desenvolvimento de um CRUD para um Sistema de Gestão e Controle de Vagas de Estacionamento.

## 👥 Equipe
* BERNARDO RZATKI DA SILVA DE SOUZA
* BRUNO VIEIRA CORRÊA
* JENIFER DA SILVA VIEIRA
* RUAN FIORI MARCELINO

## 🛠️ Tecnologias Utilizadas
* **Backend:** Java com Spring Boot 
* **Banco de Dados:** PostgreSQL 
* **Controle de Versão:** Git e GitHub 

## 📦 Estrutura e Requisitos do Banco de Dados (PostgreSQL)

O banco de dados foi modelado e implementado aplicando as seguintes exigências do projeto:

* **Criação de Banco, Tabelas e Relacionamentos** (Modelo Físico normalizado)
* **Chaves e Integridade Referencial** (PKs e FKs implementadas)
* **Carga Inicial:** Scripts para popular tabelas com no mínimo 10 itens de exemplo
* **Objetos de Banco de Dados:**
  * 3 Functions / Procedures
  * 1 Trigger 
  * 3 Views
  * Índices para otimização de consultas

## 🚀 Funcionalidades e Regras de Negócio (Melhorias Implementadas)

O sistema de CRUD (Adição, Edição, Remoção e Listagem) foi construído garantindo as seguintes validações e melhorias:

- **Validação de Dados Vazios:** O sistema não permite gravar informações em branco (ex: placa do carro, nome do cliente).
- **Validação de Valores:** Impede o cadastro de valores monetários (preço da vaga/hora) iguais a zero ou negativos.
- **Integridade de Registros:** Não é possível gerar uma entrada ou ticket de estacionamento para clientes ou vagas que não existam no sistema.
- **Dados Reais e Sequenciais:** Utilização de dados coerentes para testes e chaves sequenciais.
- **Interface Organizada:** Os dados retornados são exibidos em listas e pesquisas estruturadas com títulos e separadores adequados.
