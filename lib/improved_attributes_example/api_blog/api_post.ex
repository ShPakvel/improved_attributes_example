defmodule ImprovedAttributesExample.ApiBlog.ApiPost do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "api_blog_posts" do
    field :content, :string
    field :public, :boolean, default: true
    field :reviewed, :naive_datetime
    field :tags, {:array, :string}
    field :title, :string
    field :topics, :integer, default: 1

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(api_post, attrs) do
    api_post
    |> cast(attrs, [:content, :public, :reviewed, :tags, :title, :topics])
    |> validate_required([:content, :public])
  end
end
