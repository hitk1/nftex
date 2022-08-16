defmodule NftexWeb.Middlewares.Log do
  require Logger
  @behaviour Absinthe.Middleware

  def call(resolution, _context) do
    resolution
    |> log_message()
    |> filter_info()
    |> Logger.debug()

    resolution
  end

  defp log_message(%Absinthe.Resolution{value: value}), do: "Resolution value: #{inspect(value)}"

  defp filter_info(log), do: String.replace(log, ~r/hash: "\w*"/, "hash: [filtered]")
end
