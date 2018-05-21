defmodule EuDesbravador.Resolvers.Class do
  alias EuDesbravador.Repo
  alias EuDesbravador.Models.Class

  def get(%{id: id}, %{context: %{current_user: _current_user}}) do
    case Repo.get(Class, id) do
      nil ->
        {:error, "Class ID #{id} not found"}

      class ->
        {:ok, class}
    end
  end

  def get(%{id: id}, _info) do
    {:error, "Not Authorized"}
  end

  def all(_args, %{context: %{current_user: _current_user}}) do
    {:ok, Repo.all(Class)}
  end

  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

  def insert(args, %{context: %{current_user: _current_user}}) do
    %Class{}
    |> Class.changeset(args)
    |> Repo.insert()
  end

  def insert(args, _info) do
    {:error, "Not Authorized"}
  end

end
