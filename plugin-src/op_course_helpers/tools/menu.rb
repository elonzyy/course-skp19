# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy<elonzyy@pm.me>                              #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

module CourseHelpers
  module Menu
    unless defined?(MENU_ROOT)
      MENU_ROOT = ::UI.menu('extensions').add_submenu('Course Helpers')
    end
  end
end
