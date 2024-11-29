defmodule ImprovedAttributesExample.ApiCatalog.ApiProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "api_products" do
    field :code, :integer, default: 1234
    field :description, :string
    field :name, :string
    field :price, :decimal, default: Decimal.new("21.98000")
    field :rate, :float, default: 5.0

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(api_product, attrs) do
    api_product
    |> cast(attrs, [:code, :description, :name, :price, :rate])
    |> validate_required([:name])
  end
end
