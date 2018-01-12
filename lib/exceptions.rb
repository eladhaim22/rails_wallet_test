module Exceptions
  class CreditCardUpdateError < StandardError
    def message
      "A more specific error"
    end
  end
end