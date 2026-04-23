-- Configura o modelo de contas para ser materializado como uma "view" no banco de dados

{{ config(materialized='view') }}

WITH contas_base AS (
    SELECT *
    FROM tb_contas
)

SELECT
    conta_id,
    tipo_conta,
    saldo,
    status_conta
FROM contas_base