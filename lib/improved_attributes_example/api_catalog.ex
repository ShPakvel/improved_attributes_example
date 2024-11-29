defmodule ImprovedAttributesExample.ApiCatalog do
  @moduledoc """
  The ApiCatalog context.
  """

  import Ecto.Query, warn: false
  alias ImprovedAttributesExample.Repo

  alias ImprovedAttributesExample.ApiCatalog.ApiProduct

  @doc """
  Returns the list of api_products.

  ## Examples

      iex> list_api_products()
      [%ApiProduct{}, ...]

  """
  def list_api_products do
    Repo.all(ApiProduct)
  end

  @doc """
  Gets a single api_product.

  Raises `Ecto.NoResultsError` if the Api product does not exist.

  ## Examples

      iex> get_api_product!(123)
      %ApiProduct{}

      iex> get_api_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_product!(id), do: Repo.get!(ApiProduct, id)

  @doc """
  Creates a api_product.

  ## Examples

      iex> create_api_product(%{field: value})
      {:ok, %ApiProduct{}}

      iex> create_api_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_product(attrs \\ %{}) do
    %ApiProduct{}
    |> ApiProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_product.

  ## Examples

      iex> update_api_product(api_product, %{field: new_value})
      {:ok, %ApiProduct{}}

      iex> update_api_product(api_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_product(%ApiProduct{} = api_product, attrs) do
    api_product
    |> ApiProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_product.

  ## Examples

      iex> delete_api_product(api_product)
      {:ok, %ApiProduct{}}

      iex> delete_api_product(api_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_product(%ApiProduct{} = api_product) do
    Repo.delete(api_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_product changes.

  ## Examples

      iex> change_api_product(api_product)
      %Ecto.Changeset{data: %ApiProduct{}}

  """
  def change_api_product(%ApiProduct{} = api_product, attrs \\ %{}) do
    ApiProduct.changeset(api_product, attrs)
  end
end
