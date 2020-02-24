# frozen_string_literal: true

class Printer
  def display_statement(history)
    transactions = history.reverse.map do |transaction|
      print(transaction)
    end
    header + "\n" + transactions.join("\n")
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def print(transaction)
    "#{transaction.date.strftime('%d/%m/%Y')} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
  end
end
