require 'rspec'
require './lib/biker'

RSpec.describe Biker do
    before(:each) do
        @biker = Biker.new("Kenny", 30)
    end

    describe '#initialize' do
        it 'exist' do

            expect(@biker).to be_a(Biker) 
        end

        it 'holds a name attribute' do
            
            expect(@biker.name).to eq("Kenny")
        end

        it 'holds an age' do

            expect(@biker.age).to eq(30)
        end
    end

end