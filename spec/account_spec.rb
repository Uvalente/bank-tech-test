# frozen_string_literal: true

require 'account'

describe Account do
  describe '#deposit' do
    it 'a user can deposit currency' do
      expect(subject.deposit(2000)).to eq 2000
    end
  end
end
