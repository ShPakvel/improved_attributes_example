defmodule ImprovedAttributesExample.Repo.Migrations.CreateApiProducts do
  use Ecto.Migration

  def change do
    create table("api_products") do
      add :code, :integer, default: 1234
      add :description, :text
      add :name, :string, null: false
      add :price, :decimal, precision: 10, scale: 5, default: 21.98000
      add :rate, :float, default: 5.0

      timestamps(type: :utc_datetime)
    end
  end
end
