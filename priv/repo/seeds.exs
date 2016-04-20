# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ReferenceGraphql.Repo.insert!(%ReferenceGraphql.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ReferenceGraphql.Reference
alias ReferenceGraphql.Repo

defmodule ReferenceGraphql.Seeds do

  def store_it(row) do
    changeset = Reference.changeset(%Reference{}, row)
    Repo.insert!(changeset)
  end

end

File.stream!("priv/repo/export.csv")
  |> Stream.drop(1)
  |> CSV.decode(headers: [:heroid, :title, :authors, :year, :journal, :pagenumbers, :volume])
  |> Enum.each(&ReferenceGraphql.Seeds.store_it/1)
