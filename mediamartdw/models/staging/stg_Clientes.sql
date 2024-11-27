with clientes as (

    select * from {{ source('mediamartdw','raw_Clientes') }}

),


renombrada as (

select
    [Codigo Cliente] as Codigo_Cliente,
    Cliente,
    Edad
from clientes

),


final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Cliente'])}} as ID_Cliente,
    *
from renombrada


)

select * from final
