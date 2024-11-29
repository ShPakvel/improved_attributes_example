defmodule ImprovedAttributesExampleWeb.LivePostLive.Form do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveBlog
  alias ImprovedAttributesExample.LiveBlog.LivePost

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      <%= @page_title %>
      <:subtitle>Use this form to manage live_post records in your database.</:subtitle>
    </.header>

    <.simple_form for={@form} id="live_post-form" phx-change="validate" phx-submit="save">
      <.input field={@form[:title]} label="Title" type="text" />
      <.input field={@form[:content]} label="Content" type="textarea" required />
      <.input field={@form[:public]} label="Public" type="checkbox" />
      <.input field={@form[:topics]} label="Topics" type="number" />
      <.input field={@form[:reviewed]} label="Reviewed" type="datetime-local" />
      <.input field={@form[:tags]} label="Tags" type="select" options={["tags value", "updated tags value"]} multiple />
      <:actions>
        <.button phx-disable-with="Saving...">Save Live post</.button>
      </:actions>
    </.simple_form>

    <.back navigate={return_path(@return_to, @live_post)}>Back</.back>
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
    live_post = LiveBlog.get_live_post!(id)

    socket
    |> assign(:page_title, "Edit Live post")
    |> assign(:live_post, live_post)
    |> assign(:form, to_form(LiveBlog.change_live_post(live_post)))
  end

  defp apply_action(socket, :new, _params) do
    live_post = %LivePost{}

    socket
    |> assign(:page_title, "New Live post")
    |> assign(:live_post, live_post)
    |> assign(:form, to_form(LiveBlog.change_live_post(live_post)))
  end

  @impl true
  def handle_event("validate", %{"live_post" => live_post_params}, socket) do
    changeset = LiveBlog.change_live_post(socket.assigns.live_post, live_post_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"live_post" => live_post_params}, socket) do
    save_live_post(socket, socket.assigns.live_action, live_post_params)
  end

  defp save_live_post(socket, :edit, live_post_params) do
    case LiveBlog.update_live_post(socket.assigns.live_post, live_post_params) do
      {:ok, live_post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live post updated successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_post))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_live_post(socket, :new, live_post_params) do
    case LiveBlog.create_live_post(live_post_params) do
      {:ok, live_post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live post created successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_post))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp return_path("index", _live_post), do: ~p"/live_blog_posts"
  defp return_path("show", live_post), do: ~p"/live_blog_posts/#{live_post}"
end
