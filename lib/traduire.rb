require "traduire/version"
require 'active_support/all'

require_relative 'traduire/match'
require_relative 'traduire/runner'
require_relative 'traduire/parser'

module Traduire
  extend self

  delegate :parse, to: Parser

  def transform(source, matches)
    matches.reduce(source, &method(:transform_match))
  end

  private

  def transform_match(source, match)
    source.gsub(%Q("#{match.string}"), "I18n.t(:#{match.suggestion})")
  end
end
