class Match
  attr_accessor :line, :string, :suggestion, :example

  def initialize(string:, line:, suggestion:, example:)
    @string, @line, @suggestion, @example = string, line, suggestion, example
  end
end
