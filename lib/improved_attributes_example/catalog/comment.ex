defmodule ImprovedAttributesExample.Catalog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "comments" do
    field :body, :string
    belongs_to :post, ImprovedAttributesExample.Blog.Post, type: :binary_id
    belongs_to :product, ImprovedAttributesExample.Catalog.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :post_id, :product_id])
    |> validate_required([:body, :product_id])
    |> validate_length(:body, max: 303)
    |> assoc_constraint(:post)
    |> assoc_constraint(:product)
  end
end
