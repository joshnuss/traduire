module Traduire
  class Runner
    delegate :read, :write, to: File

    attr_accessor :files

    def transform
      @files.each &method(:transform_file)
    end

  private

    def transform_file(path)
      source = read(path)

      matches = Traduire.parse(source)
      transformed = Traduire.transform(source, matches)

      write(path, transformed)
    end
  end
end
