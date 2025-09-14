-- Creating Roles and Granting them Specific Privileges 
-- Creating The Admin Role

CREATE USER admin WITH PASSWORD 'RonaldoTheGoat'; -- User Already EXISTS

-- Admin Privileges 
GRANT ALL PRIVILEGES ON SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO admin;

-- Admin abilities or permissions
GRANT USAGE, CREATE ON SCHEMA public TO admin;

-- Admin Grant/Revoke permissions
ALTER ROLE admin CREATEROLE;


-- Creating the Data Enginner ROLE
CREATE USER dataenginner WITH PASSWORD 'MessiFifaBaby';

-- Data Engineer permissions
GRANT USAGE ON SCHEMA public TO dataengineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dataengineer;
GRANT CREATE ON SCHEMA public TO dataengineer;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO dataengineer;


-- Creating Data Analyst Role 
CREATE USER data_analyst WITH PASSWORD 'LiverpooliStheBest';

-- Data Analyst Permissions
GRANT SELECT ON ALL TABLES IN SCHEMA public TO data_analyst; -- For Existing Tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO data_analyst; -- For Future Tables

REVOKE INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public FROM data_analyst;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO data_analyst; -- On All Existing Sequences
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE ON SEQUENCES TO data_analyst; -- For Future Sequences 

-- Creating the ml_engineer Role 
CREATE USER ml_engineer WITH PASSWORD 'SalahTheEngine';

-- ml_enginner Permissions
GRANT SELECT ON public.users TO ml_engineer;
GRANT SELECT ON public.stocks TO ml_engineer;
GRANT SELECT ON public.stock_prices TO ml_engineer;
GRANT SELECT ON public.transactions TO ml_engineer;

GRANT CREATE ON SCHEMA public TO ml_engineer;
GRANT USAGE ON SCHEMA public TO ml_engineer;

GRANT INSERT, UPDATE ON public.predicted_price TO ml_engineer; 


