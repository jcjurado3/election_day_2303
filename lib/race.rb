class Race
  attr_reader :office,
              :candidates

    def initialize(office)
      @office = office
      @candidates = []
      @open = true
    end

    def register_candidate!(attributes)
      candidate = Candidate.new(attributes)
      @candidates << candidate
      candidate
    end

    def open?
      @open
    end

    def close!
      @open = false
    end
end