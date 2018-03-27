# handles seperation of translated characters into
# 2x3 individual tracks for output file.
class Printer
  attr_reader :track1, :track2, :track3, :output_text
  def initialize
    @track1      = ''
    @track2      = ''
    @track3      = ''
    @output_text = ''
  end

  # outputs translated characters into tracks.
  def print_tracks(characters)
    characters.each_slice(3) do |character|
      fill_tracks(character)
    end
    empty_tracks_into_output(track1)
    output_text
  end

  # each individual translated character seperated as strings is
  # seperated further into its own 1x2 "track".
  def fill_tracks(character)
    track1 << character[0]
    track2 << character[1]
    track3 << character[2]
  end

  # tracks of sliced characters are shovelled into output text until the track
  # string is empty.
  def empty_tracks_into_output(track)
    until track.empty?
      output_text << end_track(track1)
      output_text << end_track(track2)
      output_text << end_track(track3)
    end
  end

  # permanently alters strings in arrays by calling slice! method until then
  # character count reaches 79 on a given track. then adds a new line to end of
  # track.
  def end_track(track)
    track.slice!(0..79) << "\n"
  end
end
