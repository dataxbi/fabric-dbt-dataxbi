with clientes as (

    select * from {{ source('MediaMartDW','raw_Clientes') }}

),


final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Cliente'])}} as ID_Cliente,
    *
from clientes


)

select * from final
