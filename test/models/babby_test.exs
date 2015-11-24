defmodule BabbyPhoenix.BabbyTest do
  use BabbyPhoenix.ModelCase

  alias BabbyPhoenix.Babby

  @valid_attrs %{bio: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Babby.changeset(%Babby{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Babby.changeset(%Babby{}, @invalid_attrs)
    refute changeset.valid?
  end
end
