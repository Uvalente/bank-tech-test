# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#credit' do
    it 'save the deposit operation' do
      date = Date.today
      subject.credit(100)
      expect(subject.transaction).to eq({ date: date, credit: 100, balance: 100 })
    end
  end
end
