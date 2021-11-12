=begin
Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. 
The new requirement calls for adding logging, when clients of the class attempt to access the secret data. 

She needs to modify it so that any access to data must result in a log entry being generated. 
That is, any call to the class which will result in data being returned must first call a logging class. 

Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. 
It may be helpful to review the lecture on collaborator objects for this practice problem.
=end

class SecretFile

  attr_reader :data, :log

  def initialize(secret_data, log)
    @data = secret_data
    @log = log
  end

  def get_data(index)
    log.create_entry(data[index])
    data[index]
  end
end

class SecurityLogger

  @@log = []

  def self.log
    @@log
  end

  def create_entry(data)
    @entry = "#{data} accessed at #{Time.new}"
    @@log << @entry
  end
end

cia_db = SecretFile.new(['secret1', 'secret2', 'secret3'], SecurityLogger.new)
p cia_db.get_data(1)
p cia_db.get_data(2)
p SecurityLogger.log



