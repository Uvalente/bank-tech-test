# frozen_string_literal: true

require_relative 'transaction'
class TransactionHistory
  attr_reader :history
  def initialize(transaction = Transaction.new)
    @history = []
    @transaction = transaction
  end

  def deposit(balance, value)
    @history << @transaction.deposit(balance, value)
  end

  def withdraw(balance, value)
    @history << @transaction.withdraw(balance, value)
  end
end
