# encoding: UTF-8

# addons.rb
# Goonbee Toolbox
#
# Created by Luka Mirosevic on 20/08/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

class Object
    def as
        yield(self)
    end
end

class String
    def starts_with?(prefix)
        prefix = prefix.to_s
        self[0, prefix.length] == prefix
    end
end

module JSON
    def self.is_json?(obj)
        begin
          return false unless obj.is_a?(String)
          JSON.parse(obj).all?
        rescue JSON::ParserError
            false
        end
    end
end