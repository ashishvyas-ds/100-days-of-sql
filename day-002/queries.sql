

-- Day 002 — Clients, connections, schemas
-- Database: pagila
-- Schema:   public
-- Goal:     prove where I am, then describe film + customer from the catalog
-- Expected: identity row, schema list, table list, column lists

-- Q1. Where is this session, exactly?
-- Business question: am I on localhost / postgres / pagila before I touch data?
SELECT
    current_user,
    session_user,
    current_database() AS database,
    current_schema     AS schema,
    inet_server_addr() AS server_addr,
    inet_server_port() AS server_port,
    now()              AS server_now;

-- Q2. What engine answered?
SELECT version();

-- Q3. What is my search_path? (unqualified table names walk this list)
SHOW search_path;

SELECT current_schemas(true) AS schemas_on_path;

-- Q4. Which schemas exist in this database?
-- Excel analogue: list of folders inside the workbook
SELECT schema_name
FROM information_schema.schemata
ORDER BY schema_name;

-- Q5. Which base tables live in public?
-- Same idea as Day 001 Q3, kept here so the catalog loop is one file
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Q6. \d film — column list from information_schema
-- Business question: what does a film row actually contain?
SELECT
    ordinal_position,
    column_name,
    data_type,
    character_maximum_length,
    numeric_precision,
    numeric_scale,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'film'
ORDER BY ordinal_position;

-- Q7. \d customer — same catalog read for the other table Day 001 already peeked at
SELECT
    ordinal_position,
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customer'
ORDER BY ordinal_position;

-- Q8. How wide is each public table? (columns, not rows)
-- Business question: which tables are "wide sheets" vs skinny lookup lists?
SELECT
    table_name,
    COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name
ORDER BY column_count DESC, table_name;

-- Q9. Confirm film and customer exist, and only once
SELECT table_schema, table_name, table_type
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('film', 'customer')
ORDER BY table_name;

-- Q10. pg_catalog view of the same public tables (Postgres-native, not SQL-standard)
-- Keep this as a contrast, not a second source of truth
SELECT
    n.nspname  AS schema_name,
    c.relname  AS table_name,
    c.relkind  AS kind
FROM pg_catalog.pg_class c
JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'public'
  AND c.relkind = 'r'   -- ordinary table
ORDER BY c.relname;
