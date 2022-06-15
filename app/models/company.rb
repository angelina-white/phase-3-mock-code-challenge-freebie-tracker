class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    @@OLDESTCOMPANY=""

    def self.freebies
        freebies
    end

    def self.devs
        devs
    end

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: id, dev_id: dev.id)
    end

    def self.oldest_company
        Company.all.map do |company|
            if company.founding_year == Company.minimum(:founding_year)
                @@OLDESTCOMPANY = company
            end
        end
        @@OLDESTCOMPANY
    end
end
