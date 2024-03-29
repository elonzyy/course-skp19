# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy<elonzyy@pm.me>                              #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

module CourseHelpers
  class ElmDialog < ::UI::HtmlDialog
    def initialize(*a)
      super

      set_file(CourseHelpers.paths('ui', 'index.html'))

      self.add_action_callback('call_dialog') { |ctx, data|
        method_name = data['m']
        args = data['d']
        if self.methods.include?(method_name.to_sym)
          self.send(method_name, args)
        else
          raise "Undefined method #{method_name} in #{self}"
        end
      }
    end
  end
end
