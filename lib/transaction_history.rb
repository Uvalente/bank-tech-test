# frozen_string_literal: true

require_relative 'transaction'

# Create and store instance of Transaction
class TransactionHistory
  attr_reader :history
  def initialize(transaction = Transaction)
    @history = []
    @transaction = transaction
  end

  def deposit(balance, value)
    @history << @transaction.new(balance: balance, credit: value)
  end

  def withdraw(balance, value)
    @history << @transaction.new(balance: balance, debit: value)
  end
end
