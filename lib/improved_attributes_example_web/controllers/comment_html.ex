defmodule ImprovedAttributesExampleWeb.CommentHTML do
  use ImprovedAttributesExampleWeb, :html

  embed_templates "comment_html/*"

  @doc """
  Renders a comment form.

  The form is defined in the template at
  comment_html/comment_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def comment_form(assigns)
end
