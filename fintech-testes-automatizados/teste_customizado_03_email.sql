-- Testa se o campo de e-mail contém o caractere @

SELECT *
FROM {{ ref('clientes') }}
WHERE email NOT LIKE '%@%'