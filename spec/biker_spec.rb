require 'rspec'
require './lib/biker'

RSpec.describe Biker do
    before(:each) do
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe '#initialize' do
        it 'exist' do

            expect(@biker).to be_a(Biker) 
        end

        it 'holds a name attribute' do
            
            expect(@biker.name).to eq("Kenny")
        end

        it 'holds a max distance' do

            expect(@biker.max_distance).to eq(30)
        end

        it 'holds a rides hash' do
            expect(@biker.rides).to eq({})
        end

        it 'holds an acceptable_terrain array' do
            expect(@biker.acceptable_terrain).to eq([])
        end
    end

    describe '#learn_terrain!(:terrain)' do
        it 'takes an symbol argument and adds it the the back of acceptable_terrain array' do
            
            expect(@biker.acceptable_terrain).to eq([])
            biker.learn_terrain!(:gravel)
            expect(@biker.acceptable_terrain).to eq([:gravel])
            biker.learn_terrain!(:hills)
            expect(@biker.acceptable_terrain).to eq([:gravel, :hills])

        end
    end

    describe '#log_ride(ride, time)' do
        it 'adds a ride and time as a key:value pair to the rides hash' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            expect(@biker.rides).to eq({})
            @biker.log_ride(@ride1, 92.5)
            expect(@biker.rides).to eq({@ride1 => [92.5]})

            expect(@biker2.rides).to eq({})
            @biker2.log_ride(@ride1, 97.0)
            expect(@biker2.rides).to eq({@ride1 => [97.0]})
        end

        it 'returns a string if terrain not known by biker' do
            
            expect(@biker.rides).to eq({})
            expect(@biker.acceptable_terrain).to eq([])
            expect(@biker.log_ride(@ride1, 92.5)).to eq(false)
            @biker.learn_terrain!(:hills)
            @biker.log_ride(@ride1, 92.5)
            expect(@biker.acceptable_terrain).to eq([:hills])
            expect(@biker.rides).to eq({@ride1 => [92.5]})
            
        end

        it 'checks if the distance is greater then max_distance' do
            expect(@biker.rides).to eq({})
            expect(@biker.acceptable_terrain).to eq([])
            expect(@biker2.rides).to eq({})
            expect(@biker2.acceptable_terrain).to eq([])
            
            expect(@biker.log_ride(@ride1, 92.5)).to eq(false)
            @biker.learn_terrain!(:hills)
            @biker.log_ride(@ride1, 92.5)
            expect(@biker.rides).to eq({@ride1 => [92.5]})

            expect(@biker2.log_ride(@ride1, 97.0)).to eq(false)
            @biker2.learn_terrain!(:hills)
            expect(@biker2.log_ride(@ride1, 97.0)).to eq(false)
            expect(@biker.rides).to eq({})

        end

        it 'adds a new time to the ride key' do
            
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
            expect(@biker2.acceptable_terrain).to eq([])
            
            expect(@biker.rides).to eq({})
            @biker.log_ride(@ride1, 92.5)
            expect(@biker.rides).to eq({@ride1 => [92.5]})
            @biker.log_ride(@ride1, 91.1)
            expect(@biker.rides).to eq({@ride1 => [92.5, 91.1]})
            
            expect(@biker2.rides).to eq({})
            @biker2.log_ride(@ride1, 97.0)
            expect(@biker2.rides).to eq({@ride1 => [97.0]})
            @biker2.log_ride(@ride1, 95.0)
            expect(@biker2.rides).to eq({@ride1 => [97.0, 95.0]})

        end
    end

    describe '#personal_record' do
        
        it 'returns the lowest time for that ride' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)

            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 91.1)
            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 61.6)

            expect(@biker.personal_record(@ride1)).to eq(91.1)
            expect(@biker.personal_record(@ride2)).to eq(60.9)

            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)


        end
    end
end