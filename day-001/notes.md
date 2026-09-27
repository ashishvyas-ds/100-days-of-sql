# Day 001 — What SQL is (from an Excel brain)

## Excel analogue
- A workbook = a **database**
- A sheet = a **table**
- A header row = **column names + types**
- A row = a **record**
- A formula column = a **SELECT expression** (computed, not stored, unless you choose to store it)
- A pivot = `GROUP BY`
- VLOOKUP = `JOIN`
- Filter dropdown = `WHERE`
- File → Save As of a filtered sheet = a `VIEW` or just a saved `.sql` file

## What this is
SQL (Structured Query Language) is how you talk to a relational database.

You do not click filters. You write a sentence that says what result you want. The database engine decides how to get it.

Four families:

| Family | Job | Examples |
|---|---|---|
| DQL | Read | `SELECT` |
| DML | Change rows | `INSERT`, `UPDATE`, `DELETE` |
| DDL | Change structure | `CREATE TABLE`, `ALTER`, `DROP` |
| TCL | All-or-nothing | `BEGIN`, `COMMIT`, `ROLLBACK` |

Days 1–65 are almost all DQL. That is what data people use 90% of the time.

## Why Postgres
One engine that can do standard SQL *and* JSON, windows, recursive queries, indexes, full-text. Learn here, then Snowflake / BigQuery / SQL Server are dialects, not new careers.

## Pitfalls on Day 1
- SQL is not case-sensitive for keywords. People write `SELECT` in caps by convention.
- Unquoted identifiers fold to lowercase in Postgres. `"Track"` and `track` are different.
- Every statement ends with `;`
- `NULL` is not an empty cell.

## Today's only job
Postgres running. DBeaver connected. This repo created. Two queries executed.
