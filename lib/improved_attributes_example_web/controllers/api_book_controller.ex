defmodule ImprovedAttributesExampleWeb.ApiBookController do
  use ImprovedAttributesExampleWeb, :controller

  alias ImprovedAttributesExample.ApiGeneral.ApiLibrary
  alias ImprovedAttributesExample.ApiGeneral.ApiLibrary.ApiBook

  action_fallback ImprovedAttributesExampleWeb.FallbackController

  def index(conn, _params) do
    api_books = ApiLibrary.list_api_books()
    render(conn, :index, api_books: api_books)
  end

  def create(conn, %{"api_book" => api_book_params}) do
    with {:ok, %ApiBook{} = api_book} <- ApiLibrary.create_api_book(api_book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api_books/#{api_book}")
      |> render(:show, api_book: api_book)
    end
  end

  def show(conn, %{"id" => id}) do
    api_book = ApiLibrary.get_api_book!(id)
    render(conn, :show, api_book: api_book)
  end

  def update(conn, %{"id" => id, "api_book" => api_book_params}) do
    api_book = ApiLibrary.get_api_book!(id)

    with {:ok, %ApiBook{} = api_book} <- ApiLibrary.update_api_book(api_book, api_book_params) do
      render(conn, :show, api_book: api_book)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_book = ApiLibrary.get_api_book!(id)

    with {:ok, %ApiBook{}} <- ApiLibrary.delete_api_book(api_book) do
      send_resp(conn, :no_content, "")
    end
  end
end
