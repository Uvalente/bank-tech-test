# frozen_string_literal: true

require 'transaction'

describe Transaction do
  subject { Transaction.new(0) }

  describe '#credit' do
    it 'save the deposit operation' do
      date = Date.today
      subject.credit(100)
      expect(subject.transaction).to eq({ date: date, credit: 100, balance: 100 })
    end

    it 'save the deposit operation keeping count of the previous balance' do
      transaction = Transaction.new(200)
      date = Date.today
      transaction.credit(100)
      expect(transaction.transaction).to eq({ date: date, credit: 100, balance: 300 })
    end
  end
end
