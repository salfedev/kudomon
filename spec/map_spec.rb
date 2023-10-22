require 'spec_helper'
require 'trainer'
require 'kudomon'
require 'map'
require 'pry-byebug'

describe Map do    
    it 'can be initialised with number of rows and columns' do
        map = Map.new(10, 10)
        expect(map.rows).to eq 10
        expect(map.columns).to eq 10
        expect(map.show).to eq Array.new(10) { Array.new(10) }
    end

    it 'can add a trainer' do
        luke = Trainer.new('Luke')
        map = Map.new
        row = 1
        column = 2
        # binding.pry
        map.add(row, column, luke)
        expect(map.show[1]).to include luke
        expect(luke.position).to eq [1, 2]
    end

    it 'can add a kudomon' do
        kekatchu = Kudomon.new('kekatchu', 'electric')
        map = Map.new
        row = 1
        column = 2
        map.add(row, column, kekatchu)
        expect(map.show[1]).to include kekatchu
        expect(kekatchu.position).to eq [1, 2]
    end
end