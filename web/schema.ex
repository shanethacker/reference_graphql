defmodule ReferenceGraphql.Schema do
  use Absinthe.Schema
  import_types ReferenceGraphql.Schema.Types

  query do
    field :references, list_of(:reference) do
      resolve &ReferenceGraphql.ReferenceResolver.all/2
    end
  end
end