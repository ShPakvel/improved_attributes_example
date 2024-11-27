defmodule ImprovedAttributesExampleWeb.PostHTML do
  use ImprovedAttributesExampleWeb, :html

  embed_templates "post_html/*"

  @doc """
  Renders a post form.

  The form is defined in the template at
  post_html/post_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def post_form(assigns)

  def array_values(values), do: (values || []) |> List.flatten() |> Enum.join(", ")
end
