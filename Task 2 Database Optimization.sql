-- Creating Indexes.

-- Portfolios Table Indexes 
CREATE INDEX idx_portfolios_user_id ON
portfolios(user_id);
CREATE INDEX idx_portfolios_stock_id ON
portfolios(stock_id);

-- Stockprices Table Indexes
CREATE INDEX idx_stock_prices_stock_id ON
stock_prices(stock_id);
-- Composite Index to the Stockprices on stock_id and timestamp. 
CREATE INDEX idx_stock_prices_stock_id_timestamp ON
stock_prices(stock_id, timestamp);

-- Transactions Table INDEXES
CREATE INDEX idx_transactions_user_id ON 
transactions(user_id);
CREATE INDEX idx_transactions_stock_id ON
transactions(stock_id);


-- Partitioning TABLES
-- Partitioning Stock Prices table by timestamp 
-- Creating Parent Table
CREATE TABLE stock_prices_partitioned(
	LIKE stock_prices INCLUDING DEFAULTS
)PARTITION BY RANGE(timestamp);

-- Creating Composite Primary Keys for the table to be able to accept both price_id and timestamp as Primary Keys.
ALTER TABLE stock_prices_partitioned
ADD PRIMARY KEY(price_id, timestamp);

-- Recreating the Foreign Key stock_id
ALTER TABLE stock_prices_partitioned
ADD CONSTRAINT fk_stock_prices_stock_id
	FOREIGN KEY(stock_id)
	REFERENCES stocks(stock_id);

-- Creating Monthly partitions of the stock prices table by timestamp 
CREATE TABLE stock_prices_2025_06 PARTITION OF stock_prices_partitioned
FOR VALUES FROM ('2025-06-01') TO ('2025-07-01');

CREATE TABLE stock_prices_2025_05 PARTITION OF stock_prices_partitioned
FOR VALUES FROM ('2025-05-01') TO ('2025-06-01');

CREATE TABLE stock_prices_2025_04 PARTITION OF stock_prices_partitioned
FOR VALUES FROM ('2025-04-01') TO ('2025-05-01');

CREATE TABLE stock_prices_2025_03 PARTITION OF stock_prices_partitioned
FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

CREATE TABLE stock_prices_2025_02 PARTITION OF stock_prices_partitioned
FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE stock_prices_2025_01 PARTITION OF stock_prices_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');


-- Creating Indexes on the just created partitions to speed up performances even more. 
CREATE INDEX idx_stock_prices_2025_06_timestamp ON
stock_prices_2025_06 (stock_id, timestamp);

CREATE INDEX idx_stock_prices_2025_05_timestamp ON
stock_prices_2025_05 (stock_id, timestamp);

CREATE INDEX idx_stock_prices_2025_04_timestamp ON
stock_prices_2025_04 (stock_id, timestamp);

CREATE INDEX idx_stock_prices_2025_03_timestamp ON
stock_prices_2025_03 (stock_id, timestamp);

CREATE INDEX idx_stock_prices_2025_02_timestamp ON
stock_prices_2025_02 (stock_id, timestamp);

CREATE INDEX idx_stock_prices_2025_01_timestamp ON
stock_prices_2025_01 (stock_id, timestamp);



-- Partitioning the Transactions table by Timestamp 
-- Creating Parent Table 
CREATE TABLE transactions_partitioned(
	LIKE transactions INCLUDING DEFAULTS
)PARTITION BY RANGE (timestamp);

-- Creating Composite Primary Keys for the table to be able to accept both transaction_id and timestamp as Primary Keys.
ALTER TABLE transactions_partitioned
ADD PRIMARY KEY (transaction_id, timestamp);

-- Recreating the Foreign Key user_id
ALTER TABLE transactions_partitioned
ADD CONSTRAINT fk_transactions_user_id
	FOREIGN KEY(user_id)
	REFERENCES users(user_id);

-- Recreating the Foreign Key stock_id
ALTER TABLE transactions_partitioned
ADD CONSTRAINT fk_tranactions_stock_id
	FOREIGN KEY(stock_id)
	REFERENCES stocks(stock_id);

-- Creating Quarterly partitions of the transactions table by timestamp
CREATE TABLE transactions_2025_03 PARTITION OF transactions_partitioned
FOR VALUES FROM ('2025-03-01') TO ('2025-06-01');

CREATE TABLE transactions_2025_01 PARTITION OF transactions_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2025-03-01');

CREATE TABLE transactions_2024_09 PARTITION OF transactions_partitioned
FOR VALUES FROM ('2024-09-01') TO ('2025-01-01');

CREATE TABLE transactions_2024_06 PARTITION OF transactions_partitioned
FOR VALUES FROM ('2024-06-01') TO ('2024-09-01');

CREATE TABLE transactions_2024_03 PARTITION OF transactions_partitioned
FOR VALUES FROM ('2024-03-01') TO ('2024-06-01');

-- Creating Indexes on the just created transactions partitions to speed up performances even more. 
CREATE INDEX idx_transactions_2025_03_timestamp ON
transactions_2025_03 (stock_id, timestamp);

CREATE INDEX idx_transactions_2025_01_timestamp ON
transactions_2025_01 (stock_id, timestamp);

CREATE INDEX idx_transactions_2024_09_timestamp ON
transactions_2024_09 (stock_id, timestamp);

CREATE INDEX idx_transactions_2024_06_timestamp ON
transactions_2024_06 (stock_id, timestamp);

CREATE INDEX idx_transactions_2024_03_timestamp ON
transactions_2024_03 (stock_id, timestamp);


-- Renaming the tables stock_prices to stock_price_old and stock_prices_partitioned table to stock_prices 
ALTER TABLE stock_prices RENAME TO stock_prices_old;
ALTER TABLE stock_prices_partitioned RENAME TO stock_prices;

-- Renaming the tables transactions to transactions_old and transactions_partitioned table to transactions 
ALTER TABLE transactions RENAME TO transactions_old;
ALTER TABLE transactions_partitioned RENAME TO transactions;


-- AFTER CREATING THE PARTITIONS MAKE SURE TO MAKE A QUERY, CODE OR SYSTEM FOR FUTURE PARTITIONS