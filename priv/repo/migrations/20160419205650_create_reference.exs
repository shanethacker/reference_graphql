defmodule ReferenceGraphql.Repo.Migrations.CreateReference do
  use Ecto.Migration

  def change do
    create table(:references) do
      add :heroid, :integer
      add :title, :string
      add :authors, :string
      add :year, :integer
      add :journal, :string
      add :pagenumbers, :string
      add :volume, :integer
      add :abstract, :string

      timestamps
    end

  end
end
