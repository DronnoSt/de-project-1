# 1.3. Качество данных

## Оцените, насколько качественные данные хранятся в источнике.
Опишите, как вы проверяли исходные данные и какие выводы сделали.

## Укажите, какие инструменты обеспечивают качество данных в источнике.
Ответ запишите в формате таблицы со следующими столбцами:
- `Наименование таблицы` - наименование таблицы, объект которой рассматриваете.
- `Объект` - Здесь укажите название объекта в таблице, на который применён инструмент. Например, здесь стоит перечислить поля таблицы, индексы и т.д.
- `Инструмент` - тип инструмента: первичный ключ, ограничение или что-то ещё.
- `Для чего используется` - здесь в свободной форме опишите, что инструмент делает.

Ответ:

| Таблицы                    | Объект (поле над которым огрнаиечние)         | Инструмент        | Для чего используется |
| -------------------        | ---------------------------                      | ---------------   | --------------------- |
| production.Products        | products_pkey   (id)                      | Первичный ключ    | Обеспечивает уникальность записей о пользователях |
| production.Products        | products_price_check (price)              | Диапазон значений | Проверяет что бы цена была >=0    |
| production.Products        | products_pkey   (id)                      | Индекс            | Ускорение поиска по таблице Product|
| production.orderitems      | orderitems_check (discount, price)        | Диапазон значений | Проверяет что скидка >=0 и меньше цены  |
| production.orderitems      | orderitems_order_id_product_id_key        | Уникальный ключ   | Проверяет уникальность пары order_id и product_id |
                                (order_id, product_id)
| production.orderitems      | orderitems_pkey  (id)                     | Первичный ключ    | Обеспечивает уникальность записей о позициях заказов
| production.orderitems      | orderitems_price_check (price)            | Диапазон значений | Проверяет что бы цена была >=0 |
| production.orderitems      | orderitems_quantity_check (quantity)      | Диапазон значений | Проверяет что бы количество было >0 |
| production.orderitems      | orderitems_order_id_fkey (order_id)       | Внешний ключ      | Проверяет что бы значение order_id было в таблице Orders |
| production.orderitems      | orderitems_product_id_fkey (product_id)   | Внешний ключ      | Проверяет что бы значение product_id было в таблице Products |
| production.orderitems      | orderitems_order_id_product_id_key        | Инедекс           | Ускорение поиска по таблице orderitems      |
                                 (order_id, product_id)       
| production.orderitems      | orders_pkey (id)                          | Инедекс           | Ускорение поиска по таблице orderitems      |
| production.orders          | orders_check (cost, payment,bonus_payment)| Диапазон значений | Проверяет что расходы равны сумме платежа и бонус |

| production.orders          | orders_pkey (order_id)                    | Первичный ключ    | Обеспечивает уникальность записей о заказах |
| production.orders          | orders_pkey (order_id)                    | Индекс            | Ускорение поиска по таблице orders|
| production.orderstatuses   | orderstatuses_pkey (id)                   | Первичный ключ    | Обеспечивает уникальность записей о статусах заказов |
| production.orderstatuses   | orderstatuses_pkey (id)                   | Инедекс           | Ускорение поиска по таблице orderstatuses      |
| production.orderstatuslog  | orderstatuslog_order_id_status_id_key     | Уникальный ключ   | Проверяет уникальность пары order_id и status_id |
                                (order_id, status_id)
| production.orderstatuslog  | orderstatuslog_pkey  (id)                 | Первичный ключ    | Обеспечивает уникальность записей в журнале статусов заказов |
| production.orderstatuslog  | orderstatuslog_order_id_fkey (order_id)   | Внешний ключ      | Проверяет что бы значение order_id было в таблице Orders |
| production.orderstatuslog  | orderstatuslog_status_id_fkey (status_id) | Внешний ключ   |Проверяет что бы значение status_id было в таблице OrderStatuses |
| production.orderstatuslog  | orderstatuslog_order_id_status_id_key     | Индекс            | Ускорение поиска по таблице orderstatuslog | 
                                (order_id, status_id)
| production.orderstatuslog  | orderstatuslog_pkey  (id)                 | Индекс            | Ускорение поиска по таблице orderstatuslog |    
| production.users           | users_pkey  (id)                          | Первичный ключ    | Обеспечивает уникальность записей о пользователях 
| production.users           | users_pkey  (id)                          | Инедекс           | Ускорение поиска по таблице users | 

