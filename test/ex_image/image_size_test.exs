defmodule ExImage.ImageSizeTest do
  use ExUnit.Case

  alias ExImage.ImageSize

  describe "scale/2" do
    test "width and height is equal" do
      original = %ImageSize{width: 400, height: 400}
      preferred = %ImageSize{width: 400, height: 400}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 400, height: 400} == scaled
    end

    test "height is equal and width is greater" do
      original = %ImageSize{width: 800, height: 200}
      preferred = %ImageSize{width: 200, height: 200}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 200, height: 50} == scaled
    end

    test "height is smaller and width is greater" do
      original = %ImageSize{width: 800, height: 200}
      preferred = %ImageSize{width: 400, height: 400}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 400, height: 100} == scaled
    end

    test "height is greater and width is equal" do
      original = %ImageSize{width: 400, height: 800}
      preferred = %ImageSize{width: 400, height: 400}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 200, height: 400} == scaled
    end

    test "height is greater and widht is greater" do
      original = %ImageSize{width: 600, height: 800}
      preferred = %ImageSize{width: 400, height: 400}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 300, height: 400} == scaled
    end

    test "height is greater and width is smaller" do
      original = %ImageSize{width: 200, height: 800}
      preferred = %ImageSize{width: 400, height: 400}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 100, height: 400} == scaled
    end

    test "height is equal and width is smaller" do
      original = %ImageSize{width: 200, height: 400}
      preferred = %ImageSize{width: 400, height: 400}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 200, height: 400} == scaled
    end

    test "height is smaller and width is equal" do
      original = %ImageSize{width: 400, height: 200}
      preferred = %ImageSize{width: 400, height: 100}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 200, height: 100} == scaled
    end

    test "height is smaller and width is smaller" do
      original = %ImageSize{width: 400, height: 200}
      preferred = %ImageSize{width: 200, height: 100}

      scaled = ImageSize.scale(original, preferred)

      assert %ImageSize{width: 200, height: 100} == scaled
    end
  end
end
