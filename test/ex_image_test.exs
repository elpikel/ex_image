defmodule ExImageTest do
  use ExUnit.Case

  alias ExImage.ImageSize

  describe "thumbnail/2" do
    test "generates thumbnail" do
      image = File.read!("test/fixtures/image.jpeg")

      {:ok, thumbnail} = ExImage.thumbnail(image, %ImageSize{width: 400, height: 400})

      assert thumbnail
    end

    test "returns error for incorrect file" do
      {:error, message} = ExImage.thumbnail("image", %ImageSize{width: 400, height: 400})

      assert message == "Unable to deduce image format"
    end
  end
end
