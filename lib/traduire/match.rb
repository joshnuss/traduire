module Traduire
  class Match
    attr_accessor :line, :string

    def initialize(string:, line:)
      @string, @line = string, line
    end

    def suggestion
      @string.downcase.gsub(' ', '_').tr('!', '')
    end

    def example(data)
      data.gsub("\"#{@string}\"", "I18n.t(:#{suggestion})")
    end
  end
end
