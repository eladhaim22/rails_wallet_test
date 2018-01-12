class Wallet < ActiveRecord::Base
	has_many :credit_cards, inverse_of: :wallet, :dependent => :destroy
	accepts_nested_attributes_for :credit_cards, allow_destroy: true
end
