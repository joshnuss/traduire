module Traduire
  module Transformer
    extend self

    def transform(source, matches)
      matches.reduce(source, &method(:transform_match))
    end

    private

    def transform_match(source, match)
      source.gsub(%Q("#{match.string}"), "I18n.t(:#{match.suggestion})")
    end
  end
end
