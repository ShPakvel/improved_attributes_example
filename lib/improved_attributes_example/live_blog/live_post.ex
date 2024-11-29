defmodule ImprovedAttributesExample.LiveBlog.LivePost do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "live_blog_posts" do
    field :content, :string
    field :public, :boolean, default: true
    field :reviewed, :naive_datetime
    field :tags, {:array, :string}
    field :title, :string
    field :topics, :integer, default: 1

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(live_post, attrs) do
    live_post
    |> cast(attrs, [:content, :public, :reviewed, :tags, :title, :topics])
    |> validate_required([:content, :public])
  end
end
