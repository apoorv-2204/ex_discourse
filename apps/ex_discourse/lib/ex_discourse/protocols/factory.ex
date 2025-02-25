defprotocol ExDiscourse.Protocols.Factory do
  @spec factory(source :: t(), variant :: atom(), attributes :: map, opts :: Keyword.t()) :: t
  def factory(source, variant, attrs, opts)
end
