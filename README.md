# Boilerex

Simple starter template to create web apps with Elixir.
Tech stack: Elixir, HTMX, Temple, Tailwind

## Running in DEV

1. Install deps and tailwind
```bash
mix deps.get
mix tailwind.install
```

2. Run db and tables
```bash
mix migrate
```

3. Run tailwind and app itself in dev mode
```bash
mix tailwind default
iex -S mix
```

## Convert your html templates to elixir code

1. Put your html markups to t.html file first

2. Run the command
```bash
mix temple.convert t.html
```
