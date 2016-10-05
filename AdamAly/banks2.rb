class BankAccount
	attr_accessor :account_number, :checking_balance, :savings_balance
	@account_counter = 0

# for CLASS<<SELF: https://www.quora.com/What-does-class-self-in-Ruby-means `class` opens a class definition block. It takes either a constant name or an expression of the form << object. In the latter case, opens a definition block for the singleton class of object.

	class << self 
		attr_accessor :account_counter
	end

	def initialize
		createAccountNumber 
		@savings_balance = 5500 #setting the  savings balance 
		@checking_balance = 2000
		@interest_rate = 0.04 #setting the intrest rate 
		self.class.account_counter += 1 
	end

	def displayAccountNumber
		puts @account_number
	end
	
	def savingsAccountBalance
		puts "Your Savings is: #{@savings_balance}"
	end
	
	def checkingAccountBalance
		puts "Your Checking is: #{@checking_balance}"
	end

	def deposit(amount, account)#defingin  the amount and account here
		if account == "savings"
				puts "deposit savings"
				@savings_balance += amount
		else
				puts "deposit checking"
				@checking_balance += amount
		end #end if account statment 
	end#end def deposit 

	def withdraw(amount, account)
		if account == "savings"
				if amount < @savings_balance
					@savings_balance -= amount
				else
					puts "Sorry, your Savings balance is insufficient"
				end #end second if 
		else
				if amount < @checking_balance
					@checking_balance -= amount
				else
					puts "Sorry, your Savings  balance is insufficient"
			end #end third if 
		end #end first if 
	end #end def withdraw 

	def displayTotalBalance
		 #insert brackets ,FOIL should work..mabey?
		 #balance paut out use puts 

		puts "Your checking account balance is: #{@checking_balance + (@checking_balance * @interest_rate)}"
		puts "Your savings account balance is: #{@savings_balance + (@savings_balance * @interest_rate)}"
		puts "Total balance is: #{(@checking_balance + @savings_balance) + ((@checking_balance+@savings_balance)) * @interest_rate}"
	end

	def account_information
		#displays account informatoins when adding to the accounts
		puts "Your account number is: #{@account_number}"
		puts "Total balance is: #{(@checking_balance + @savings_balance) + ((@checking_balance+@savings_balance)) * @interest_rate}"
		puts "Your Checking amount is: #{@checking_balance + (@checking_balance * @interest_rate)}"
		puts "Your Savings amount  is: #{@savings_balance + (@savings_balance * @interest_rate)}"
		puts "The interest rate is: #{@interest_rate}"
	end

	def count_accounts
		puts "There are a total of #{self.class.account_counter} accounts"
	end

	private #everything below will make things private which is why its at the bottom 
	attr_accessor :interest_rate

	def createAccountNumber
		@account_number = Integer(rand.to_s[2..9])
	end
	
end#end of everythoing 

user1 = BankAccount.new
user1.displayAccountNumber
user1.account_information

user2 = BankAccount.new
user2.displayAccountNumber
user2.count_accounts