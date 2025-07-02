defmodule BookTracker.LibraryTest do
  use BookTracker.DataCase

  alias BookTracker.Library

  describe "books" do
    alias BookTracker.Library.Book

    import BookTracker.LibraryFixtures

    @invalid_attrs %{read: nil, title: nil, author: nil, page: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{read: true, title: "some title", author: "some author", page: 42}

      assert {:ok, %Book{} = book} = Library.create_book(valid_attrs)
      assert book.read == true
      assert book.title == "some title"
      assert book.author == "some author"
      assert book.page == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{read: false, title: "some updated title", author: "some updated author", page: 43}

      assert {:ok, %Book{} = book} = Library.update_book(book, update_attrs)
      assert book.read == false
      assert book.title == "some updated title"
      assert book.author == "some updated author"
      assert book.page == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end
end
