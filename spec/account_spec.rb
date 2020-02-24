# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction) { double(:transaction) }
  let(:deposit) { double(:transaction, date: '24/02/2020', credit: 1000, debit: nil, balance: 1000) }
  let(:withdraw) { double(:transaction, date: Date.new(2020, 0o2, 24), credit: nil, debit: 500, balance: 2500) }
  let(:transaction_history) { double(:transaction_history) }
  let(:printer) { double(:printer) }

  describe '#deposit' do
    it 'a user can deposit currency' do
      expect(subject.deposit(2000)).to eq 2000
    end

    it 'save the transaction in the history' do
      subject = Account.new(0, transaction_history)
      expect(subject.statement).to receive(:deposit).with(0, 300)
      subject.deposit(300)
    end
  end

  describe '#withdraw' do
    it 'a user can withdraw currency' do
      expect(subject.withdraw(500)).to eq(-500)
    end

    it 'save the transaction in the history' do
      subject = Account.new(0, transaction_history)
      expect(subject.statement).to receive(:withdraw).with(0, 300)
      subject.withdraw(300)
    end
  end

  describe '#balance' do
    it 'a user can check his current balance' do
      expect(subject.balance).to eq 0
      expect(subject.deposit(5)).to eq subject.balance
    end
  end

  describe '#print' do
    it 'print only the header if there are no transaction' do
      subject = Account.new(0, transaction_history, printer)
      allow(printer).to receive(:header) { 'date || credit || debit || balance' }
      allow(transaction_history).to receive(:history) { [] }
      expect { subject.print }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'print the transactions' do
      subject = Account.new(0, transaction_history, printer)
      allow(transaction_history).to receive(:history) { [deposit, deposit] }
      allow(printer).to receive(:header) { 'date || credit || debit || balance' }
      allow(printer).to receive(:print) { "#{deposit.date} || #{deposit.credit} || #{deposit.debit} || #{deposit.balance}" }
      expect { subject.print }.to output(/date || credit || debit || balance\n/).to_stdout
      expect { subject.print }.to output(%r{ 24/02/2020 || 1000 ||  || 1000\n}).to_stdout
    end
  end
end
