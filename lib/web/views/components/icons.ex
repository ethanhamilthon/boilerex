defmodule Web.Views.Components.Icons do
  import Temple
  use Temple.Component

  def delete(assigns) do
    temple do
      svg width: 18,
          height: 18,
          viewbox: "0 0 15 15",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg",
          class: @class do
        path d:
               "M5.5 1C5.22386 1 5 1.22386 5 1.5C5 1.77614 5.22386 2 5.5 2H9.5C9.77614 2 10 1.77614 10 1.5C10 1.22386 9.77614 1 9.5 1H5.5ZM3 3.5C3 3.22386 3.22386 3 3.5 3H5H10H11.5C11.7761 3 12 3.22386 12 3.5C12 3.77614 11.7761 4 11.5 4H11V12C11 12.5523 10.5523 13 10 13H5C4.44772 13 4 12.5523 4 12V4L3.5 4C3.22386 4 3 3.77614 3 3.5ZM5 4H10V12H5V4Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd" do
        end
      end
    end
  end

  def check(assigns) do
    temple do
      svg class: @class,
          width: 18,
          height: 18,
          viewbox: "0 0 15 15",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg" do
        path d:
               "M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd" do
        end
      end
    end
  end

  def reset(assigns) do
    temple do
      svg class: @class,
          width: "15",
          height: "15",
          viewbox: "0 0 15 15",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg" do
        path d:
               "M4.85355 2.14645C5.04882 2.34171 5.04882 2.65829 4.85355 2.85355L3.70711 4H9C11.4853 4 13.5 6.01472 13.5 8.5C13.5 10.9853 11.4853 13 9 13H5C4.72386 13 4.5 12.7761 4.5 12.5C4.5 12.2239 4.72386 12 5 12H9C10.933 12 12.5 10.433 12.5 8.5C12.5 6.567 10.933 5 9 5H3.70711L4.85355 6.14645C5.04882 6.34171 5.04882 6.65829 4.85355 6.85355C4.65829 7.04882 4.34171 7.04882 4.14645 6.85355L2.14645 4.85355C1.95118 4.65829 1.95118 4.34171 2.14645 4.14645L4.14645 2.14645C4.34171 1.95118 4.65829 1.95118 4.85355 2.14645Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd" do
        end
      end
    end
  end
end
