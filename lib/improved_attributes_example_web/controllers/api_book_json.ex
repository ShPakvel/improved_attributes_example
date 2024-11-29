defmodule ImprovedAttributesExampleWeb.ApiBookJSON do
  alias ImprovedAttributesExample.ApiGeneral.ApiLibrary.ApiBook

  @doc """
  Renders a list of api_books.
  """
  def index(%{api_books: api_books}) do
    %{data: for(api_book <- api_books, do: data(api_book))}
  end

  @doc """
  Renders a single api_book.
  """
  def show(%{api_book: api_book}) do
    %{data: data(api_book)}
  end

  defp data(%ApiBook{} = api_book) do
    %{
      id: api_book.id,
      name: api_book.name,
      isbn: api_book.isbn,
      index_page: api_book.index_page,
      print_size: api_book.print_size,
      rate: api_book.rate,
      free: api_book.free,
      author_real_name: api_book.author_real_name
    }
  end
end
