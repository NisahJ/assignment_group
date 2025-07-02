defmodule BookTracker.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BookTracker.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        page: 42,
        read: true,
        title: "some title"
      })
      |> BookTracker.Library.create_book()

    book
  end
end
