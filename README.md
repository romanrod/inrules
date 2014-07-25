# Inrules

A way to get data from json files

## Installation

Add this line to your application's Gemfile:

    gem 'inrules'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inrules

## Usage

You must define a folder in the root folder of your project as follow
		
		in-files/

Inside of it you can define the files (without extension, just the name) with a json content. E.g.
		
		in-files/common
		in-files/environment-paths
		in-files/runtime-info
		in-files/another-input-data-file

		#environment-paths
		{
			"ENVIRONMENT":{
				"IC":{
					"base_url":"http://ic.base_url.it"
				},
				"RC":{
					"base_url":"http://rc.base_url.it"
				},
				"BETA":{
					"base_url":"http://beta.base_url.it"
				},
				"PROD":{
					"base_url":"http://app.base_url.com"
				}
			}
		}


And a JSON file called in.rules specifying the files in in-files dir you want to load and get

		#in.rules
		{
			"common" : ["common"],
			"rule_1" : ["environment-paths","runtime-info","another-input-data-file"],
			"rule_2" : []
		}
		
		params = Inrules.get_params("rule_1")
		#=> a Hash with all data from specified files. "common" object & "rule_1" merged

		#Note: passing no rule to get_params method, only "common" specifications will be returned

## Contributing

1. Fork it ( http://github.com/romgrod/inrules/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
