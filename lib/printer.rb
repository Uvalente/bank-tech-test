# frozen_string_literal: true

class Printer
  def header
    'date || credit || debit || balance'
  end

  def print(transaction)
    "#{transaction.date.strftime('%d/%m/%Y')} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
  end
end
