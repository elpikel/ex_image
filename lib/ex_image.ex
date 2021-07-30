defmodule ExImage do
  alias ExImage.ImageSize

  require Logger

  @spec thumbnail(binary(), ImageSize.t()) :: {:ok, Path.t()} | {:error, String.t()}
  def thumbnail(image, preffered_size) do
    with {:ok, handler} <- ExMagick.init(),
         {:ok, loaded_image} <- ExMagick.image_load(handler, {:blob, image}),
         {:ok, image_size} <- ExMagick.size(loaded_image),
         thumbnail_size <- ImageSize.scale(image_size, preffered_size),
         {:ok, thumbnail} <-
           ExMagick.thumb(loaded_image, thumbnail_size.width, thumbnail_size.height),
         {:ok, resized_image} <- ExMagick.image_dump(thumbnail) do
      {:ok, resized_image}
    else
      {:error, message} = error ->
        Logger.error(message)
        error
    end
  catch
    error ->
      Logger.error(error)
      {:error, error.message}
  end
end
