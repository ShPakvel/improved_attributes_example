defmodule ImprovedAttributesExampleWeb.LiveProductLive.Form do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveCatalog
  alias ImprovedAttributesExample.LiveCatalog.LiveProduct

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      <%= @page_title %>
      <:subtitle>Use this form to manage live_product records in your database.</:subtitle>
    </.header>

    <.simple_form for={@form} id="live_product-form" phx-change="validate" phx-submit="save">
      <.input field={@form[:name]} label="Name" type="text" required />
      <.input field={@form[:description]} label="Description" type="textarea" />
      <.input field={@form[:price]} label="Price" type="number" step="any" />
      <.input field={@form[:rate]} label="Rate" type="number" step="any" />
      <.input field={@form[:code]} label="Code" type="number" />
      <:actions>
        <.button phx-disable-with="Saving...">Save Live product</.button>
      </:actions>
    </.simple_form>

    <.back navigate={return_path(@return_to, @live_product)}>Back</.back>
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
    live_product = LiveCatalog.get_live_product!(id)

    socket
    |> assign(:page_title, "Edit Live product")
    |> assign(:live_product, live_product)
    |> assign(:form, to_form(LiveCatalog.change_live_product(live_product)))
  end

  defp apply_action(socket, :new, _params) do
    live_product = %LiveProduct{}

    socket
    |> assign(:page_title, "New Live product")
    |> assign(:live_product, live_product)
    |> assign(:form, to_form(LiveCatalog.change_live_product(live_product)))
  end

  @impl true
  def handle_event("validate", %{"live_product" => live_product_params}, socket) do
    changeset = LiveCatalog.change_live_product(socket.assigns.live_product, live_product_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"live_product" => live_product_params}, socket) do
    save_live_product(socket, socket.assigns.live_action, live_product_params)
  end

  defp save_live_product(socket, :edit, live_product_params) do
    case LiveCatalog.update_live_product(socket.assigns.live_product, live_product_params) do
      {:ok, live_product} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live product updated successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_product))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_live_product(socket, :new, live_product_params) do
    case LiveCatalog.create_live_product(live_product_params) do
      {:ok, live_product} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live product created successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, live_product))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp return_path("index", _live_product), do: ~p"/live_products"
  defp return_path("show", live_product), do: ~p"/live_products/#{live_product}"
end
