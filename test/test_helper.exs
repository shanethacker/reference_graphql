ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ReferenceGraphql.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ReferenceGraphql.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ReferenceGraphql.Repo)

