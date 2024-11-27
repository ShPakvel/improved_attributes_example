defmodule ImprovedAttributesExampleWeb.NoteHTML do
  use ImprovedAttributesExampleWeb, :html

  embed_templates "note_html/*"

  @doc """
  Renders a note form.

  The form is defined in the template at
  note_html/note_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def note_form(assigns)

  def array_values(values), do: (values || []) |> List.flatten() |> Enum.join(", ")
end
