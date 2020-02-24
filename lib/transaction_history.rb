# frozen_string_literal: true

class TransactionHistory
  attr_reader :history
  def initialize
    @history = []
  end

  def add(transaction)
    @history << transaction
  end
end
