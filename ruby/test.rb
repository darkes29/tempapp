require 'rubyserial'
require 'rubygems'
require "active_record"
serialport = Serial.new '/dev/cu.usbmodem1411' # Defaults to 9600 baud, 8 data bits, and no parity

ActiveRecord::Base.establish_connection( 
        :adapter => "mysql2", 
        :host => "localhost", 
        :username => "root",
        :password => "Xakker676",
        :database => "test")

class Account < ActiveRecord::Base
end

a = 0
sleep(3)
while true do
 while  serialport.getbyte != nil do
	b = serialport.read(100)
	b = b.split(",")
	a = Time.now
    a = a.strftime( "%H:%M:%S %m/%d/%Y")
acc2 = Account.new(
    :temperature => b[1],
    :time_messure => a)
acc2.save
	sleep(10)	
	end
end
