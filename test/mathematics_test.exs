defmodule MathematicsTest do
  use ExUnit.Case
  doctest Mathematics

  test "greets the world" do
    assert Mathematics.hello() == :world
  end
end
