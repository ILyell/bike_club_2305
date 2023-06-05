class BikeClub

    attr_reader :name,
                :bikers

    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        bikers << biker
    end

    def most_rides
        @bikers.max_by {|biker| biker.rides.keys.length}
    end

    def best_time(ride)
        bikers_with_ride = []
        bikers_with_ride << bikers.find do |biker|
            biker.rides.has_key?(ride)
        end
        bikers_with_ride.min {|biker| biker.personal_record(ride)}
    end
end