select *
from
    {{ source('logistica_schema', 'entregas') }}
