defmodule BabbyPhoenix.Router do
  use BabbyPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BabbyPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/",                 PageController,  :index
    get "/babby",            BabbyController, :index
    get "/babby/:messenger", BabbyController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", BabbyPhoenix do
  #   pipe_through :api
  # end
end
