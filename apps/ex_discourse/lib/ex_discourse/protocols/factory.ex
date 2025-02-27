defprotocol ExDiscourse.Protocols.Factory do
  @spec gen(source :: t(), variant :: atom(), attributes :: map) :: t
  def gen(source, variant, attrs)
end
