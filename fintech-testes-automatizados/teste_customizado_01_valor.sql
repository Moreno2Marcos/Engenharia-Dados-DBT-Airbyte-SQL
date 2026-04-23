-- Testa se há alguma transação com valor menor ou igual a zero,
-- o que não é permitido pelas regras de negócio

SELECT *
FROM {{ ref('transacoes') }}
WHERE valor <= 0