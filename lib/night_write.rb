require './lib/translator'
require './lib/printer'

translator    = Translator.new
printer       = Printer.new
text_lines    = File.open(ARGV[0])

readfile      = File.read(text_lines)
braille       = translator.encode(readfile)

printer.print(braille)
File.write(ARGV[1], printer)

p "Created '#{ARGV[1]}' containing #{readfile.strip.length} characters"
