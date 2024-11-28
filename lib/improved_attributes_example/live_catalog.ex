defmodule ImprovedAttributesExample.LiveCatalog do
  @moduledoc """
  The LiveCatalog context.
  """

  import Ecto.Query, warn: false
  alias ImprovedAttributesExample.Repo

  alias ImprovedAttributesExample.LiveCatalog.LiveProduct

  @doc """
  Returns the list of live_products.

  ## Examples

      iex> list_live_products()
      [%LiveProduct{}, ...]

  """
  def list_live_products do
    Repo.all(LiveProduct)
  end

  @doc """
  Gets a single live_product.

  Raises `Ecto.NoResultsError` if the Live product does not exist.

  ## Examples

      iex> get_live_product!(123)
      %LiveProduct{}

      iex> get_live_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_live_product!(id), do: Repo.get!(LiveProduct, id)

  @doc """
  Creates a live_product.

  ## Examples

      iex> create_live_product(%{field: value})
      {:ok, %LiveProduct{}}

      iex> create_live_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_live_product(attrs \\ %{}) do
    %LiveProduct{}
    |> LiveProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a live_product.

  ## Examples

      iex> update_live_product(live_product, %{field: new_value})
      {:ok, %LiveProduct{}}

      iex> update_live_product(live_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_live_product(%LiveProduct{} = live_product, attrs) do
    live_product
    |> LiveProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a live_product.

  ## Examples

      iex> delete_live_product(live_product)
      {:ok, %LiveProduct{}}

      iex> delete_live_product(live_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_live_product(%LiveProduct{} = live_product) do
    Repo.delete(live_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking live_product changes.

  ## Examples

      iex> change_live_product(live_product)
      %Ecto.Changeset{data: %LiveProduct{}}

  """
  def change_live_product(%LiveProduct{} = live_product, attrs \\ %{}) do
    LiveProduct.changeset(live_product, attrs)
  end
end
