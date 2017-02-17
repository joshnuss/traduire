require 'test_helper'

class TraduireTest < Minitest::Test
  def test_parses_no_matches
    matches = parse "puts 123"

    assert_predicate matches, :empty?
  end

  def test_parses_file
    matches = parse 'puts "Hello World!"'

    assert_equal 1, matches.length

    match = matches.first

    assert_equal 1, match.line
    assert_equal 'Hello World!', match.string
    assert_equal 'hello_world', match.suggestion
    assert_equal 'puts I18n.t(:hello_world)', match.example
  end

  class Match
    attr_accessor :line, :string, :suggestion, :example

    def initialize(string:, line:, suggestion:, example:)
      @string, @line, @suggestion, @example = string, line, suggestion, example
    end
  end

  def parse(data)
    return [] unless matches = data.match(/"(.+)"/)

    matches.captures.map do |text|
      key = text.downcase.gsub(' ', '_').tr('!', '')

      Match.new(string: text,
                line: 1,
                suggestion: key,
                example: data.gsub("\"#{text}\"", "I18n.t(:#{key})"))
    end
  end
end
