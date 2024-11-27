defmodule ImprovedAttributesExample.Repo do
  use Ecto.Repo,
    otp_app: :improved_attributes_example,
    adapter: Ecto.Adapters.Postgres
end
