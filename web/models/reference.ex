defmodule ReferenceGraphql.Reference do
  use ReferenceGraphql.Web, :model

  schema "references" do
    field :heroid, :integer
    field :title, :string
    field :authors, :string
    field :year, :integer
    field :journal, :string
    field :pagenumbers, :string
    field :volume, :integer
    field :abstract, :string

    timestamps
  end

  @required_fields ~w(heroid title authors year journal pagenumbers volume abstract)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
