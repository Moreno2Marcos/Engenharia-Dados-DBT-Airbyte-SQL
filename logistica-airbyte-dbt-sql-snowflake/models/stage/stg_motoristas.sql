select *
from
    {{ source('logistica_schema', 'motoristas') }}
