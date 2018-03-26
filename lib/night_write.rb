require './lib/translator'
require './lib/printer'

translator   = Translator.new
printer      = Printer.new

message_file = File.open(ARGV[0])
plaintext    = File.read(message_file)

translation  = translator.english_to_braille(plaintext)

encoded_text = printer.print(translation)
File.write(ARGV[1], encoded_text)

p "Created '#{ARGV[1]}' containing #{plaintext.strip.length} characters"
