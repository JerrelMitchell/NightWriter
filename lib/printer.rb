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

  def fill_tracks(character)
    track1 << character[0]
    track2 << character[1]
    track3 << character[2]
  end

  def end_track(track)
    track.slice!(0..79) << "\n"
  end

  def tracks_into_output(track)
    until track.empty?
      output_text << end_track(track1)
      output_text << end_track(track2)
      output_text << end_track(track3)
    end
  end

  def print_tracks(characters)
    characters.each_slice(3) do |character|
      fill_tracks(character)
    end
    tracks_into_output(track1)
    output_text
  end
end
