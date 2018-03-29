require './lib/alphanumeric_libraries'
# handles manipulation of alphanumeric characters into/from braille using the
# alphanumeric_libraries module.
class Translator
  include AlphanumericLibraries

  def english_to_braille(characters)
    clean_and_split(characters).map do |character|
      add_shift?(character)
    end.flatten
  end

  def clean_and_split(characters)
    characters.delete("/\n/").split('')
  end

  def add_shift?(character)
    if character.count('0-9') > 0
      numerics.fetch_values(:number_shift, character)
    elsif character == character.downcase
      alphabet[character]
    else
      alphabet.fetch_values(:letter_shift, character.downcase)
    end
  end

  def braille_to_english(characters)
    keys = characters.chars.each_slice(2).map(&:join)
    string = ''
    keys.each_slice(3) do |key|
      next if reverse_alphabet[key] == :letter_shift
      string << reverse_alphabet[key]
    end
    string
  end
end
