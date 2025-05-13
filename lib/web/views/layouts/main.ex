defmodule Web.Views.Layouts.Main do
  import Temple
  use Temple.Component

  def main_layout(assigns) do
    temple do
      "<!DOCTYPE html>"

      html do
        head do
          meta charset: "utf-8"
          meta name: "viewport", content: "width=device-width, initial-scale=1.0"
          link rel: "stylesheet", href: "/assets/app.css"

          title do: @title
        end

        body do
          slot @inner_block
        end

        script src: "/assets/js/input_handler.js", defer: true

        script src: "https://unpkg.com/htmx.org@2.0.4",
               integrity:
                 "sha384-HGfztofotfshcF7+8n44JQL2oJmowVChPTg48S+jvZoztPfvwD79OC/LTtG6dMp+",
               crossorigin: "anonymous" do
        end
      end
    end
  end
end
