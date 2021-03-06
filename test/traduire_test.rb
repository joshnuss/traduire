require 'test_helper'

class TraduireTest < Minitest::Test
  def test_parses_no_matches
    matches = Traduire.parse "puts 123"

    assert_predicate matches, :empty?
  end

  def test_parses_file
    source = 'puts "Hello World!"'
    matches = Traduire.parse(source)

    assert_equal 1, matches.length

    match = matches.first

    assert_equal 1, match.line
    assert_equal 'Hello World!', match.string
    assert_equal 'hello_world', match.suggestion
    assert_equal 'puts I18n.t(:hello_world)', match.example(source)
  end

  def test_transforms_source
    match = Traduire::Match.new(string: "hello there", line: 1)
    source = 'puts "hello there"'

    result = Traduire.transform(source, [match])

    assert_equal "puts I18n.t(:hello_there)", result
  end
end
