select *
from
    {{ source('logistica_schema', 'veiculos') }}
