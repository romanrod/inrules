require "inrules/version"

module Inrules
  

  # Returns the hash of all specified rule's files on in.rules file
  # @param [String] rule, the rule you want to get
  # @return [Hash] all specified params. Merge between "all" and rule (if given)
  def self.get_params(rule=nil)
    
    # get in.rules file content 
    rules = self.in_rules
    
    raise "'common' object must be defined in in.rules file" unless rules.has_key? "common"

    # If rule was specified check if exist. If not raise error
    unless rule.nil?
    	raise "rule #{rule} does not exist on in.rules file" unless rules.has_key? rule
    end

    @params = {}

    rules["common"].each{|file_name| @params.merge! self.in_file(file_name)}
    rules[rule].each{|file_name| @params.merge! self.in_file(file_name)} unless rule.nil?
    
    @params
  end

  # Returns in.rules file content
  # @return [Array] file_content
  def self.in_rules
  	raise "You must define 'in.rules' file in root folder" unless File.exist?('in.rules')
  	file_content = JSON.parse(File.read('in.rules'))
  	raise "in.rules file content must be a Hash" unless file_content.is_a? Hash
  	file_content
  end	

  # Returns content of given file_name
  # @param [String] file_name
  # @return [Hash]
  def self.in_file file_name
  	raise "There is no file with the name '#{file_name}' in in-files/ folder" unless File.exist?("in-files/#{file_name}")
  	begin
  		file_content = JSON.parse(File.read("in-files/#{file_name}"))
  	rescue => e
  		raise "Check the content/structure of #{file_name} file. Something gone wrong :/"
  	end
  	file_content
  end
end
