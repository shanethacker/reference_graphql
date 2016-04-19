defmodule ReferenceGraphql.Schema.Types do
  use Absinthe.Schema.Notation

  object :reference do
    field :heroid, :id
    field :title, :string
    field :authors, :string
    field :year, :integer
    field :journal, :string
    field :pagenumbers, :string
    field :volume, :integer
    field :abstract, :string
  end
end