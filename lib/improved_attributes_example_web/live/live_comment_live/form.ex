defmodule ImprovedAttributesExampleWeb.LiveCommentLive.Form do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveCatalog
  alias ImprovedAttributesExample.LiveCatalog.LiveComment

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      <%= @page_title %>
      <:subtitle>Use this form to manage live_comment records in your database.</:subtitle>
    </.header>

    <.simple_form for={@form} id="live_comment-form" phx-change="validate" phx-submit="save">
      <.input field={@form[:body]} label="Body" type="text" required />
      <.input field={@form[:live_product_id]} label="Live product" type="text" required />
      <.input field={@form[:live_post_id]} label="Live post" type="text" />
      <:actions>
        <.button phx-disable-with="Saving...">Save Live comment</.button>
      </:actions>
    </.simple_form>

    <.back navigate={return_path(@return_to, @live_comment)}>Back</.back>
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
    live_comment = LiveCatalog.get_live_comment!(id)

    socket
    |> assign(:page_title, "Edit Live comment")
    |> assign(:live_comment, live_comment)
    |> assign(:form, to_form(LiveCatalog.change_live_comment(live_comment)))
  end

  defp apply_action(socket, :new, _params) do
    live_comment = %LiveComment{}

    socket
    |> assign(:page_title, "New Live comment")
    |> assign(:live_comment, live_comment)
    |> assign(:form, to_form(LiveCatalog.change_live_comment(live_comment)))
  end

  @impl true
  def handle_event("validate", %{"live_comment" => live_comment_params}, socket) do
    changeset = LiveCatalog.change_live_comment(socket.assigns.live_comment, live_comment_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"live_comment" => live_comment_params}, socket) do
    save_live_comment(socket, socket.assigns.live_action, live_comment_params)
  end

  defp save_live_comment(socket, :edit, live_comment_params) do
    case LiveCatalog.update_live_comment(socket.assigns.live_comment, live_comment_params) do
      {:ok, live_comment} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live comment updated successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_comment))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_live_comment(socket, :new, live_comment_params) do
    case LiveCatalog.create_live_comment(live_comment_params) do
      {:ok, live_comment} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live comment created successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_comment))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp return_path("index", _live_comment), do: ~p"/live_comments"
  defp return_path("show", live_comment), do: ~p"/live_comments/#{live_comment}"
end
