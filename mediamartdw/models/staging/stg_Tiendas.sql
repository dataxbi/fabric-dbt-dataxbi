with tiendas as (

    select * from {{ source('mediamartdw','raw_Tiendas') }}

),
municipios as (

    select * from {{ ref('raw_Municipios') }}

),


renombrada as (

select

    tiendas.[Codigo Tienda] as Codigo_Tienda,
    tiendas.Tienda,
    municipios.CCAA,
    municipios.Provincia,
    municipios.Municipio

from tiendas

left join municipios on
    tiendas.[Codigo Municipio] = municipios.INE5

),


final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Tienda'])}} as ID_Tienda,
    *

from renombrada

)


select * from final
