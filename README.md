Excel-native data person, learning PostgreSQL on Pagila.
One folder per day: notes.md, queries.sql, learnings.md.

# 100 Days of SQL

A daily learn → practice → GitHub push plan for an experienced Excel / data professional starting SQL from zero.

**Engine:** PostgreSQL (covers standard SQL plus almost every real-world scenario you will meet later: windows, CTEs, JSON, arrays, full-text, generated columns, indexes, transactions, EXPLAIN).

**Daily loop (60–90 min):**
1. Read the day's notes (20–30 min)
2. Write and run queries on your local Postgres (30–45 min)
3. Commit `notes.md` + `queries.sql` + a short `learnings.md` and push

## How this repo is organized

```
100-days-of-sql/
├── README.md
├── PLAN.md                 # full 100-day curriculum
├── 00-setup/               # install notes
├── 01-sample-data/         # how to load Pagila, Chinook, Northwind
├── templates/
│   ├── day-notes.md
│   └── queries.sql
└── day-001/ ... day-100/
```

## Excel → SQL cheat sheet (keep this open for week 1)

| You already do this in Excel | SQL equivalent |
|---|---|
| Filter a table | `WHERE` |
| Sort | `ORDER BY` |
| Top N rows | `LIMIT` / `FETCH` |
| Pivot table | `GROUP BY` + aggregates |
| SUMIF / COUNTIF | `SUM(CASE WHEN …)` or filtered aggregates |
| VLOOKUP / XLOOKUP | `JOIN` |
| IF | `CASE WHEN` |
| Concatenate | `\|\|` or `CONCAT` |
| Text to columns / LEFT/MID | `SPLIT_PART`, `SUBSTRING`, `LEFT` |
| Running total | Window `SUM() OVER (...)` |
| RANK | `RANK()` / `DENSE_RANK()` / `ROW_NUMBER()` |
| Remove duplicates | `DISTINCT` or `GROUP BY` or `QUALIFY` pattern |
| Named range / table | Table + optional `VIEW` |
| Data validation list | `CHECK`, `FOREIGN KEY`, enum type |
| Protect a sheet | Grants / roles (later) |

SQL is not a “new Excel”. It is how you ask a **set of related tables** questions, at scale, with a written, repeatable recipe.

## Rules that will make this stick

- One folder per day. Never overwrite yesterday.
- Every query file starts with a comment: goal, tables used, expected shape of the result.
- If a query is wrong, keep the wrong version commented and write the fix below it. That is the learning artifact.
- Push even on a thin day. A 20-line commit beats a skipped day.
- Do not jump to window functions before joins feel boring. Joins are the skill.
