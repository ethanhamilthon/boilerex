import Config

config :tailwind,
  version: "4.0.9",
  default: [
    args: ~w(
      --input=priv/css/app.css
      --output=priv/static/assets/app.css
      --watch
    ),
    cd: Path.expand("..", __DIR__)
  ]

config :boilerex,
  port: 4089,
  db_path: "data.db"

config :temple,
  engine: EEx.SmartEngine,
  attributes: {Temple, :attributes}
