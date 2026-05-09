# POC Logística: Pipeline DataOps com PostgreSQL, Airbyte, Snowflake, dbt e Docker

Este projeto é uma POC prática de pipeline de dados aplicada a um cenário de logística, utilizando uma arquitetura ELT com PostgreSQL, Airbyte, Snowflake, dbt e Docker.

## Artigo no LinkedIn

O artigo completo sobre esta POC está disponível em: https://www.linkedin.com/pulse/poc-log%C3%ADstica-adapta%C3%A7%C3%A3o-pr%C3%A1tica-de-um-pipeline-dataops-iv%C3%A1n-moreno-uszye/

## Transparência

A arquitetura base do fluxo não é de minha autoria.  
Este projeto foi desenvolvido a partir de um fluxo de laboratório técnico usado como referência.

Minha contribuição foi adaptar o contexto para logística, modificar dados, estrutura, modelagem SQL, arquivos dbt e realizar ajustes práticos de ambiente, execução e troubleshooting.

## Objetivo

Simular um fluxo moderno de dados, desde uma origem transacional até modelos analíticos organizados para consumo.

O pipeline contempla:

- Criação de banco transacional em PostgreSQL
- Extração e carga com Airbyte
- Armazenamento em Snowflake
- Transformações com dbt
- Organização em camadas `stage` e `serve`
- Testes básicos de qualidade de dados
- Linhagem dos modelos dbt

## Stack utilizada

- PostgreSQL
- Docker
- Airbyte
- Snowflake
- dbt
- SQL

## Estrutura dos modelos dbt

```text
models/
│
├── sources.yml
│
├── stage/
│   ├── stg_clientes.sql
│   ├── stg_motoristas.sql
│   ├── stg_veiculos.sql
│   ├── stg_pedidos.sql
│   ├── stg_entregas.sql
│   └── schema.yml
│
└── serve/
    ├── dim_cliente.sql
    ├── dim_motorista.sql
    ├── dim_veiculo.sql
    ├── dim_rota.sql
    ├── fct_entrega.sql
    └── schema.yml
