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
    keys.each_slice(3) do |key|
       key
    end
    reverse_alphabet[key]
  end
end

# method adds ONE number shift if there're any number of numbers put together
# ONE letter shift if a word is capitalized.
# and TWO shifts if there is a WORD/ABBREVIATION made of capitals letters.

# method needs to be broken up and encapsulated
# pull out number and letter shift into methods that will add shifts on their
# own accord to better control amount of shift characters!!!

# def shift_capitals?(words)
#   words.split(' ').map do |word|
#     if word.capitalize == word
#       alphabet[:letter_shift]
#     elsif word.upcase == word
#       alphabet[:letter_shift] + alphabet[:letter_shift]
#     else
#       word
#     end
#   end
# end
