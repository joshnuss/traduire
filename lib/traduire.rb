require "traduire/version"
require 'active_support/all'
require_relative 'traduire/match'

module Traduire
  extend self

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
