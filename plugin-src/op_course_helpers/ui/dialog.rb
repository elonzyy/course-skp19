# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy                                             #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

module CourseHelpers
  class ElmDialog < ::UI::HtmlDialog
    def initialize(*a)
      super

      set_file(CourseHelpers.paths('ui', 'index.html'))
    end
  end
end
