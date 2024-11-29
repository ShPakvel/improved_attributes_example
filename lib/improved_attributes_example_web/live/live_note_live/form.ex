defmodule ImprovedAttributesExampleWeb.LiveNoteLive.Form do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveBlog
  alias ImprovedAttributesExample.LiveBlog.LiveNote

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      <%= @page_title %>
      <:subtitle>Use this form to manage live_note records in your database.</:subtitle>
    </.header>

    <.simple_form for={@form} id="live_note-form" phx-change="validate" phx-submit="save">
      <.input field={@form[:body]} label="Body" type="textarea" required />
      <.input field={@form[:review_day]} label="Review day" type="date" />
      <.input field={@form[:live_product_id]} label="Live product" type="text" />
      <.input field={@form[:live_post_id]} label="Live post" type="text" />
      <.input field={@form[:live_book_id]} label="Live book" type="text" />
      <.input field={@form[:data]} label="Data" type="text" />
      <.input field={@form[:meta]} label="Meta" type="select" options={["meta value", "updated meta value"]} multiple />
      <.input field={@form[:points]} label="Points" type="select" options={[142, 303]} multiple />
      <.input field={@form[:status]} label="Status" type="select" options={Ecto.Enum.values(ImprovedAttributesExample.LiveBlog.LiveNote, :status)} prompt="Choose a value" />
      <.input field={@form[:tags]} label="Tags" type="select" options={Ecto.Enum.values(ImprovedAttributesExample.LiveBlog.LiveNote, :tags)} multiple />
      <:actions>
        <.button phx-disable-with="Saving...">Save Live note</.button>
      </:actions>
    </.simple_form>

    <.back navigate={return_path(@return_to, @live_note)}>Back</.back>
    """
  end

  @impl true
  def mount(params, _session, socket) do
    {:ok,
     socket
     |> assign(:return_to, return_to(params["return_to"]))
     |> apply_action(socket.assigns.live_action, params)}
  end

  defp return_to("show"), do: "show"
  defp return_to(_), do: "index"

  defp apply_action(socket, :edit, %{"id" => id}) do
    live_note = LiveBlog.get_live_note!(id)

    socket
    |> assign(:page_title, "Edit Live note")
    |> assign(:live_note, live_note)
    |> assign(:form, to_form(LiveBlog.change_live_note(live_note)))
  end

  defp apply_action(socket, :new, _params) do
    live_note = %LiveNote{}

    socket
    |> assign(:page_title, "New Live note")
    |> assign(:live_note, live_note)
    |> assign(:form, to_form(LiveBlog.change_live_note(live_note)))
  end

  @impl true
  def handle_event("validate", %{"live_note" => live_note_params}, socket) do
    changeset = LiveBlog.change_live_note(socket.assigns.live_note, live_note_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"live_note" => live_note_params}, socket) do
    save_live_note(socket, socket.assigns.live_action, live_note_params)
  end

  defp save_live_note(socket, :edit, live_note_params) do
    case LiveBlog.update_live_note(socket.assigns.live_note, live_note_params) do
      {:ok, live_note} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live note updated successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_note))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_live_note(socket, :new, live_note_params) do
    case LiveBlog.create_live_note(live_note_params) do
      {:ok, live_note} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live note created successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_note))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp return_path("index", _live_note), do: ~p"/live_notes"
  defp return_path("show", live_note), do: ~p"/live_notes/#{live_note}"
end
