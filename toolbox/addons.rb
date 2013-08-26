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

class Hash
    def symbolize_keys
        _symbolize_keys(self)
    end

    def _symbolize_keys(hash)
        hash.inject({}){|result, (key, value)|
            new_key = case key
                      when String then key.to_sym
                      else key
                      end
            new_value = case value
                        when Hash then _symbolize_keys(value)
                        else value
                        end
            result[new_key] = new_value
            result
        }
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