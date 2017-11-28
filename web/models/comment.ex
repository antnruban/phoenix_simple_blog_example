defmodule Blog.Comment do
  use Blog.Web, :model

  schema "comments" do
    field :name, :string
    field :content, :string
    belongs_to :post, Blog.Post, foreign_key: :post_id

    timestamps()
  end

  @required_fields [:name, :content, :post_id]
  @optional_fields []

  @doc """
  Ceates a changeset based on the `model` and `params`.
  If `params` are nil, an invalid changeset is returned
  with no validation performed.

  required_fields: [:name, :content, :post_id]
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
