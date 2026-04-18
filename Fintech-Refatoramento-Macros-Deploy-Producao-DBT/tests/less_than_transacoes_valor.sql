-- Testa se há alguma transação com valor maior ou igual a 450
-- não permitido de acordo com a regra de negócio definida
SELECT *
FROM {{ ref('transacoes') }}
WHERE valor >= 450