defmodule ReferenceGraphql.Schema do
  use Absinthe.Schema
  import_types ReferenceGraphql.Schema.Types

  query do
    field :references, list_of(:reference) do
      resolve &ReferenceGraphql.ReferenceResolver.all/2
    end

    field :reference, :reference do
      arg :id, non_null(:id)
      resolve &ReferenceGraphql.ReferenceResolver.find_one/2
    end
  end
end