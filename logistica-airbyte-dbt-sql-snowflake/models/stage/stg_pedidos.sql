select *
from
    {{ source('logistica_schema', 'pedidos') }}
