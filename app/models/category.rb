class Category < ApplicationRecord
	include Sortable::InstanceMethods
	validates_presence_of :name, :slug
	validates_uniqueness_of :name, :slug
	has_many :properties
end
