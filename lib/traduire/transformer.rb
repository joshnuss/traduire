module Traduire
  module Transformer
    extend self

    def transform(source, matches)
      matches.reduce(source, &method(:replace))
    end

    private

    def replace(source, match)
      source.gsub(%Q("#{match.string}"), "I18n.t(:#{match.suggestion})")
    end
  end
end
