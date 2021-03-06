defmodule Blog.CommentTest do
  use Blog.ModelCase

  alias Blog.Comment

  @valid_attrs %{content: "some content", name: "some name", post_id: Enum.random(0..100)}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Comment.changeset(%Comment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Comment.changeset(%Comment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
