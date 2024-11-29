defmodule ImprovedAttributesExampleWeb.Router do
  use ImprovedAttributesExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ImprovedAttributesExampleWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ImprovedAttributesExampleWeb do
    pipe_through :browser

    get "/", PageController, :home

    resources "/products", ProductController
    resources "/blog_posts", PostController
    resources "/books", BookController
    resources "/comments", CommentController
    resources "/notes", NoteController

    live "/live_products", LiveProductLive.Index, :index
    live "/live_products/new", LiveProductLive.Form, :new
    live "/live_products/:id", LiveProductLive.Show, :show
    live "/live_products/:id/edit", LiveProductLive.Form, :edit
    live "/live_blog_posts", LivePostLive.Index, :index
    live "/live_blog_posts/new", LivePostLive.Form, :new
    live "/live_blog_posts/:id", LivePostLive.Show, :show
    live "/live_blog_posts/:id/edit", LivePostLive.Form, :edit
    live "/live_books", LiveBookLive.Index, :index
    live "/live_books/new", LiveBookLive.Form, :new
    live "/live_books/:id", LiveBookLive.Show, :show
    live "/live_books/:id/edit", LiveBookLive.Form, :edit
    live "/live_comments", LiveCommentLive.Index, :index
    live "/live_comments/new", LiveCommentLive.Form, :new
    live "/live_comments/:id", LiveCommentLive.Show, :show
    live "/live_comments/:id/edit", LiveCommentLive.Form, :edit
    live "/live_notes", LiveNoteLive.Index, :index
    live "/live_notes/new", LiveNoteLive.Form, :new
    live "/live_notes/:id", LiveNoteLive.Show, :show
    live "/live_notes/:id/edit", LiveNoteLive.Form, :edit
  end

  # Other scopes may use custom stacks.
  scope "/api", ImprovedAttributesExampleWeb do
    pipe_through :api

    resources "/api_products", ApiProductController, except: [:new, :edit]
    resources "/api_blog_posts", ApiPostController, except: [:new, :edit]
    resources "/api_books", ApiBookController, except: [:new, :edit]
    resources "/api_comments", ApiCommentController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:improved_attributes_example, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ImprovedAttributesExampleWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
