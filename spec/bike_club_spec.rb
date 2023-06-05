require 'rspec'
require './lib/biker'
require './lib/ride'
require './lib/bike_club'
require 'pry'

RSpec.describe BikeClub do
    before(:each) do
        @bikeclub = BikeClub.new("Tim's Bike Club")
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @biker3 = Biker.new("Tim", 40)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe '#initialize' do
        it 'exist' do 

            expect(@bikeclub).to be_a(BikeClub)
        end

        it 'holds a name attribute' do
            expect(@bikeclub.name).to eq("Tim's Bike Club")
            
        end

        it 'holds a list of bikes that starts empty' do
            expect(@bikeclub.bikers).to eq([])

        end
    end

    describe '#add_biker' do
        it 'adds a biker to the list of bikers' do
            
            expect(@bikeclub.bikers).to eq([])
            @bikeclub.add_biker(@biker)
            expect(@bikeclub.bikers).to eq([@biker])
            @bikeclub.add_biker(@biker2)
            expect(@bikeclub.bikers).to eq([@biker, @biker2])

        end
    end

    describe '#most_rides' do
        it 'returns which biker has the most rides' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)

            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 91.1)

            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 61.6)
            
            expect(@biker.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})        

            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            expect(@biker2.rides).to eq({})
            @biker2.log_ride(@ride2, 65.0)
            expect(@biker2.rides).to eq({@ride2 => [65.0]})
            @bikeclub.add_biker(@biker)
            @bikeclub.add_biker(@biker2)
            @bikeclub.add_biker(@biker3)

            expect(@bikeclub.most_rides).to eq(@biker)
        end
    end

    describe '#best_time' do
        it 'returns the biker with the best time for a given ride' do
            @bikeclub.add_biker(@biker)
            @bikeclub.add_biker(@biker2)
            @bikeclub.add_biker(@biker3)
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)

            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 91.1)

            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 61.6)
            
            expect(@biker.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})        

            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)

            expect(@biker2.rides).to eq({})
            @biker2.log_ride(@ride2, 65.0)
            @biker2.log_ride(@ride2, 63.0)
            expect(@biker2.rides).to eq({@ride2 => [65.0, 63.0]})
            @biker3.log_ride(@ride2, 60.0)
            @biker3.log_ride(@ride2, 55.0)
            @biker3.log_ride(@ride1, 94.0)

            @bikeclub.add_biker(@biker)
            @bikeclub.add_biker(@biker2)
            @bikeclub.add_biker(@biker3)
            expect(@bikeclub.best_time(@ride1)).to eq(@biker)
            expect(@bikeclub.best_time(@ride2)).to eq(@biker3)

        end
    end

    describe '#eligible?(ride)' do
        it 'returns a list of bikers eligible for a given ride' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            @biker2.learn_terrain!(:gravel)
        end
    end
end