require 'rspec'
require './lib/biker'
require './lib/ride'
require 'pry'

RSpec.describe BikeClub do

    describe '#initialize' do
        it 'exist' do 
            bikeclub = BikeClub.new("Tim's Bike Club")

            expect(bikeclub).to be_a(BikeClub)
        end

        it 'holds a name attribute' do
            expect(bikeclub.name).to eq("Tim's Bike Club")
            
        end

        it 'holds a list of bikes that starts empty' do
            expect(bikeclub.bikers).to eq([])

        end
    end

    describe '#add_biker' do
        it 'adds a biker to the list of bikers' do
            
            expect(bikeclub.bikers).to eq([])
            
            @biker = Biker.new("Kenny", 30)
            expect(bikeclub.bikers).to eq([@biker])
            
            @biker2 = Biker.new("Athena", 15)
            expect(bikeclub.bikers).to eq([@biker, @biker2])

        end
    end

    describe '#most_rides(biker)' do
        it 'returns which biker has the most rides' do

        end
    end

    describe '#best_time' do
        it 'returns the biker with the best time for a given ride' do

        end
    end

    describe '#eligible?(ride)' do
        it 'returns a list of bikers eligible for a given ride' do
            
        end
    end
end