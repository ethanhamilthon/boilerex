defmodule BoilerexTest do
  use ExUnit.Case
  doctest Boilerex

  test "greets the world" do
    assert Boilerex.hello() == :world
  end
end
