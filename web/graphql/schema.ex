defmodule PhoenixGraqhQLExample.Schema do
  use Absinthe.Schema
  import_types PhoenixGraqhQLExample.Schema.Types

  query do
    field :posts, list_of(:post) do

      resolve &PhoenixGraqhQLExample.PostResolver.all/2
    end

    field :users, list_of(:user) do

      resolve &PhoenixGraqhQLExample.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)

      resolve &PhoenixGraqhQLExample.UserResolver.find/2
    end
  end

  input_object :create_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:id)
  end

  input_object :update_post_params do
    field :title, :string
    field :body, :string
  end

  @desc """ 
  增删改操作
  """
  mutation do
    @desc """ 
    创建帖子
    """
    field :create_post, type: :post do
      arg :post, :create_post_params

      resolve &PhoenixGraqhQLExample.PostResolver.create/2
    end

    field :update_post, type: :post do
      arg :id, non_null(:id)  
      arg :post, :update_post_params

      resolve &PhoenixGraqhQLExample.PostResolver.update/2
    end

    field :delete_post, type: :post do
      arg :id, non_null(:id)

      resolve &PhoenixGraqhQLExample.PostResolver.delete/2
    end
  end
end