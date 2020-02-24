# frozen_string_literal: true

require 'printer'

describe Printer do
  it 'print a header' do
    header = "date || credit || debit || balance\n"
    expect { subject.print }.to output(header).to_stdout
  end
end
