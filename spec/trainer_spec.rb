require 'trainer'
require 'kudomon'
describe Trainer do
  subject(:luke) { Trainer.new('Luke') }
  it 'has a name' do
    expect(luke.name).to eq 'Luke'
  end

  it 'has a position, initialy nil' do
    expect(luke.position).to be_nil
  end

  it 'can calcuate distance to a kudomon', focus: true do
    kekatchu = Kudomon.new('kekatchu', 'electric')
    kekatchu.position = [1, 2]
    luke.position = [2, 2]
    expect(luke).to respond_to(:euclidean_distance).with(1).argument
    expect(luke.euclidean_distance(kekatchu)).to eq 1
  end

  it 'can detect kudomon' do
    kekatchu = Kudomon.new('kekatchu', 'electric')
    kekatchu.position = [1, 2]
    luke.position = [2, 2]
    expect(luke.kudomons).to be_empty
    expect(luke).to respond_to(:detect).with(1).argument
    expect(luke.detect(kekatchu)).to eq true
  end

  it 'can\'t detect kudomon if it is too far away' do
    kekatchu = Kudomon.new('kekatchu', 'electric')
    kekatchu.position = [1, 5]
    luke.position = [4, 2]
    expect(luke.kudomons).to be_empty
    expect(luke.detect(kekatchu)).to eq false
  end

  it 'can catch kudomon' do
    kekatchu = Kudomon.new('kekatchu', 'electric')
    kekatchu.position = [1, 2]
    luke.position = [2, 2]
    expect(luke).to respond_to(:catch).with(1).argument
    expect(luke.kudomons).to be_empty
    luke.catch(kekatchu)
    expect(luke.kudomons).to include kekatchu
  end

  it 'can\'t catch kudomon if it\'s already been caught' do
    kekatchu = Kudomon.new('kekatchu', 'electric')
    kekatchu.position = [1, 2]
    luke.position = [2, 2]
    expect(luke).to respond_to(:catch).with(1).argument
    expect(luke.kudomons).to be_empty
    luke.catch(kekatchu)
    expect(luke.kudomons).to include kekatchu
    expect(kekatchu.trainer).to eq luke
    expect { luke.catch(kekatchu) }.to raise_error 'This kudomon has already been caught'
  end
end
