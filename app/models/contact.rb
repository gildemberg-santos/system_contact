class Contact < ApplicationRecord
  has_many :addresses, dependent: :destroy
end
