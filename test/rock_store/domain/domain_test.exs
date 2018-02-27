defmodule RockStore.DomainTest do
  use RockStore.DataCase

  alias RockStore.Domain

  describe "bands" do
    alias RockStore.Domain.Band

    @valid_attrs %{bio: "some bio", location: "some location", name: "some name", rating: 42}
    @update_attrs %{bio: "some updated bio", location: "some updated location", name: "some updated name", rating: 43}
    @invalid_attrs %{bio: nil, location: nil, name: nil, rating: nil}

    def band_fixture(attrs \\ %{}) do
      {:ok, band} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Domain.create_band()

      band
    end

    test "list_bands/0 returns all bands" do
      band = band_fixture()
      assert Domain.list_bands() == [band]
    end

    test "get_band!/1 returns the band with given id" do
      band = band_fixture()
      assert Domain.get_band!(band.id) == band
    end

    test "create_band/1 with valid data creates a band" do
      assert {:ok, %Band{} = band} = Domain.create_band(@valid_attrs)
      assert band.bio == "some bio"
      assert band.location == "some location"
      assert band.name == "some name"
      assert band.rating == 42
    end

    test "create_band/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Domain.create_band(@invalid_attrs)
    end

    test "update_band/2 with valid data updates the band" do
      band = band_fixture()
      assert {:ok, band} = Domain.update_band(band, @update_attrs)
      assert %Band{} = band
      assert band.bio == "some updated bio"
      assert band.location == "some updated location"
      assert band.name == "some updated name"
      assert band.rating == 43
    end

    test "update_band/2 with invalid data returns error changeset" do
      band = band_fixture()
      assert {:error, %Ecto.Changeset{}} = Domain.update_band(band, @invalid_attrs)
      assert band == Domain.get_band!(band.id)
    end

    test "delete_band/1 deletes the band" do
      band = band_fixture()
      assert {:ok, %Band{}} = Domain.delete_band(band)
      assert_raise Ecto.NoResultsError, fn -> Domain.get_band!(band.id) end
    end

    test "change_band/1 returns a band changeset" do
      band = band_fixture()
      assert %Ecto.Changeset{} = Domain.change_band(band)
    end
  end

  describe "albums" do
    alias RockStore.Domain.Album

    @valid_attrs %{name: "some name", year: 42}
    @update_attrs %{name: "some updated name", year: 43}
    @invalid_attrs %{name: nil, year: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Domain.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Domain.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Domain.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Domain.create_album(@valid_attrs)
      assert album.name == "some name"
      assert album.year == 42
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Domain.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Domain.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.name == "some updated name"
      assert album.year == 43
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Domain.update_album(album, @invalid_attrs)
      assert album == Domain.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Domain.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Domain.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Domain.change_album(album)
    end
  end
end
