defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string

    has_many :comments, Blog.Comment

    timestamps()
  end

  @required_fields [:title, :body]
  @optional_fields ~w()

  @doc """
  Ceates a changeset based on the `model` and `params`.
  If `params` are nil, an invalid changeset is returned
  with no validation performed.

  required_fields: [:title, :body]
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end

  def count_comments(query) do
    from post in query,
      group_by: post.id,
      left_join: comment in assoc(post, :comments),
      select: {post, count(comment.id)}
  end
end
