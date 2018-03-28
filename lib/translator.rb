# handles manipulation of alphanumeric characters into/from braille.
class Translator
  attr_reader :alphabet, :numerics, :reverse_alphabet
  def initialize
    @alphabet = { 'a' => ['0.', '..', '..'],
                  'b' => ['0.', '0.', '..'],
                  'c' => ['00', '..', '..'],
                  'd' => ['00', '.0', '..'],
                  'e' => ['0.', '.0', '..'],
                  'f' => ['00', '0.', '..'],
                  'g' => ['00', '00', '..'],
                  'h' => ['0.', '00', '..'],
                  'i' => ['.0', '0.', '..'],
                  'j' => ['.0', '00', '..'],
                  'k' => ['0.', '..', '0.'],
                  'l' => ['0.', '0.', '0.'],
                  'm' => ['00', '..', '0.'],
                  'n' => ['00', '.0', '0.'],
                  'o' => ['0.', '.0', '0.'],
                  'p' => ['00', '0.', '0.'],
                  'q' => ['00', '00', '0.'],
                  'r' => ['0.', '00', '0.'],
                  's' => ['.0', '0.', '0.'],
                  't' => ['.0', '00', '0.'],
                  'u' => ['0.', '..', '00'],
                  'v' => ['0.', '0.', '00'],
                  'w' => ['.0', '00', '.0'],
                  'x' => ['00', '..', '00'],
                  'y' => ['00', '.0', '00'],
                  'z' => ['0.', '.0', '00'],
                  ' ' => ['..', '..', '..'],
                  '.' => ['..', '00', '.0'],
                  '?' => ['..', '0.', '00'],
                  '!' => ['..', '00', '0.'],
                  "'" => ['..', '..', '0.'],
                  ',' => ['..', '0.', '..'],
                  '-' => ['..', '..', '00'],
                  letter_shift: ['..', '..', '.0'] }
    @numerics = { '0' => ['.0', '00', '..'],
                  '1' => ['0.', '..', '..'],
                  '2' => ['0.', '0.', '..'],
                  '3' => ['00', '..', '..'],
                  '4' => ['00', '.0', '..'],
                  '5' => ['0.', '.0', '..'],
                  '6' => ['00', '0.', '..'],
                  '7' => ['00', '00', '..'],
                  '8' => ['0.', '00', '..'],
                  '9' => ['.0', '0.', '..'],
                  number_shift: ['.0', '.0', '00'] }
    @reverse_alphabet = @alphabet.invert
  end

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
    key = characters.chars.each_slice(2).map(&:join)
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
