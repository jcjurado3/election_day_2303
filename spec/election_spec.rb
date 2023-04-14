require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  describe '#initialize' do
    it 'exists' do
      new_election = Election.new("2023")
      expect(new_election).to be_a(Election)
    end

    it 'has attributes' do
      new_election = Election.new("2023")
      expect(new_election.races).to eq([])
      expect(new_election.candidates).to eq([])
    end
  end

  describe '#add_race' do
    it 'can add races to election attribute' do
      new_election = Election.new("2023")
      tx_race = Race.new("Texas Governor")
      new_election.add_race(tx_race)
      expect(new_election.races).to eq([tx_race])
      va_race = Race.new("Virginia Governor")
      new_election.add_race(va_race)
      expect(new_election.races).to eq([tx_race, va_race])
    end
  end

  describe '#candidates' do
    it 'contains array of candidates' do
      new_election = Election.new("2023")
      tx_race = Race.new("Texas Governor")
      diana = Candidate.new({name: "Diana D", party: :democrat})
      candidate1 = tx_race.register_candidate!({name: "Diana D", party: :democrat})
      new_election.add_race(tx_race)
      expect(new_election.candidates).to eq([candidate1])
    end
  end

  describe '#vote_counts' do
    it 'can return a hash of each candidates votes' do
      new_election = Election.new("2023")
      tx_race = Race.new("Texas Governor")
      candidate1 = tx_race.register_candidate!({name: "Diana D", party: :democrat})
      new_election.add_race(tx_race)
      expect(new_election.vote_counts).to eq({"Diana D" => 0})
      candidate1.vote_for!
      candidate1.vote_for!
      expect(new_election.vote_counts).to eq({"Diana D" => 2})
    end
  end
end