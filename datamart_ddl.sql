-- добавьте код сюда



drop table if exists analysis.dm_rfm_segments;
create table analysis.dm_rfm_segments (
        user_id INT PRIMARY KEY  ,
        recency INT NOT NULL CHECK (recency>=1 and recency<=5), 
        frequency INT NOT NULL CHECK (frequency>=1 and frequency<=5),
        monetary_value INT NOT NULL CHECK (monetary_value>=1 and monetary_value<=5)
)