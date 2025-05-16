# Boilerex

Simple starter template to create web apps with Elixir.
Tech stack: Elixir, HTMX, Temple, Tailwind

## Why use this tech stack
1. **Productive**: Create a fullstack application quickly without thinking about unnecessary problems
2. **Best DX**: The entire code base is in Elixir, an elegant and dynamically typed language. Tools like HTMX and Tailwind allow you to declaratively describe complex things
3. **Flexible and no limitations**: No frameworks, no limit. You can use any library, or create it yourself if you need it

## Why not use this tech stack
1. **Heavy Frontend**: HTMX is not designed for this. Use React/Vue/Svelte instead, and you still can use Elixir for backend. This template separates web and core logic, which allows you quickly switch your view layer
2. **You want a framework**: If you need a framework that sets a limits, gives you a lot of capability out of the box and allows you to generate some code, then this template is not for you. Use phoenix instead


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
