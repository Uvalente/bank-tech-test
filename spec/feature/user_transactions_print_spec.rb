# frozen_string_literal: true

require 'timecop'

describe Account do
  it 'user deposit twice, withdraw and print the statement' do
    user = Account.new
    date = Date.new(2020, 0o2, 25)
    Timecop.freeze(date)
    user.deposit(1000)
    user.deposit(2000)
    user.withdraw(500)
    Timecop.return
    deposit_one = %r{25/02/2020 \|\| 1000 \|\|  \|\| 1000}
    deposit_two = %r{25/02/2020 \|\| 2000 \|\|  \|\| 3000}
    withdraw = %r{25/02/2020 \|\|  \|\| 500 \|\| 2500}
    header = /date \|\| credit \|\| debit \|\| balance/
    expect { user.print }.to output(withdraw).to_stdout
    expect { user.print }.to output(deposit_one).to_stdout
    expect { user.print }.to output(deposit_two).to_stdout
    expect { user.print }.to output(header).to_stdout
  end
end
