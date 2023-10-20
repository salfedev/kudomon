require 'trainer'

describe Trainer do
  subject(:luke) { Trainer.new('Luke') }
  it 'has a name' do
    expect(luke.name).to eq 'Luke'
  end

  it 'has a position, initialy nil' do
    expect(luke.position).to be_nil
  end
end
