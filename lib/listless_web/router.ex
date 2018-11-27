defmodule ListlessWeb.Router do
  use ListlessWeb, :router

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

  scope "/", ListlessWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    scope "/login" do
      get "/", LoginController, :index
      post "/login", LoginController, :login
    end

    scope "/user" do
      get "/:user_id", UserController, :index
      post "/create", UserController, :create
    end

    scope "/list" do
      get "/:list_id", ListController, :index
      post "/create", ListController, :create
    end

    scope "/item" do
      post "/create", ItemController, :create
      post "/delete/:id", ItemController, :delete
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ListlessWeb do
  #   pipe_through :api
  # end
end
