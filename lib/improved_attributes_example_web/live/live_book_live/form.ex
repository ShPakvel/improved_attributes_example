defmodule ImprovedAttributesExampleWeb.LiveBookLive.Form do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveGeneral.LiveLibrary
  alias ImprovedAttributesExample.LiveGeneral.LiveLibrary.LiveBook

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      <%= @page_title %>
      <:subtitle>Use this form to manage live_book records in your database.</:subtitle>
    </.header>

    <.simple_form for={@form} id="live_book-form" phx-change="validate" phx-submit="save">
      <.input field={@form[:name]} label="Name" type="text" required />
      <.input field={@form[:isbn]} label="Isbn" type="text" required />
      <.input field={@form[:index_page]} label="Index page" type="number" />
      <.input field={@form[:print_size]} label="Print size" type="number" step="any" />
      <.input field={@form[:rate]} label="Rate" type="number" step="any" />
      <.input field={@form[:free]} label="Free" type="checkbox" />
      <.input field={@form[:author_real_name]} label="Author real name" type="text" />
      <:actions>
        <.button phx-disable-with="Saving...">Save Live book</.button>
      </:actions>
    </.simple_form>

    <.back navigate={return_path(@return_to, @live_book)}>Back</.back>
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
    live_book = LiveLibrary.get_live_book!(id)

    socket
    |> assign(:page_title, "Edit Live book")
    |> assign(:live_book, live_book)
    |> assign(:form, to_form(LiveLibrary.change_live_book(live_book)))
  end

  defp apply_action(socket, :new, _params) do
    live_book = %LiveBook{}

    socket
    |> assign(:page_title, "New Live book")
    |> assign(:live_book, live_book)
    |> assign(:form, to_form(LiveLibrary.change_live_book(live_book)))
  end

  @impl true
  def handle_event("validate", %{"live_book" => live_book_params}, socket) do
    changeset = LiveLibrary.change_live_book(socket.assigns.live_book, live_book_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"live_book" => live_book_params}, socket) do
    save_live_book(socket, socket.assigns.live_action, live_book_params)
  end

  defp save_live_book(socket, :edit, live_book_params) do
    case LiveLibrary.update_live_book(socket.assigns.live_book, live_book_params) do
      {:ok, live_book} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live book updated successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_book))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_live_book(socket, :new, live_book_params) do
    case LiveLibrary.create_live_book(live_book_params) do
      {:ok, live_book} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live book created successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_book))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp return_path("index", _live_book), do: ~p"/live_books"
  defp return_path("show", live_book), do: ~p"/live_books/#{live_book}"
end
