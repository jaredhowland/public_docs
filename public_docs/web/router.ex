defmodule PublicDocs.Router do
  use PublicDocs.Web, :router

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

  scope "/", PublicDocs do
    pipe_through :browser # Use the default browser stack

    get "/", DocumentationController, :index
    get "/related-search-api", DocumentationController, :xsapi_docs
    get "/hints-api", DocumentationController, :hints_docs
    get "/image-api", DocumentationController, :image_docs
  end

  # Other scopes may use custom stacks.
  # scope "/api", PublicDocs do
  #   pipe_through :api
  # end
end
