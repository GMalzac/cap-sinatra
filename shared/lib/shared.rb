require 'json'
require 'digest'

module Shared
  class Person
    def initialize(name)
      @name = name
    end
    
    def name
      @name
    end
    
    def digest
      @digest ||= Digest::SHA256.base64digest(self.name)
    end
    
    def to_json
      @json ||= {
        name: self.name,
        digest: self.digest
      }.to_json
    end
  end
end
