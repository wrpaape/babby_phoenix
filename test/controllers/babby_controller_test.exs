defmodule BabbyPhoenix.BabbyControllerTest do
  use BabbyPhoenix.ConnCase

  alias BabbyPhoenix.Babby
  @valid_attrs %{bio: "some content", name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, babby_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing babbies"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, babby_path(conn, :new)
    assert html_response(conn, 200) =~ "New babby"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, babby_path(conn, :create), babby: @valid_attrs
    assert redirected_to(conn) == babby_path(conn, :index)
    assert Repo.get_by(Babby, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, babby_path(conn, :create), babby: @invalid_attrs
    assert html_response(conn, 200) =~ "New babby"
  end

  test "shows chosen resource", %{conn: conn} do
    babby = Repo.insert! %Babby{}
    conn = get conn, babby_path(conn, :show, babby)
    assert html_response(conn, 200) =~ "Show babby"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, babby_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    babby = Repo.insert! %Babby{}
    conn = get conn, babby_path(conn, :edit, babby)
    assert html_response(conn, 200) =~ "Edit babby"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    babby = Repo.insert! %Babby{}
    conn = put conn, babby_path(conn, :update, babby), babby: @valid_attrs
    assert redirected_to(conn) == babby_path(conn, :show, babby)
    assert Repo.get_by(Babby, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    babby = Repo.insert! %Babby{}
    conn = put conn, babby_path(conn, :update, babby), babby: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit babby"
  end

  test "deletes chosen resource", %{conn: conn} do
    babby = Repo.insert! %Babby{}
    conn = delete conn, babby_path(conn, :delete, babby)
    assert redirected_to(conn) == babby_path(conn, :index)
    refute Repo.get(Babby, babby.id)
  end
end
