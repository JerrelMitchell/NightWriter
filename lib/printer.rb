require "./lib/translator.rb"

class Printer

  def print_first_line(characters)
    line1 = characters.map do |chars|
      chars[0]
    end
  end

  def print_second_line(characters)
    line2 = characters.map do |chars|
      chars[1]
    end
  end

  def print_third_line(characters)
    line1 = characters.map do |chars|
      chars[2]
    end
  end
end
