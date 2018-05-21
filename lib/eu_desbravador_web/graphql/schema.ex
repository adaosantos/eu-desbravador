defmodule EuDesbravador.Schema do
  use Absinthe.Schema
  alias EuDesbravador.Resolvers

  import_types(EuDesbravador.Types.User)
  import_types(EuDesbravador.Types.Class)

  query do
    @desc "Login"
    field :login, type: :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.User.login/2)
    end

    @desc "Get user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.User.get/2)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.all/2)
    end

    @desc "Get Class"
    field :class, :class do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Class.get/2)
    end

    @desc "Get all classess"
    field :classes, list_of(:class) do
      resolve(&Resolvers.Class.all/2)
    end
  end

  mutation do
    # User mutations
    @desc "Insert user"
    field :create_user, :user do
      arg(:active, non_null(:boolean))
      arg(:email, non_null(:string))
      arg(:name, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.User.insert/2)
    end

    @desc "Sign Out"
    field :sign_out, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.User.logout/2)
    end

    # Class mutations

    @desc "Insert Class"
    field :create_class, :class do
      arg(:active, non_null(:boolean))
      arg(:name, non_null(:string))
      arg(:slug, non_null(:string))
      arg(:advanced, non_null(:boolean))
      arg(:badge, non_null(:string))

      resolve(&Resolvers.Class.insert/2)
    end

    @desc "Update Class"
    field :update_class, :class do
      arg(:id, non_null(:id))
      arg(:class, :update_class_params)

      resolve(&Resolvers.Class.update/2)
    end
  end
end