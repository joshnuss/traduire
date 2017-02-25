module Traduire
  class Runner
    delegate :read, :write, to: File
    delegate :parse, :transform, to: Traduire

    attr_accessor :files

    def execute 
      @files.each(&method(:convert))
    end

  private

    def convert(path)
      source = read(path)

      localized = localize(source)

      write(path, localized)
    end

    def localize(source)
      matches = parse(source)

      transform(source, matches)
    end
  end
end
