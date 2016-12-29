defmodule PhoenixGraqhQLExample.UserResolver do
  alias PhoenixGraqhQLExample.{Repo, User}

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(User, id) do
      nil -> {:error, "Not found"}
      user -> {:ok, user}
    end
  end
end