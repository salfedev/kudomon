require 'kudomon'

describe Kudomon do
  subject(:kudomon) { Kudomon.new('sourbulb', 'grass') }

  it 'initializes with a species' do
    expect(kudomon.species).to eq 'sourbulb'
  end

  it 'initializes with a type' do
    expect(kudomon.type).to eq 'grass'
  end

  it 'has a position, initialy nil' do
    expect(kudomon.position).to be_nil
  end

  it 'has a trainer, initialy nil' do
    expect(kudomon.trainer).to be_nil
  end
  it 'has health points, initialy 100' do
    expect(kudomon.health_points).to eq 100
  end

  it 'can lose health points' do
    expect(kudomon).to respond_to(:lose_health_points).with(1).argument
    expect { kudomon.lose_health_points(10) }.to change { kudomon.health_points }.by(-10)
  end
  it 'can\'t lose more health points than it has' do
    expect { kudomon.lose_health_points(110) }.to raise_error 'This kudomon is already dead'
  end

  it 'can be caught by a trainer' do
    expect(kudomon).to respond_to(:trainer=).with(1).argument
    luke = double :trainer
    kudomon.trainer = luke
    expect(kudomon.trainer).to eq luke
  end

  it 'can be released by a trainer' do
    expect(kudomon).to respond_to(:trainer=).with(1).argument
    luke = double :trainer
    kudomon.trainer = luke
    expect(kudomon.trainer).to eq luke
    kudomon.trainer = nil
    expect(kudomon.trainer).to be_nil
  end

  it 'can be positioned' do
    expect(kudomon).to respond_to(:position=).with(1).argument
    kudomon.position = [1, 2]
    expect(kudomon.position).to eq [1, 2]
  end

  it "can attack another kudomon" do
    expect(kudomon).to respond_to(:attack).with(1).argument
    another_kudomon = double :kudomon
    expect(another_kudomon).to receive(:lose_health_points)
    kudomon.attack(another_kudomon)
  end

  it "has level, initialy 1" do
    expect(kudomon.level).to eq 1
  end

  it "can level up" do
    expect(kudomon).to respond_to(:level_up)
    expect { kudomon.level_up }.to change { kudomon.level }.by(1)
  end

  it "has attack points" do
    expect(kudomon.attack_points).to eq 10
  end

  it "has attack points equal to 10 * level" do
    kudomon.level_up
    expect(kudomon.level).to eq 2
    expect(kudomon.attack_points).to eq 20
  end

  it "has a list of moves, initialy empty" do
    expect(kudomon).to respond_to(:moves).with(0).arguments
    expect(kudomon.moves).to eq []
  end

  it "can learn a move" do
    expect(kudomon).to respond_to(:learn_move).with(1).argument
    move = double :move
    kudomon.learn_move(move)
    expect(kudomon.moves).to include move
  end
end
