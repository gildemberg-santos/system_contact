class Address < ApplicationRecord
  belongs_to :contact

  def self.to_addresses
    all.map do |address|
      "#{address.street}, #{address.city}, #{address.state}, #{address.zip_code}, #{address.country}, #{address.neighborhood}".strip
    end.join(' | ')
  end
end
