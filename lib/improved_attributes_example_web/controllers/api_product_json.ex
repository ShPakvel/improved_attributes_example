defmodule ImprovedAttributesExampleWeb.ApiProductJSON do
  alias ImprovedAttributesExample.ApiCatalog.ApiProduct

  @doc """
  Renders a list of api_products.
  """
  def index(%{api_products: api_products}) do
    %{data: for(api_product <- api_products, do: data(api_product))}
  end

  @doc """
  Renders a single api_product.
  """
  def show(%{api_product: api_product}) do
    %{data: data(api_product)}
  end

  defp data(%ApiProduct{} = api_product) do
    %{
      id: api_product.id,
      name: api_product.name,
      description: api_product.description,
      price: api_product.price,
      rate: api_product.rate,
      code: api_product.code
    }
  end
end
