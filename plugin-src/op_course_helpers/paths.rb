# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy                                             #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

module CourseHelpers
  def self.paths(*args)
    File.expand_path(File.join('.', *args), File.dirname(__FILE__))
  end
end
