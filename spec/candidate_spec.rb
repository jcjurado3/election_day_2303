require './lib/candidate'

RSpec.describe Candidate do
  describe '#initialize' do
    it 'exists' do
      diana = Candidate.new({name: "Diana D", party: :democrat})
      expect(diana).to be_a(Candidate)
    end

    it 'has attributes' do
      diana = Candidate.new({name: "Diana D", party: :democrat})
      expect(diana.name).to eq("Diana D")
      expect(diana.party).to eq(:democrat)
      expect(diana.votes).to eq(0)
    end
  end

  describe '#vote_for!' do
    it 'can add votes' do
      diana = Candidate.new({name: "Diana D", party: :democrat})
      expect(diana.votes).to eq(0)
      diana.vote_for!
      diana.vote_for!
      diana.vote_for!
      expect(diana.votes).to eq(3)
      diana.vote_for!
      expect(diana.votes).to eq(4)
    end
  end
end