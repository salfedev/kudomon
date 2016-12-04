require 'trainer'

describe Trainer do
  subject(:luke) { Trainer.new('Luke') }

  describe '#name' do
    it 'returns trainer name' do
      expect(luke.name).to eq 'Luke'
    end
  end
end
