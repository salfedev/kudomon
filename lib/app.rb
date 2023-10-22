class App < Sinatra::Base
    def coin_flip
        ["Heads", "Tails"].sample
    end

    def start_game
        @trainer = Trainer.new("Ash")
        @kudomon = Kudomon.new("Kekatchu", "electric")
        @trainer.position = [rand(1..10), rand(1..10)]
        @kudomon.position = [rand(1..10), rand(1..10)]
        @trainer.catch(@kudomon)
    end
end