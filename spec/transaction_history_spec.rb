# frozen_string_literal: true

require 'transaction_history'

describe TransactionHistory do
  let(:transaction) { double(:transaction) }
  subject { TransactionHistory.new(transaction) }

  it 'store credit transaction in an array' do
    expect(subject.history).to be_a(Array)
    allow(transaction).to receive(:new) { {balance: 0, credit: 200} }
    expect(subject.deposit(0, 200)).to eq [{ balance: 0, credit: 200 }]
    subject.deposit(0, 200)
    expect(subject.history.size).to eq 2
  end

  it 'store debit transaction in an array' do
    expect(subject.history).to be_a(Array)
    allow(transaction).to receive(:new) { {balance: 0, debit: 200} }
    expect(subject.withdraw(0, 200)).to eq [{ balance: 0, debit: 200 }]
    subject.withdraw(0, 200)
    expect(subject.history.size).to eq 2
  end
end
