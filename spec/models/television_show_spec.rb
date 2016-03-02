require "spec_helper"

describe TelevisionShow do
  # Add tests here
  let (:tv_show) { TelevisionShow.new("Simpsons","FOX","1989", "Comedy", "A yellow family from Springfield")}
  describe ".new" do
    it "has title and reader" do
      expect(tv_show.title).to eq("Simpsons")
    end
    it "has network and reader" do
      expect(tv_show.network).to eq("FOX")
    end
    it "has starting year and reader" do
      expect(tv_show.year).to eq("1989")
    end
    it "has genre and reader" do
      expect(tv_show.genre).to eq("Comedy")
    end
    it "has synopsis and reader" do
      expect(tv_show.synopsis).to eq("A yellow family from Springfield")
    end
  end
  describe ".all" do
    it "Returns all shows as an array" do
      expect(TelevisionShow.all).to be_a(Array)
    end
  end
end
