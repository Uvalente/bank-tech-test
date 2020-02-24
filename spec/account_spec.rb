# frozen_string_literal: true

require 'account'

describe Account do
  describe '#deposit' do
    it 'a user can deposit currency' do
      expect(subject.deposit(2000)).to eq 2000
    end
  end

  describe '#withdraw' do
    it 'a user can withdraw currency' do
      expect(subject.withdraw(500)).to eq(-500)
    end
  end

  describe '#balance' do
    it 'a user can check his current balance' do
      expect(subject.balance).to eq 0
      expect(subject.deposit(5)).to eq subject.balance
    end
  end
end
