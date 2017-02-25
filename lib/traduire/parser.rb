module Traduire
  class Parser
    def self.parse(data)
      new(data).parse
    end

    def initialize(data)
      @data = data
    end

    def parse
      matches ? matches.map(&method(:match)) : []
    end

    private

    def matches
      @matches ||= @data.match(/"(.+)"/).try(:captures)
    end

    def match(text)
      Match.new(string: text, line: 1)
    end
  end
end
