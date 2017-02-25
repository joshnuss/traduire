require 'test_helper'

class RunnerTest < Minitest::Test
  def setup
    @runner = Traduire::Runner.new

    FileUtils.cp('test/fixtures/hello_world.rb', 'test/dummy/hello_world.rb')
  end

  def test_runner
    @runner.files = ['test/dummy/hello_world.rb']
    @runner.transform

    assert_equal "puts I18n.t(:hello_world)\n", File.read('test/dummy/hello_world.rb')
  end
end
