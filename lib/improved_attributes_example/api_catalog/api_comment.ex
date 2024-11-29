defmodule ImprovedAttributesExample.ApiCatalog.ApiComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "api_comments" do
    field :body, :string
    belongs_to :api_post, ImprovedAttributesExample.ApiBlog.ApiPost, type: :binary_id
    belongs_to :api_product, ImprovedAttributesExample.ApiCatalog.ApiProduct

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(api_comment, attrs) do
    api_comment
    |> cast(attrs, [:body, :api_post_id, :api_product_id])
    |> validate_required([:body, :api_product_id])
    |> validate_length(:body, max: 303)
    |> assoc_constraint(:api_post)
    |> assoc_constraint(:api_product)
  end
end
