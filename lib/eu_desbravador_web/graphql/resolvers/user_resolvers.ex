defmodule EuDesbravador.Resolvers.User do
  alias EuDesbravador.Repo
  alias EuDesbravador.Models.User

  def get(%{id: id}, %{context: %{current_user: _current_user}}) do
    case Repo.get(User, id) do
      nil ->
        {:error, "User ID #{id} not found"}

      user ->
        {:ok, user}
    end
  end

  def get(%{id: id}, _info) do
    {:error, "Not Authorized"}
  end

  def all(_args, %{context: %{current_user: _current_user}}) do
    {:ok, Repo.all(User)}
  end

  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

  def insert(args, %{context: %{current_user: _current_user}}) do
    %User{}
    |> User.changeset(args)
    |> Repo.insert()
  end

  def insert(args, _info) do
    {:error, "Not Authorized"}
  end

  def store_token(%User{} = user, token) do
    user
    |> User.token_changeset(%{token: token})
    |> Repo.update()
  end

  def login(%{email: email, password: password}, _info) do
    with {:ok, user} <- EuDesbravador.AuthHelper.login_with_email_pass(email, password),
         {:ok, jwt, _} <- EuDesbravador.Guardian.encode_and_sign(user),
         {:ok, _ } <- store_token(user, jwt) do
      {:ok, %{token: jwt}}
    end
  end

  def logout(_args,  %{context: %{current_user: current_user, token: _token}}) do
    store_token(current_user, nil)
    {:ok, current_user}
  end

  def logout(_args, _info) do
    {:error, "Please log in first!"}
  end
end