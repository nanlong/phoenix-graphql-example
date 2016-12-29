defmodule PhoenixGraqhQLExample.PostResolver do
  alias PhoenixGraqhQLExample.{Repo, Post}

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def create(%{post: post_params}, _info) do
    %Post{} 
    |> Post.changeset(post_params)
    |> Repo.insert
  end

  def update(%{id: id, post: post_params}, _info) do
    Post
    |> Repo.get!(id)
    |> Post.update_changeset(post_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    Post
    |> Repo.get!(id)
    |> Repo.delete
  end
end