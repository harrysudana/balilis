class Property < ApplicationRecord
	include Sortable::InstanceMethods
	extend Sortable::ClassMethods

	validates_presence_of :title, :description, :location

	belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'

	def self.locations
		self.all.collect {|property| property.location}.uniq
	end

	def self.all_sort_by_date_skip_first
		self.all_sort_by_date.limit(9)[1..-1]
	end
end
