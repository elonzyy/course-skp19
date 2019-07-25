# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy                                             #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

require 'extensions.rb'

module CourseHelpers
  def self.extension
    EXTENSION
  end

  unless defined?(EXTENSION)
    EXTENSION = SketchupExtension.new('Course Helper', 'op_course_helpers/init.rb')
    EXTENSION.version = '0.0.1'
    EXTENSION.description = 'This extension is a collection of utilities that serve as auxiliries for the course [Fundamentals of 3D Modeling and SketchUp Plugin Development].'
    EXTENSION.copyright = 'Copyright (c) 2019 Elonzyy'
    EXTENSION.creator = 'elonzyy'

    Sketchup.register_extension(EXTENSION, true)
  end
end
