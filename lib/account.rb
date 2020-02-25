# frozen_string_literal: true

require_relative 'transaction_history'
require_relative 'printer'

INITIAL_BALANCE = 0

# Responsible of updating the account balance
class Account
  def initialize(balance = INITIAL_BALANCE,
                 statement = TransactionHistory.new,
                 printer = Printer.new)
    @balance = balance
    @statement = statement
    @printer = printer
  end

  def deposit(value)
    @statement.deposit(@balance, value)
    @balance += value
  end

  def withdraw(value)
    @statement.withdraw(@balance, value)
    @balance -= value
  end

  def print
    puts @printer.display_statement(@statement.history)
  end
end
