class Portfolio < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged

	validates :title, :body, :main_image, :thumb_image, presence: true

	#custom scope ruby version
	def self.vue
		where(subtitle: "Vue.js")
	end

	#custom scope, a better practice
	scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
	
end
