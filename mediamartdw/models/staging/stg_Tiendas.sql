with tiendas as (

    select * from {{ source('raw','raw_Tiendas') }}

),
municipios as (

    select * from {{ source('raw','raw_Municipios') }}

),


combinada as (

select

    tiendas.Codigo_Tienda,
    tiendas.Tienda,
    municipios.CCAA,
    municipios.Provincia,
    municipios.Municipio

from tiendas

left join municipios on
    tiendas.Codigo_Municipio = municipios.INE5

),


final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Tienda'])}} as ID_Tienda,
    *

from combinada

)


select * from final
