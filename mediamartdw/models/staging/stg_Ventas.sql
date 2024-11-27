with ventas as (

    select * from {{ source('fabric-sql','raw_Ventas') }}

),
productos as (

    select * from {{ ref('stg_Productos') }}

),
clientes as (

    select * from {{ ref('stg_Clientes') }}

),
tiendas as (

    select * from {{ ref('stg_Tiendas') }}

),
vendedores as (

    select * from {{ ref('stg_Vendedores') }}

),


final as (

select
    ventas.Fecha_Pedido,
    ventas.Fecha_Envio,
    ventas.Fecha_Factura,
    productos.ID_Producto,
    clientes.ID_Cliente,
    tiendas.ID_Tienda,
    vendedores.ID_Vendedor,
    ventas.Precio_Unitario,
    ventas.Coste_Unitario,
    ventas.Cantidad

from ventas

left join productos on
    ventas.Codigo_Producto = productos.Codigo_Producto

left join clientes on
    ventas.Codigo_Cliente = clientes.Codigo_Cliente

left join tiendas on
    ventas.Codigo_Tienda = tiendas.Codigo_Tienda

left join vendedores on
    ventas.Codigo_Vendedor = vendedores.Codigo_Vendedor

)


select * from final
