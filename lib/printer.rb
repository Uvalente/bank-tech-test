# frozen_string_literal: true

# Responsible of printing statements from the account
class Printer
  def initialize
    @header = 'date || credit || debit || balance'
  end

  def display_statement(history)
    transactions = history.reverse.map do |transaction|
      print(transaction)
    end
    @header + "\n" + transactions.join("\n")
  end

  private

  def print(transaction)
    credit = float_formatter(transaction.credit)
    debit = float_formatter(transaction.debit)
    balance = float_formatter(transaction.balance)

    "#{transaction.date.strftime('%d/%m/%Y')} || #{credit} || " \
      "#{debit} || #{balance}"
  end

  def float_formatter(value)
    value ? format('%<s>.2f', { s: value }) : ''
  end
end
