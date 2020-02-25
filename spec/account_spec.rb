# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_history) { double(:transaction_history) }
  let(:transaction_history) { double(:transaction_history) }
  let(:printer) { double(:printer) }

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

  describe '#print' do
    it 'call statement on Printer' do
      subject = Account.new(0, transaction_history, printer)
      header = 'date || credit || debit || balance'
      allow(printer).to receive(:display_statement) { header }
      allow(transaction_history).to receive(:history)
      expect { subject.print }.to output(header + "\n").to_stdout
    end
  end
end
