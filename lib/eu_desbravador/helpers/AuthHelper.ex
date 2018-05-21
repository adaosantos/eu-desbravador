defmodule EuDesbravador.AuthHelper do
  @moduledoc false

  import Comeonin.Bcrypt, only: [checkpw: 2]
  alias EuDesbravador.Repo
  alias EuDesbravador.Models.User

  def login_with_email_pass(email, given_pass) do
    user = Repo.get_by(User, email: String.downcase(email))

    cond do
      user && checkpw(given_pass, user.password) ->
        {:ok, user}

      user ->
        {:error, "Incorrect login credentials"}

      true ->
        {:error, :"User not found"}
    end
  end
end