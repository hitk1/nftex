defmodule Nftex.Arts.Get do
  alias Nftex.{Art, Repo}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> handle_cast()
  end

  defp handle_cast({:ok, uuid}) do
    case Repo.get(Art, uuid) do
      nil -> {:error, "Art does not exists"}
      art -> {:ok, art}
    end
  end

  defp handle_cast(:error), do: {:error, "invalid UUID"}
end
