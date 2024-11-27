with clientes as (

    select * from {{ ref('stg_Clientes') }}

),


final as (

select
    ID_Cliente,
    Cliente,
    Edad
from clientes

)

select * from final
