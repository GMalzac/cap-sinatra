require 'yaml'
require 'sequel'

yaml = YAML.load_file './config/secrets.yml'
db_url = yaml['production']['db_url']

DB = Sequel.connect db_url
