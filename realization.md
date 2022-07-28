# Витрина RFM

## 1.1. Выясните требования к целевой витрине.

Постановка задачи выглядит достаточно абстрактно - постройте витрину. Первым делом вам необходимо выяснить у заказчика детали. Запросите недостающую информацию у заказчика в чате.

Зафиксируйте выясненные требования. Составьте документацию готовящейся витрины на основе заданных вами вопросов, добавив все необходимые детали.

-----------

        a. Куда сложить витрину? - Витрина должна располагаться в той же базе в схеме analysis
        b. Какова структура витрины? - Витрина должна состоять из таких полей:
            user_id
            recency (число от 1 до 5)
            frequency (число от 1 до 5)
            monetary_value (число от 1 до 5)
        c. Данные за какой период загружать в витрину? - В витрине нужны данные с начала 2022 года
        d. Как назвать витрину? - Назовите витрину dm_rfm_segments
        e. Как часто стоит обновлять витрину? - Обновления не нужны.
        f. Что такое успешно выполненный заказ? - Это заказ со статусом Closed


## 1.2. Изучите структуру исходных данных.

Полключитесь к базе данных и изучите структуру таблиц.
Если появились вопросы по устройству источника, задайте их в чате.
Зафиксируйте, какие поля вы будете использовать для расчета витрины.

-----------


Используемые поля для построения витрины:
    1. Users.id, Users.Name 
    2. Orders.order_id, Orders.order_ts, Orders.status, Orders.user_id, Orders.Payment
    3. orderstatuses.id, orderstatuses.key



## 1.3. Проанализируйте качество данных

Изучите качество входных данных. Опишите, насколько качественные данные хранятся в источнике. Так же укажите, какие инструменты обеспечения качества данных были использованы в таблицах в схеме production.

-----------

1.3.1. Проверки  целостности схемы Production (кол-во)
                                                                            таблицы
                                                                   | orderitems | orders    | orderstatuses | orderstatuslog | products | users |
    a. по первичному ключу (исключает дубли и нулевые значения):  |     1      |    1      |       1       |       1        |    1     |   1   |
    b. по внешним ключам (ссылочная целостность):                 |     2      |    - (!)  |       2       |       2        |    -     |   -   |
    c. Check                                                      |     3      |    1      |       -       |       -        |    1     |   -   |
    d. not-Null                                                   |     -      |    -      |       -       |       -        |    -     |   -   |
    e. Unique                                                     |     -      |    -      |       -       |       1        |    -     |   -   |
Замечания: (!) не хвататает внешнего ключа в таблице Orders поле User_id и status. 

Подробное описание см в файле data_quality.md




1.3.2 Пустые значения в полях, используемых для расчета витрины (см.1.2) - значений Null нет.
1.3.3 Типы и формат данных - в порядке.







## 1.4. Подготовьте витрину данных

Теперь, когда требования понятны, а исходные данные изучены, можно приступить к реализации.

### 1.4.1. Сделайте VIEW для таблиц из базы production.**

Вас просят при расчете витрины обращаться только к объектам из схемы analysis. Чтобы не дублировать данные (данные находятся в этой же базе), вы решаете сделать view. Таким образом, View будут находиться в схеме analysis и вычитывать данные из схемы production. 

Напишите SQL-запросы для создания пяти VIEW (по одному на каждую таблицу) и выполните их. Для проверки предоставьте код создания VIEW.

```SQL
--Впишите сюда ваш ответ


```

### 1.4.2. Напишите DDL-запрос для создания витрины.**

Далее вам необходимо создать витрину. Напишите CREATE TABLE запрос и выполните его на предоставленной базе данных в схеме analysis.

```SQL
--Впишите сюда ваш ответ


```

### 1.4.3. Напишите SQL запрос для заполнения витрины

Наконец, реализуйте расчет витрины на языке SQL и заполните таблицу, созданную в предыдущем пункте.

Для решения предоставьте код запроса.

```SQL
--Впишите сюда ваш ответ


```


