-- Testa se o saldo da conta está fora do intervalo definido
-- nas regras de negócio

SELECT *
FROM {{ ref('contas') }}
WHERE saldo < 0 OR saldo > 1000000