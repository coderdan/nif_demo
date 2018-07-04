defmodule MyNifTest do
  use ExUnit.Case
  doctest MyNif

  test "greets the world" do
    assert MyNif.hello() == :world
  end
end
