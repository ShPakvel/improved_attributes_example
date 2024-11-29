defmodule ImprovedAttributesExampleWeb.ApiProductController do
  use ImprovedAttributesExampleWeb, :controller

  alias ImprovedAttributesExample.ApiCatalog
  alias ImprovedAttributesExample.ApiCatalog.ApiProduct

  action_fallback ImprovedAttributesExampleWeb.FallbackController

  def index(conn, _params) do
    api_products = ApiCatalog.list_api_products()
    render(conn, :index, api_products: api_products)
  end

  def create(conn, %{"api_product" => api_product_params}) do
    with {:ok, %ApiProduct{} = api_product} <- ApiCatalog.create_api_product(api_product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api_products/#{api_product}")
      |> render(:show, api_product: api_product)
    end
  end

  def show(conn, %{"id" => id}) do
    api_product = ApiCatalog.get_api_product!(id)
    render(conn, :show, api_product: api_product)
  end

  def update(conn, %{"id" => id, "api_product" => api_product_params}) do
    api_product = ApiCatalog.get_api_product!(id)

    with {:ok, %ApiProduct{} = api_product} <- ApiCatalog.update_api_product(api_product, api_product_params) do
      render(conn, :show, api_product: api_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_product = ApiCatalog.get_api_product!(id)

    with {:ok, %ApiProduct{}} <- ApiCatalog.delete_api_product(api_product) do
      send_resp(conn, :no_content, "")
    end
  end
end
