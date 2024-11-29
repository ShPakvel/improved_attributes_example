defmodule ImprovedAttributesExample.LiveCatalog.LiveComment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "live_comments" do
    field :body, :string
    belongs_to :live_post, ImprovedAttributesExample.LiveBlog.LivePost, type: :binary_id
    belongs_to :live_product, ImprovedAttributesExample.LiveCatalog.LiveProduct

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(live_comment, attrs) do
    live_comment
    |> cast(attrs, [:body, :live_post_id, :live_product_id])
    |> validate_required([:body, :live_product_id])
    |> validate_length(:body, max: 303)
    |> assoc_constraint(:live_post)
    |> assoc_constraint(:live_product)
  end
end
