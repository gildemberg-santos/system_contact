class Contact < ApplicationRecord
  has_many :addresses, dependent: :destroy

  def self.to_csv
    CSV.generate do |csv|
      csv << %w[firstname lastname email phone cellphone addresses]
      all.each do |contact|
        csv << [contact.firstname, contact.lastname, contact.email, contact.phone, contact.cellphone,
                contact.addresses.to_addresses]
      end
    end
  end
end
