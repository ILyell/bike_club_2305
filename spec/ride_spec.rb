require 'rspec'
require './lib/ride'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    end

    describe '#initialize' do
        it 'exist' do
            expect(@ride1).to be_a(Ride)
            expect(@ride2).to be_a(Ride)

        end

        it 'holds a name attribute' do
            expect(@ride1.name).to eq("Walnut Creek Trail")
            expect(@ride2.name).to eq("Town Lake")
        end

        it 'holds a distance' do
            expect(@ride1.distance).to eq(10.7)
            expect(@ride2.distance).to eq(14.9)

        end

        it 'holds a terrain' do
            expect(@ride1.terrain).to eq(:hills)
            expect(@ride2.terrain).to eq(:gravel)
        end

        it 'holds a loop boolean' do
            expect(@ride1.loop?).to eq(false)
            expect(@ride2.loop?).to eq(true)
        end
    end

    describe '#loop?' do
        it 'returns a boolean from @loop' do
            expect(@ride1.loop?).to eq(false)
            expect(@ride2.loop?).to eq(true)
        end
    end

    describe '#total_distance' do
        it 'takes the distance and doubles it if @loop = true' do
            
            expect(@ride1.loop?).to eq(false)
            expect(@ride1.total_distance).to eq(21.4)
            expect(@ride2.loop?).to eq(true)
            expect(@ride2.total_distance).to eq(14.9)

        end
    end
end