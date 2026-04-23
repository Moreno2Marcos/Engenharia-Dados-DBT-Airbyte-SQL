-- Macro

-- Inicia a definição da macro com parâmetros:
-- model = modelo do dbt que será testado
-- column_name = coluna numérica a ser validada
-- min_value = valor mínimo aceito
-- max_value = valor máximo aceito
{% macro test_accepted_range(model, column_name, min_value, max_value) %}

-- Cria uma CTE chamada "validation" para armazenar os valores
-- que não respeitam a faixa definida nas regras de negócio da fintech
WITH validation AS (
    SELECT
        {{ column_name }} AS value   -- Seleciona os valores da coluna especificada
    FROM {{ model }}                 -- Seleciona os dados do modelo informado
    WHERE {{ column_name }} < {{ min_value }}   -- Valores abaixo do mínimo permitido
       OR {{ column_name }} > {{ max_value }}   -- Valores acima do máximo permitido
)

-- Retorna a quantidade de registros que falharam no teste
SELECT COUNT(*) AS failures
FROM validation

-- O teste falha se existir pelo menos um registro fora da faixa esperada
HAVING COUNT(*) > 0

{% endmacro %}