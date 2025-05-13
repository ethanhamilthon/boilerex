# Boilerex

Simple starter template to create web apps with Elixir.
Tech stack: Elixir, HTMX, Temple, Tailwind

## Running in DEV

1. Install deps and tailwind
```bash
mix deps.get
mix tailwind.install
```

2. Run tailwind and app itself in dev mode
```bash
mix tailwind default
mix run --no-halt
```

3. Convert your html templates to elixir code:
| put your html markups to t.html file first
```bash
mix temple.convert t.html
```
