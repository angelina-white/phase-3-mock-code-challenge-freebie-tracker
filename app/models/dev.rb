class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def self.freebies
        freebies
    end

    def self.companies
        companies
    end

    def recieved_one(item_name)
        freebies.map do |freebie|
            if freebie.item_name == item_name
                return true
            else
                return false
            end
        end
    end

    def give_away(dev, freebie)
        if recieved_one(freebie.item_name) == true
            freebie.dev_id = dev.id
        else
            "This dev does not own that freebie"
        end
    end
end
