-- Create Tables for the various fields.

-- Users Table 
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Stocks Table 
CREATE TABLE stocks(
	stock_id SERIAL PRIMARY KEY,
	symbol VARCHAR(10) NOT NULL UNIQUE,
	company_name VARCHAR(100) NOT NULL,
	sector VARCHAR(50),
	listed_on DATE
);

-- Stock Prices Table 
CREATE TABLE stock_prices(
	price_id SERIAL PRIMARY KEY,
	stock_id INTEGER,
	price DECIMAL(10,2) NOT NULL,
	timestamp TIMESTAMP NOT NULL,
	FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Transactions Table 
CREATE TABLE transactions(
	transaction_id SERIAL PRIMARY KEY,
	user_id INTEGER,
	stock_id INTEGER,
	transaction_type VARCHAR(10) NOT NULL,
	quantity INTEGER NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Portfolios Table 
CREATE TABLE portfolios(
	portfolio_id SERIAL PRIMARY KEY,
	user_id INTEGER,
	stock_id INTEGER,
	quantity INTEGER NOT NULL,
	average_price DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);