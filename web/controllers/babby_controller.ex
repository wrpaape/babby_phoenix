defmodule BabbyPhoenix.BabbyController do
  use BabbyPhoenix.Web, :controller

  alias BabbyPhoenix.Babby

  plug :scrub_params, "babby" when action in [:create, :update]

  def index(conn, _params) do
    babbies = Repo.all(Babby)
    render(conn, "index.html", babbies: babbies)
  end

  def new(conn, _params) do
    changeset = Babby.changeset(%Babby{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"babby" => babby_params}) do
    changeset = Babby.changeset(%Babby{}, babby_params)

    case Repo.insert(changeset) do
      {:ok, _babby} ->
        conn
        |> put_flash(:info, "Babby created successfully.")
        |> redirect(to: babby_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    babby = Repo.get!(Babby, id)
    render(conn, "show.html", babby: babby)
  end

  def edit(conn, %{"id" => id}) do
    babby = Repo.get!(Babby, id)
    changeset = Babby.changeset(babby)
    render(conn, "edit.html", babby: babby, changeset: changeset)
  end

  def update(conn, %{"id" => id, "babby" => babby_params}) do
    babby = Repo.get!(Babby, id)
    changeset = Babby.changeset(babby, babby_params)

    case Repo.update(changeset) do
      {:ok, babby} ->
        conn
        |> put_flash(:info, "Babby updated successfully.")
        |> redirect(to: babby_path(conn, :show, babby))
      {:error, changeset} ->
        render(conn, "edit.html", babby: babby, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    babby = Repo.get!(Babby, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(babby)

    conn
    |> put_flash(:info, "Babby deleted successfully.")
    |> redirect(to: babby_path(conn, :index))
  end
end
