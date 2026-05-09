select *
from
    {{ source('logistica_schema', 'clientes') }}
