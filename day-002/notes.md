# Day 002 — Clients, connections, schemas

## Excel analogue
- Opening Excel = starting a **client** (DBeaver, `psql`)
- The `.xlsx` file path = **host + port + database name**
- A workbook can hold many sheets. A database can hold many **schemas**. Each schema is a folder of tables.
- Sheet tab name = **table**
- Formula bar that shows column headers = **`information_schema.columns`**
- Clicking around the workbook tree in Excel ≠ writing a query. The DBeaver tree is a map. `information_schema` is the same map as SQL.

## What this is
A connection is five facts, not one:

| Fact | Your locked value | What it means |
|---|---|---|
| Host | `localhost` | Machine running Postgres |
| Port | `5432` | Door on that machine |
| User | `postgres` | Who you claim to be |
| Database | `pagila` (practice) | Which catalog you opened |
| Schema | `public` (default) | Namespace inside that database |

DBeaver is a **client**. PostgreSQL 18 is the **server**. They talk over TCP on `localhost:5432`.

`public` is a schema, not the database. `pagila` is the database. Mixing those two words is the Day 2 failure mode.

Postgres also has:

- `information_schema` — SQL-standard catalog views. Portable-ish. Use this first.
- `pg_catalog` — Postgres-native catalogs (`pg_class`, `pg_namespace`). Richer, engine-specific.

`psql` `\d film` is a client shortcut. In DBeaver you do the same job with:

```sql
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'film'
ORDER BY ordinal_position;
```

## Why this day exists
You cannot trust a query until you know:

1. Which database the editor is pointed at (`current_database()`).
2. Which schema unqualified names resolve to (`current_schema` / `search_path`).
3. What columns actually exist (catalog, not memory).

Day 3 creates tables in the `learning` sandbox. Day 4 walks Pagila relationships. Both break if you are connected to the wrong database.

## Pitfalls on Day 2
- DBeaver can be connected to `postgres` (the maintenance DB) while you *think* you are in `pagila`. Look at the editor tab: it must say `public@pagila` before you run practice queries.
- `CREATE DATABASE` / `DROP DATABASE` cannot run inside a multi-statement transaction. Do not wrap today's checks in `BEGIN`.
- Unquoted identifiers fold to lowercase. `Film` and `film` are the same. `"Film"` is not.
- `information_schema.tables` includes views. Filter `table_type = 'BASE TABLE'` when you want real tables.
- `search_path` defaults to `"$user", public`. If a schema named after your user exists, unqualified names hit that first.
- Listing tables from `information_schema` without `table_schema = 'public'` dumps catalogs you do not care about yet.

## Today's only job
Confirm the connection five-tuple. List schemas. List public tables. Describe `film` and `customer` from `information_schema.columns`. Leave Pagila data alone — no writes.
