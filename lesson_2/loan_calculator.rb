def prompt(message)
  puts "==> #{message}"
end

def valid_number?(number)
  number.to_i != 0 && number.to_f > 0
end

prompt "Welcome to the loan calculator! \
Let's calculate your monthly payment."

loop do
  loan_amount = ''
  loop do
    prompt "Please input the loan amount:"
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt "Hmm... that doesn't look like a valid number.  Please enter a valid number."
    end
  end

  apr = ''
  prompt "Your loan amount is $#{'%.2f' % loan_amount}"
  loop do
    prompt "What is the APR of the loan (in percent)? For instance, if the loan is 4.6%, enter 4.6."
    apr = gets.chomp
    if apr == 0 || valid_number?(apr)
      apr = (apr.to_f / 100.0)
      break
    else
      prompt "Hmm... that doesn't look like a valid number.  Please enter a valid number."
    end
  end

  prompt "Your APR is #{(apr*100).round(2)}%"

  years_duration = ''
  loop do
    prompt "Please enter the loan duration (for 12 years, just write 12)."
    years_duration = gets.to_f
    if valid_number?(years_duration)
      prompt "You entered #{years_duration} years."
      break
    else 
      prompt "Hmm... that doesn't look like a valid number.  Please enter a valid number."
    end
  end
  
  monthly_interest = apr / 12
  months_duration = years_duration * 12
  monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-months_duration)))
  prompt "Your monthly payment is $#{'%.2f' % monthly_payment}"
  prompt "If you'd like to calculate the monthly payment of another loan, please enter 'y'."
  again = gets.chomp
  unless again == 'y'
    prompt "Thank you for using this calculator!  Good-bye!"
    break
  end
end
