# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#new' do
    it 'save the deposit operation' do
      transaction = Transaction.new(balance: 50, credit: 270) 
      date = Date.today
      expect(transaction.balance).to eq 320
      expect(transaction.date).to eq date
      expect(transaction.debit).to be_nil
      expect(transaction.credit).to be 270
    end

    it 'save the withdraw operation' do
      subject = Transaction.new(debit: 470, balance: 10)
      date = Date.today
      expect(subject.balance).to eq(-460)
      expect(subject.date).to eq date
      expect(subject.debit).to be 470
      expect(subject.credit).to be_nil
    end
  end
end
