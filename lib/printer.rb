require "./lib/translator.rb"

class Printer

  def print(characters)
    string1 = ''
    string2 = ''
    string3 = ''
    characters.each_slice(3) do |character|
      string1  << character[0]
      string2  << character[1]
      string3  << character[2]
    end
  end
end
