# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#credit' do
    it 'save the deposit operation' do
      date = Date.today
      subject.deposit(0, 100)
      expect(subject.transaction).to eq({ date: date, credit: 100, balance: 100 })
    end

    it 'save the deposit operation keeping count of the previous balance' do
      date = Date.today
      subject.deposit(200, 100)
      expect(subject.transaction).to eq({ date: date, credit: 100, balance: 300 })
    end
  end

  describe '#debit' do
    it 'save the withdraw operation' do
      date = Date.today
      subject.withdraw(500, 100)
      expect(subject.transaction).to eq({ date: date, debit: 100, balance: 400 })
    end
  end
end
