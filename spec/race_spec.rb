require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  describe '#initialize' do
    it 'exits' do
      race = Race.new("Texas Governor")
      expect(race).to be_a(Race)
    end

    it 'has attributes' do 
      race = Race.new("Texas Governor")
      expect(race.office).to eq("Texas Governor")
      expect(race.candidates).to eq([])
    end
  end

  describe '#register_candidate!' do
    it 'can add registed candidates' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1).to be_a(Candidate)
    end

    it 'has the Candidate attributes' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
    end

    it 'updates candidates array with registed candidates' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates).to eq([candidate1, candidate2])
    end
  end

  describe '#open?' do
    it 'can check wheather a race is open or not' do
      race = Race.new("Texas Governor")
      expect(race.open?).to eq(true)
    end
  end

  describe '#close!' do
    it 'can close the race' do
      race = Race.new("Texas Governor")
      expect(race.open?).to eq(true)
      race.close!
      expect(race.open?).to eq(false)
    end
  end

  describe '#winner' do
    it 'returns false if race is still open' do
      race = Race.new("Texas Governor")
      expect(race.winner).to eq(false)
    end

    it 'returns the winner with the most votes' do
      
    end
  end
end