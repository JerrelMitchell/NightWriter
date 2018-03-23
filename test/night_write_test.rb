require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'

class NightWriterTest
  def test_it_exists
    encryptor = NightWrite.new

    assert_instance_of NightWrite, encryptor
  end
end
