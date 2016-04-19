defmodule ReferenceGraphql.ReferenceResolver do
  def all(_args, _info) do
    {:ok, ReferenceGraphql.Repo.all(ReferenceGraphql.Reference)}
  end
end