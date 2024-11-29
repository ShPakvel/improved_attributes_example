defmodule ImprovedAttributesExampleWeb.ApiNoteController do
  use ImprovedAttributesExampleWeb, :controller

  alias ImprovedAttributesExample.ApiBlog
  alias ImprovedAttributesExample.ApiBlog.ApiNote

  action_fallback ImprovedAttributesExampleWeb.FallbackController

  def index(conn, _params) do
    api_notes = ApiBlog.list_api_notes()
    render(conn, :index, api_notes: api_notes)
  end

  def create(conn, %{"api_note" => api_note_params}) do
    with {:ok, %ApiNote{} = api_note} <- ApiBlog.create_api_note(api_note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api_notes/#{api_note}")
      |> render(:show, api_note: api_note)
    end
  end

  def show(conn, %{"id" => id}) do
    api_note = ApiBlog.get_api_note!(id)
    render(conn, :show, api_note: api_note)
  end

  def update(conn, %{"id" => id, "api_note" => api_note_params}) do
    api_note = ApiBlog.get_api_note!(id)

    with {:ok, %ApiNote{} = api_note} <- ApiBlog.update_api_note(api_note, api_note_params) do
      render(conn, :show, api_note: api_note)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_note = ApiBlog.get_api_note!(id)

    with {:ok, %ApiNote{}} <- ApiBlog.delete_api_note(api_note) do
      send_resp(conn, :no_content, "")
    end
  end
end
