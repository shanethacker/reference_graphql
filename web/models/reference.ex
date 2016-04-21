defmodule ReferenceGraphql.Reference do
  use ReferenceGraphql.Web, :model

  schema "references" do
    field :heroid, :integer
    field :title, :string, size: 500
    field :authors, :string
    field :year, :integer
    field :journal, :string
    field :pagenumbers, :string
    field :volume, :string
    field :abstract, :string, size: 4000

    timestamps
  end

  @required_fields ~w(heroid title authors journal)
  @optional_fields ~w(year pagenumbers volume abstract)

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
