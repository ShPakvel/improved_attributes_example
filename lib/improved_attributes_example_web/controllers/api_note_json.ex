defmodule ImprovedAttributesExampleWeb.ApiNoteJSON do
  alias ImprovedAttributesExample.ApiBlog.ApiNote

  @doc """
  Renders a list of api_notes.
  """
  def index(%{api_notes: api_notes}) do
    %{data: for(api_note <- api_notes, do: data(api_note))}
  end

  @doc """
  Renders a single api_note.
  """
  def show(%{api_note: api_note}) do
    %{data: data(api_note)}
  end

  defp data(%ApiNote{} = api_note) do
    %{
      id: api_note.id,
      body: api_note.body,
      review_day: api_note.review_day,
      api_product_id: api_note.api_product_id,
      api_post_id: api_note.api_post_id,
      api_book_id: api_note.api_book_id,
      data: api_note.data,
      meta: api_note.meta,
      points: api_note.points,
      status: api_note.status,
      tags: api_note.tags
    }
  end
end
