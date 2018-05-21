defmodule Eudesbravador.Resolvers.Class do
  alias EuDesbravador.Repo
  alias EuDesbravador.Models.Class

  def get(_parent, %{id: id}, _resolution, %{context: %{current_user: _current_user}}) do
    case Repo.get(Class, id) do
      nil ->
        {:error, "Class ID #{id} not found"}

      class ->
        {:ok, class}
    end
  end

  def all(_args, %{context: %{current_user: _current_user}}) do
    {:ok, Repo.all(Class)}
  end

  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

end
