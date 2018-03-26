require './lib/translator'
require './lib/printer'

message_opener = File.open(ARGV[0])
plaintext      = File.read(message_opener)
translate      = Translator.new.english_to_braille(plaintext)
encoded_text   = Printer.new.print(translate)

File.write(ARGV[1], encoded_text)

p "Created '#{ARGV[1]}' containing #{plaintext.strip.length} characters"
