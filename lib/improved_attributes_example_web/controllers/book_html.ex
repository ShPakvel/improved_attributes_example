defmodule ImprovedAttributesExampleWeb.BookHTML do
  use ImprovedAttributesExampleWeb, :html

  embed_templates "book_html/*"

  @doc """
  Renders a book form.

  The form is defined in the template at
  book_html/book_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def book_form(assigns)
end
