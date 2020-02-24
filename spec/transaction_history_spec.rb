# frozen_string_literal: true

require 'transaction_history'

describe TransactionHistory do
  let(:transaction) { double(:transaction) }

  it 'store previous transaction in an array' do
    expect(subject.history).to be_a(Array)
    expect(subject.add(transaction)).to eq [transaction]
    subject.add(transaction)
    expect(subject.history.size).to eq 2
  end
end
