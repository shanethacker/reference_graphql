defmodule ReferenceGraphql.ReferenceController do
  use ReferenceGraphql.Web, :controller

  alias ReferenceGraphql.Reference

  plug :scrub_params, "reference" when action in [:create, :update]

  def index(conn, _params) do
    references = Repo.all(Reference)
    render(conn, "index.html", references: references)
  end

  def new(conn, _params) do
    changeset = Reference.changeset(%Reference{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reference" => reference_params}) do
    changeset = Reference.changeset(%Reference{}, reference_params)

    case Repo.insert(changeset) do
      {:ok, _reference} ->
        conn
        |> put_flash(:info, "Reference created successfully.")
        |> redirect(to: reference_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reference = Repo.get!(Reference, id)
    render(conn, "show.html", reference: reference)
  end

  def edit(conn, %{"id" => id}) do
    reference = Repo.get!(Reference, id)
    changeset = Reference.changeset(reference)
    render(conn, "edit.html", reference: reference, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reference" => reference_params}) do
    reference = Repo.get!(Reference, id)
    changeset = Reference.changeset(reference, reference_params)

    case Repo.update(changeset) do
      {:ok, reference} ->
        conn
        |> put_flash(:info, "Reference updated successfully.")
        |> redirect(to: reference_path(conn, :show, reference))
      {:error, changeset} ->
        render(conn, "edit.html", reference: reference, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reference = Repo.get!(Reference, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reference)

    conn
    |> put_flash(:info, "Reference deleted successfully.")
    |> redirect(to: reference_path(conn, :index))
  end
end
