class CreditCard < ActiveRecord::Base
	belongs_to :wallet
	validates :number, :length => { :is => 16 }, :numericality => { :only_integer => true }
	validates :CCV, :length => { :is => 3 }, :numericality => { :only_integer => true }
	validate :expiration_date_valid
	before_update :before_update_callback
	attr_accessor :hidden_card_number

	after_initialize :set_hidden_card_number

	def set_hidden_card_number
		if(!self.number.nil?)
			self.hidden_card_number = '************' + self.number.last(4)
		end
	end

	def before_update_callback
		raise Exceptions::CreditCardUpdateError
	end

	def expiration_date_valid
    	begin
    		if expiration_date.present? && Date.strptime(expiration_date,"%m/%Y") < Time.zone.today
      			errors.add(:expiration_date, "can't be in the past")
      		end
    		rescue ArgumentError
    			errors.add(:expiration_date, "not a valid MM/YYYY date format")
    	end
  	end
end
