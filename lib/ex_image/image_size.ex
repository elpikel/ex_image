defmodule ExImage.ImageSize do
  @enforce_keys [:width, :height]
  defstruct [:width, :height]

  @type t :: %__MODULE__{}

  @spec scale(t, t) :: t
  def scale(image_size, preferred_size) do
    ratio_width = ratio(image_size.width, preferred_size.width)
    ratio_height = ratio(image_size.height, preferred_size.height)
    ratio = if ratio_width <= ratio_height, do: ratio_width, else: ratio_height

    %__MODULE__{width: trunc(image_size.width * ratio), height: trunc(image_size.height * ratio)}
  end

  defp ratio(original, preferred), do: preferred / original
end
