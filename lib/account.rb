# frozen_string_literal: true

INITIAL_BALANCE = 0

class Account
  attr_reader :balance

  def initialize(balance = INITIAL_BALANCE)
    @balance = balance
  end

  def deposit(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end
end
