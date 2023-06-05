class Ride

    attr_reader :name,
                :distance,
                :is_loop,
                :terrain


    def initialize(ride_hash)
        @name = ride_hash[:name]
        @distance = ride_hash[:distance]
        @is_loop = ride_hash[:loop]
        @terrain = ride_hash[:terrain]
    end

    def loop?
        is_loop
    end

    def total_distance
        if !loop?
            distance * 2
        elsif loop?
            distance
        end
    end
end