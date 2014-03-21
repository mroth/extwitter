defmodule ExTwitter.API.Users do
  @moduledoc """
  Provides users API interfaces.
  """

  import ExTwitter.API.Base

  def user_search(query, options \\ []) do
    params = ExTwitter.Parser.parse_request_params([q: query] ++ options)
    request(:get, "1.1/users/search.json", params)
      |> Enum.map(&ExTwitter.Parser.parse_user/1)
  end
end
