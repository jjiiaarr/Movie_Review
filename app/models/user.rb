class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :region, class_name: 'Address::Region', foreign_key: 'address_region_id'
  belongs_to :province, class_name: 'Address::Province', foreign_key: 'address_province_id'
  belongs_to :city, class_name: 'Address::City', foreign_key: 'address_city_id'
  belongs_to :barangay, class_name: 'Address::Barangay', foreign_key: 'address_barangay_id'
end
