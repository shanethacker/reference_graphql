defmodule ReferenceGraphql.ReferenceResolver do
  def all(_args, _info) do
    {:ok, ReferenceGraphql.Repo.all(ReferenceGraphql.Reference)}
  end

  def find_one(_args, _info) do
    {:ok, ReferenceGraphql.Repo.get_by!(ReferenceGraphql.Reference, heroid: _args.id)}
  end
end