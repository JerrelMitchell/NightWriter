require './lib/translator'
require './lib/printer'

lines = File.open(ARGV[0])
plaintext = File.read(lines)
File.write(ARGV[1], final_text)

puts "Created '#{ARGV[1]}' containing#{plaintext.strip.length} characters"
