create table trade(
    direction   varchar(12),
    year        year,
    country     varchar(255),
    comm_code   int,
    commodity   varchar(255),
    value       bigint  -- just in case ...
)
;
