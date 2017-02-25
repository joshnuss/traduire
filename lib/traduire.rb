require "traduire/version"
require 'active_support/all'

require_relative 'traduire/match'
require_relative 'traduire/runner'
require_relative 'traduire/parser'
require_relative 'traduire/transformer'

module Traduire
  extend self

  delegate :parse, to: Parser
  delegate :transform, to: Transformer
end
