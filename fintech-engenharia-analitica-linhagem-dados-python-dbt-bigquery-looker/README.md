# POC FinTech: Python, DBT, BigQuery e Looker Studio
POC de Analytics Engineering para contexto FinTech, com foco em ingestão de dados, modelagem analítica, documentação e visualização.

## Stack
- Python
- DBT
- BigQuery
- Looker Studio
- Docker

## Estrutura
- `stg_*.csv`: dados de entrada
- `fintech_carrega_dados_bigquery.py`: carga inicial para staging no BigQuery
- `staging/`: modelos dimensionais e fato
- `marts/`: modelos analíticos
- `sources.yml` e `schema.yml`: documentação e metadados
- `Dockerfile`: ambiente de execução

## Fluxo
1. Carregar arquivos CSV no BigQuery com Python  
2. Modelar dimensões e fato com DBT  
3. Gerar marts analíticos  
4. Documentar fontes, colunas e modelos  
5. Consumir dados no Looker Studio  

## Objetivo
Demonstrar um pipeline analítico simples e rastreável, da camada de staging até a visualização.

## Observação
O fluxo desta POC foi **baseado em referência de laboratório** e **adaptado para um cenário FinTech**. Não se trata de uma solução original integralmente autoral.

## Link do Artigo Publicado no Linkedin contendo a Contextualização completa do projeto:

https://www.linkedin.com/pulse/poc-fintech-pipeline-de-dados-com-python-dbt-bigquery-iv%25C3%25A1n-moreno-15cye
