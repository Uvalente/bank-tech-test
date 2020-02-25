# frozen_string_literal: true

require 'printer'

describe Printer do
  let(:deposit) do
    double(:deposit,
           date: Date.new(2020, 0o2, 24),
           credit: 1000,
           debit: nil,
           balance: 1000)
  end
  let(:withdraw) do
    double(:withdraw,
           date: Date.new(2020, 0o2, 24),
           credit: nil,
           debit: 500,
           balance: 2500)
  end

  it 'print a whole statement' do
    header = "date || credit || debit || balance\n"
    deposit_string = '24/02/2020 || 1000 ||  || 1000'
    withdraw_string = "24/02/2020 ||  || 500 || 2500\n"
    result = [header, withdraw_string, deposit_string].join('')
    history = [deposit, withdraw]
    expect(subject.display_statement(history)).to eq(result)
  end
end
