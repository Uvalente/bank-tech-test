# frozen_string_literal: true

# Responsible of printing statements from the account
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
    credit = format('%<s>.2f', { s: transaction.credit }) if transaction.credit
    debit = format('%<s>.2f', { s: transaction.debit }) if transaction.debit
    balance = format('%<s>.2f', { s: transaction.balance })

    "#{transaction.date.strftime('%d/%m/%Y')} || #{credit} || " \
      "#{debit} || #{balance}"
  end
end
