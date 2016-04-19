defmodule ReferenceGraphql.ReferenceTest do
  use ReferenceGraphql.ModelCase

  alias ReferenceGraphql.Reference

  @valid_attrs %{abstract: "some content", authors: "some content", heroid: 42, journal: "some content", pagenumbers: "some content", title: "some content", volume: 42, year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reference.changeset(%Reference{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reference.changeset(%Reference{}, @invalid_attrs)
    refute changeset.valid?
  end
end
