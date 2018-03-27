class Printer
  attr_reader :track1, :track2, :track3, :output_text
  def initialize
    @track1      = ''
    @track2      = ''
    @track3      = ''
    @output_text = ''
  end

  def slice_to_tracks(characters)
    characters.each_slice(3) do |character|
      track1 << character[0]
      track2 << character[1]
      track3 << character[2]
    end
  end
end
