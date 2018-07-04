defmodule ExCompare do
  @on_load :load_nifs

  def load_nifs do
    # Load priv/nif_compare.so
    :my_nif
    |> :code.priv_dir
    |> Path.join("nif_compare")
    |> :erlang.load_nif(0)
  end

  def compare(_a, _b) do
    raise "NIF compare/2 not implemented"
  end
end
