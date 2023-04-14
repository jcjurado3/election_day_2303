class Election
  attr_reader :year, 
              :races, 
              :candidates

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    @races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
    vote_count = Hash.new(0)
    @races.each do |race|
      race.candidates.each do |candidate|
        vote_count[candidate.name] += candidate.votes
      end
    end
    vote_count
  end
end