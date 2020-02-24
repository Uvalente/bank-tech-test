# frozen_string_literal: true

require 'printer'

describe Printer do
  let(:deposit) { double(:transaction, date: Date.new(2020, 0o2, 24), credit: 1000, debit: nil, balance: 1000) }
  let(:withdraw) { double(:transaction, date: Date.new(2020, 0o2, 24), credit: nil, debit: 500, balance: 2500) }

  it 'print a header' do
    header = "date || credit || debit || balance\n"
    expect(subject.header).to match(/#{header}/)
  end

  it 'print a deposit transaction' do
    expect(subject.print(deposit)).to eq '24/02/2020 || 1000 ||  || 1000'
  end

  it 'print a withdraw transaction' do
    expect(subject.print(withdraw)).to eq '24/02/2020 ||  || 500 || 2500'
  end
end
