# encoding: UTF-8

# util.rb
# Goonbee Toolbox
#
# Created by Luka Mirosevic on 20/08/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'uri'

module Goonbee
    module Toolbox
        class Util
            class << self
                def now
                    Time.now.utc.iso8601
                end

                def get_json_object_from_uri(uri)
                    path = URI.escape(uri)
                    raw_result = URI.parse(path).read || fail
                    JSON.parse(raw_result)
                end

                def generate_token(size = 178)
                    charset = %w{0 1 2 3 4 6 7 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z}
                    (0...size).map{ charset.to_a[rand(charset.size)] }.join
                end
            end
        end
    end
end
