class TelevisionShow
  attr_reader :title, :network, :year, :genre, :synopsis, :error
  GENRES = ["Action", "Mystery", "Drama", "Comedy", "Fantasy"]
  def initialize(title, network, year, genre, synopsis)
    @title = title
    @network = network
    @year = year
    @genre = genre
    @synopsis = synopsis
    @error = []
  end

  def valid?
    title_string = ""
    TelevisionShow.all.each do|show|
      title_string += show.title.to_s
    end
    if title_string.include?(@title)
        @error << "The show has already added"
    end
    if @title=="" || @network=="" || @year=="" || @genre=="" || @synopsis==""
      @error = ["Please fill in all required fields"]
    end
    if @error.count == 0
      true
    else
      false
    end
  end



  def self.all
    @tv_shows = []
    CSV.foreach('television-shows.csv', headers: true, header_converters: :symbol) do |row|
      show = row.to_hash
      show_object = TelevisionShow.new(show[:title], show[:network], show[:year], show[:genre], show[:synopsis])
      @tv_shows << show_object
    end
    @tv_shows
  end
end
