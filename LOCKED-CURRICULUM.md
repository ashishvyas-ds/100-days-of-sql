# 100 Days of SQL — Locked Curriculum

**Owner:** Ashish Vyas (`ashishvyas-ds`)  
**Profile:** 17 years data / Excel / BFSI MIS; SQL starting from zero  
**Repo:** https://github.com/ashishvyas-ds/100-days-of-sql  
**Local folder:** `C:\Users\Lenovo\OneDrive\100-days-of-sql\100-days-of-sql`  
**Locked date:** 27 Sep 2026  
**Status at lock:** Day 001 pushed (`d9e3c1a`). Pagila loaded (~1000 films, ~599 customers).

This file is the source of truth. If a new chat starts, paste this file (or the repo URL + this path) and say: *continue from the next unpushed day.*

---

## 1. Goal

In 100 days, become analyst-grade in SQL on PostgreSQL: read a schema, write correct multi-join + group + window queries, design small tables, read a simple `EXPLAIN`, and have a public GitHub trail of daily work.

Not a DBA track. Not Python. Not dbt. Not a cloud warehouse. Those come after Day 100.

---

## 2. Locked stack (do not change mid-plan)

| Piece | Choice | Why |
|---|---|---|
| Engine | **PostgreSQL 18** | Closest to standard SQL + windows, CTEs, JSON, arrays, FTS, indexes, `EXPLAIN` |
| Host | `localhost:5432` | Laptop only |
| Superuser | `postgres` | Password set locally 27 Sep 2026 (do not commit it) |
| GUI | **DBeaver 26** | Grid + SQL editor |
| Practice DB | **`pagila`** | Days 1–38, 41–93, 100 |
| Second DB | **`chinook`** | Day 39–40, 94 (load when you get there) |
| Third DB | **`northwind`** | Optional |
| Sandbox DB | **`learning`** | DDL / INSERT experiments Days 3, 66–75, 86–92 |
| Do not touch | System DB `postgres` for data | Use it only to `CREATE`/`DROP` other DBs |
| Version control | Git + GitHub repo above | One folder per day |
| OS paths | Windows; user folder `C:\Users\Lenovo` | Earlier `ashishpande19` path was wrong |

**Do not install** MySQL, Docker, or a second GUI for this 100 days.

---

## 3. What is already finished (do not redo)

- PostgreSQL 18 installed: `C:\Program Files\PostgreSQL\18\`
- `pg_hba.conf` should be **`scram-sha-256`** again (trust was only a password-reset tool)
- DBeaver connection named `postgres`, **Show all databases** ON
- Databases exist: `learning`, `pagila`, `chinook`, `northwind`, `postgres`
- Pagila data loaded via **`psql`**, not DBeaver (DBeaver cannot run `COPY FROM stdin`)
- Confirmed: `SELECT COUNT(*) FROM film` = **1000**
- Day 001 on GitHub: `README.md`, `day-001/notes.md`, `queries.sql`, `learnings.md`

---

## 4. Daily operating system (locked)

**Time:** 60–90 min weeknights. Miss a day → review, do not stack two new topics.

**Loop:**

1. Read the day’s topic below (20–30 min)
2. Run ≥ 8 queries on the stated database (30–45 min)
3. Save three files and push

**Folder per day:**

```
day-0XX/
  notes.md        # concept, Excel analogue, pitfalls
  queries.sql     # all practice, commented with the business question
  learnings.md    # 5–10 lines: clicked / broke / fix
```

**Commit message:**

```
Day 027: LEFT JOIN vs INNER JOIN on Pagila rentals
```

**DBeaver rule:** top bar must read `public@pagila` (or the DB named that day) before you run practice queries.

**Git push (after Day 1 remote exists):**

```powershell
cd C:\Users\Lenovo\OneDrive\100-days-of-sql\100-days-of-sql
git add day-0XX
git commit -m "Day 0XX: short topic"
git push
```

Never commit passwords, tokens, `pagila.sql` dumps, or `.pgpass`.

---

## 5. Excel → SQL map (keep)

| Excel | SQL |
|---|---|
| Filter | `WHERE` |
| Sort / Top N | `ORDER BY` + `LIMIT` |
| Pivot | `GROUP BY` + aggregates |
| SUMIF / COUNTIF | `SUM(CASE WHEN …)` or `COUNT(*) FILTER (WHERE …)` |
| VLOOKUP / XLOOKUP | `JOIN` |
| IF | `CASE WHEN` |
| LEFT / MID / FIND | `LEFT`, `SUBSTRING`, `SPLIT_PART` |
| Running total / RANK | window functions |
| Empty cell | `NULL` (`NULL <> NULL`) |
| Helper column | subquery / CTE |
| Data validation | `CHECK`, `FOREIGN KEY` |

---

## 6. Standing pitfalls

- `CREATE DATABASE` / `DROP DATABASE` cannot run in a multi-statement transaction; run one at a time. Cannot drop a DB you are connected to.
- DBeaver `COPY … FROM stdin` dumps fail (`unexpected message type 0x50`). Load dumps with:

```powershell
$env:PGPASSWORD = 'YOUR_PASSWORD'
& "C:\Program Files\PostgreSQL\18\bin\psql.exe" -U postgres -d pagila -f "FULL_PATH\pagila.sql"
$env:PGPASSWORD = ''
```

- GitHub does not accept account passwords. Use a PAT or GitHub Desktop. Never paste a live token into chat.
- GitHub `Repository not found` = repo missing on the website **or** bad token. Create https://github.com/ashishvyas-ds/100-days-of-sql first.
- Fan-out: join one-to-many then `SUM` double-counts. Explicit Day 30 lesson.
- Integer division: `1/2 = 0` in Postgres. Cast to `numeric`.

---

## 7. Practice sites (browser, extra reps)

- Days 6–15: https://sqlbolt.com/
- Days 16–40: https://pgexercises.com/
- Reading: https://mode.com/sql-tutorial/
- From Day 50: LeetCode SQL 50, HackerRank SQL
- Later: DataLemur
- Fun weekend: https://mystery.knightlab.com/

Local Pagila always wins over only-in-browser sites.

---

## 8. Phase map

| Days | Phase | Outcome |
|---|---|---|
| 1–5 | Setup + mental model | Engine up, Pagila loaded, first SELECT |
| 6–15 | One table | Filter, sort, text, dates |
| 16–25 | Aggregates | Pivot-style reports |
| 26–40 | Joins | Multi-table questions |
| 41–50 | Logic + subqueries | CASE, views, compose questions |
| 51–65 | Window functions | Rank, running total, customer 360 |
| 66–75 | Write + design | Tables, constraints, transactions |
| 76–85 | Plans + indexes | `EXPLAIN ANALYZE`, one useful index |
| 86–92 | Postgres extras | JSON, arrays, FTS, recursive CTE |
| 93–100 | Capstones | 3 projects + interview patterns + clean repo |

---

## 9. Day-by-day topics (locked)

Practice rule after Day 5: **minimum 8 queries**. Comment the business question above each.

### Days 1–5 — Setup and mental model

**Day 1 — What SQL is** (DONE)  
Relational idea. Declarative language. DQL/DML/DDL/TCL. First `SELECT` on Pagila. Repo created.

**Day 2 — Clients, connections, schemas**  
Host, port, user, database, schema `public`. DBeaver tree vs `information_schema`.  
Practice: list schemas, list tables, `\d` equivalent via `information_schema.columns` for `film`.

**Day 3 — Types and NULL**  
`INTEGER`, `BIGINT`, `NUMERIC`, `TEXT`, `BOOLEAN`, `DATE`, `TIMESTAMP`, `TIMESTAMPTZ`.  
`NULL`, `IS NULL`, `COALESCE`.  
Practice: `CREATE TABLE` in `learning` sandbox; insert mixed types.

**Day 4 — Pagila model**  
Walk tables and row counts. Sketch: customer → rental → inventory → film; film ↔ film_actor ↔ actor; film ↔ film_category ↔ category.  
Practice: `COUNT(*)` every public table.

**Day 5 — Chinook load + compare**  
Load Chinook with `psql` (same COPY issue). Note quoted PascalCase names (`"Track"`). Compare grains to Pagila.  
If tired, skip load and only read Chinook schema docs; load before Day 39.

### Days 6–15 — Reading one table (Pagila)

**Day 6** `SELECT`, `FROM`, column lists, aliases  
**Day 7** `DISTINCT`, calculated columns, arithmetic  
**Day 8** `WHERE` comparisons  
**Day 9** `AND` / `OR` / `NOT` / parentheses  
**Day 10** `IS NULL`, `COALESCE`, `NULLIF`  
**Day 11** `IN`, `BETWEEN`, `LIKE`, `ILIKE`  
**Day 12** `ORDER BY`, `LIMIT`, `OFFSET`, `NULLS FIRST`  
**Day 13** Text: `LENGTH`, `LOWER`, `TRIM`, `LEFT`, `SUBSTRING`, `REPLACE`, `SPLIT_PART`, `||`  
**Day 14** Dates: `CURRENT_DATE`, `AGE`, `DATE_TRUNC`, `EXTRACT`, intervals  
**Day 15** Checkpoint: film catalog one-pager (15 queries + short `report.md`)

### Days 16–25 — Aggregation (Pivot era)

**Day 16** `COUNT` / `SUM` / `AVG` / `MIN` / `MAX`; `COUNT(*)` vs `COUNT(col)` vs `COUNT(DISTINCT)`  
**Day 17** `GROUP BY` one column  
**Day 18** `GROUP BY` several columns; grain discipline  
**Day 19** `HAVING` vs `WHERE`  
**Day 20** Conditional aggregation: `CASE` and `FILTER (WHERE …)`  
**Day 21** `ROUND`, casts, integer-division trap, percentages  
**Day 22** `ROLLUP` / `GROUPING SETS` intro  
**Day 23** `STRING_AGG`  
**Day 24** `STDDEV`, `PERCENTILE_CONT`  
**Day 25** Checkpoint: monthly revenue / AOV / % of total on `payment`

### Days 26–40 — Joins

**Day 26** PK, FK, 1-M, M-M, Pagila relationship sketch  
**Day 27** `INNER JOIN`  
**Day 28** `LEFT JOIN`  
**Day 29** `RIGHT` / `FULL`; rewrite as LEFT  
**Day 30** Fan-out / double-count bug; fix with pre-aggregate  
**Day 31** Many-to-many via bridge (`film_actor`, `film_category`)  
**Day 32** 4–6 table business query (revenue by category-month)  
**Day 33** Self join  
**Day 34** `CROSS JOIN` + calendar spine  
**Day 35** Non-equi / range joins  
**Day 36** JOIN + `GROUP BY`  
**Day 37** Anti-join / semi-join: `NOT EXISTS`, `LEFT … IS NULL`; `NOT IN` NULL trap  
**Day 38** `UNION` / `UNION ALL` / `INTERSECT` / `EXCEPT`  
**Day 39** Chinook join day (switch dataset)  
**Day 40** Checkpoint: store performance pack + join graph in notes

### Days 41–50 — Logic and composition

**Day 41** `CASE WHEN`  
**Day 42** Scalar subqueries  
**Day 43** `IN` / `EXISTS`  
**Day 44** Derived tables (`FROM (SELECT …)`)  
**Day 45** Correlated subqueries  
**Day 46** `ALL` / `ANY`  
**Day 47** Views  
**Day 48** Flags, buckets, late rentals  
**Day 49** Combine JOIN + CASE + GROUP + subquery, then clean it  
**Day 50** Checkpoint + start LeetCode SQL 50 (5 easy, also run locally). Write `patterns.md`

### Days 51–65 — Window functions

**Day 51** `OVER()` mental model; partition vs order vs frame  
**Day 52** `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`; top-N per group  
**Day 53** `LAG` / `LEAD`  
**Day 54** Running totals  
**Day 55** Moving averages  
**Day 56** `ROWS` vs `RANGE` frames  
**Day 57** `FIRST_VALUE` / `LAST_VALUE` (frame trap)  
**Day 58** `PERCENT_RANK`, `CUME_DIST`  
**Day 59** Filter window results via subquery (no `QUALIFY` in Postgres)  
**Day 60** Windows + joins  
**Day 61** Cohort foundation (first rental month → retention grid)  
**Day 62** New vs repeat flag  
**Day 63** Sessionization lite (gap > 7 days)  
**Day 64** Window pitfalls (write three broken queries on purpose)  
**Day 65** Checkpoint: customer 360

### Days 66–75 — Write and design (`learning` + sandbox)

**Day 66** `INSERT` / `INSERT … SELECT`  
**Day 67** `UPDATE` / `DELETE` (SELECT the WHERE first)  
**Day 68** `CREATE TABLE` + PK/FK/UNIQUE/NOT NULL/CHECK/DEFAULT  
**Day 69** `ALTER TABLE`  
**Day 70** Normalization 1NF–3NF; split a wide Excel-style table  
**Day 71** Transactions: `BEGIN`/`COMMIT`/`ROLLBACK`  
**Day 72** `INSERT … ON CONFLICT`  
**Day 73** `GENERATED … AS IDENTITY` vs `SERIAL`  
**Day 74** Views vs materialized views  
**Day 75** Checkpoint: design a mini schema you know from work (anonymized) = Project A

### Days 76–85 — Performance

**Day 76** How a query runs; what an index is  
**Day 77** `EXPLAIN ANALYZE`  
**Day 78** B-tree indexes  
**Day 79** Partial + covering indexes  
**Day 80** Nested loop / hash / merge (observe only)  
**Day 81** Write SQL the optimizer likes  
**Day 82** Statistics / `ANALYZE`  
**Day 83** Locks / MVCC intro (two DBeaver sessions)  
**Day 84** `CREATE ROLE` + `GRANT SELECT`  
**Day 85** Checkpoint: tune 3 of your own older queries

### Days 86–92 — Postgres extras

**Day 86** JSON / JSONB  
**Day 87** Arrays  
**Day 88** Full-text search  
**Day 89** Generated columns + enums  
**Day 90** Recursive CTEs (calendar spine + hierarchy)  
**Day 91** Simple `CREATE FUNCTION` in SQL language  
**Day 92** `pg_trgm` similarity; know PostGIS / pgvector exist

### Days 93–100 — Capstones

**Day 93** Project B: Pagila GM pack (8 queries)  
**Day 94** Project C: Chinook product analytics  
**Day 95** Rebuild one real anonymized Excel report in SQL  
**Day 96** 8 medium interview problems (windows, consecutive days, top-N-per-group)  
**Day 97** Timed HackerRank Basic + Intermediate  
**Day 98** Clean repo: root README, `.gitignore`, `showcase/` of 10 best queries  
**Day 99** Written answers: INNER vs LEFT, WHERE vs HAVING, COUNT(*) vs COUNT(col), fan-out, window vs GROUP BY, CTE vs subquery, when to index, NULL  
**Day 100** Rewrite Day 15 + Day 40 queries with current skill. `day-100-retrospective.md`. Tag `v1.0`

---

## 10. Done definition after Day 100

Without notes you can:

1. Open a new schema and find grain + keys in 20 minutes  
2. Write a correct multi-join + group + window query  
3. Read a simple `EXPLAIN ANALYZE`  
4. Design 5–8 related tables with constraints  
5. Point at this public repo as evidence  

Warehouse dialects after that are a weekend of notes, not a new language.

---

## 11. How to resume in a new chat

Paste this message:

> Continue my 100 Days of SQL. Curriculum is locked in repo  
> https://github.com/ashishvyas-ds/100-days-of-sql  
> file `LOCKED-CURRICULUM.md`.  
> Stack: PostgreSQL 18 + DBeaver + Pagila on localhost.  
> Last completed day: **[N]**. Start Day **[N+1]** with learn / why / code / GitHub commit message.

Update the two bracketed numbers each time.

---

## 12. Next action after this lock

1. Save this file as `LOCKED-CURRICULUM.md` in the repo root  
2. Commit:

```
Day 000: lock 100-day curriculum
```

3. Start **Day 002** when ready (clients, connections, schemas — list Pagila columns for `film` and `customer` from `information_schema`).
