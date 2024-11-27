with ventas as (

    select * from {{ ref('stg_Ventas') }}

),


final as (

select
    Fecha_Pedido,
    Fecha_Envio,
    Fecha_Factura,
    ID_Producto,
    ID_Cliente,
    ID_Tienda,
    ID_Vendedor,
    Precio_Unitario,
    Coste_Unitario,
    Cantidad

from ventas

)

select * from final
