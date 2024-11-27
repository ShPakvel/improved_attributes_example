defmodule ImprovedAttributesExampleWeb.ProductHTML do
  use ImprovedAttributesExampleWeb, :html

  embed_templates "product_html/*"

  @doc """
  Renders a product form.

  The form is defined in the template at
  product_html/product_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def product_form(assigns)
end
