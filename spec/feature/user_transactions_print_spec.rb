# frozen_string_literal: true

require './lib/account'
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
    deposit_one = %r{25/02/2020 *\|\| 1000.00 *\|\| *\|\| 1000.00}
    deposit_two = %r{25/02/2020 *\|\| 2000.00 *\|\| *\|\| 3000.00}
    withdraw = %r{25/02/2020 *\|\| *\|\| 500.00 *\|\| 2500.00}
    header = /date *\|\| credit *\|\| debit *\|\| balance/
    expect { user.print }.to output(withdraw).to_stdout
    expect { user.print }.to output(deposit_one).to_stdout
    expect { user.print }.to output(deposit_two).to_stdout
    expect { user.print }.to output(header).to_stdout
  end
end
