defmodule PhoenixGraqhQLExample.Post do
  use PhoenixGraqhQLExample.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, PhoenixGraqhQLExample.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
    |> assoc_constraint(:user)
  end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [], [:title, :body])
  end
end
