# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy<elonzyy@pm.me>                              #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

module CourseHelpers
  module EntityInspector
    unless defined?(CMD)
      CMD = ::UI::Command.new('Entity Inspector') { self.activate }

      CourseHelpers::Menu::MENU_ROOT.add_item(CMD)
    end

    def self.activate
      @@dialog = CourseHelpers::EntityInspector::Dialog.new
      @@dialog.show
    end

    class Dialog < ElmDialog
      attr_reader :sel_observer
      def initialize(*args)
        super

        @sel_observer = Sketchup::SelectionObserver.new
        @sel_observer.define_singleton_method(:onSelectionBulkChange, self.method(:on_sel_change).to_proc)
      end

      def attach_observer
        Sketchup.active_model.selection.add_observer(sel_observer)
        self.set_on_closed { Sketchup.active_model.selection.remove_observer(sel_observer) }
      end

      def show(*args); super; attach_observer; end
      def show_modal(*args); super; attach_observer; end

      def on_sel_change(selection)
        n = selection.count
        data = n == 1 ? EntityInfo.serialize(selection.first) : { 'class' => "Array (#{n} elements)" }
      end
    end

    module EntityInfo
      def self.serialize(entity)
        {
          'Class' => entity.class,
        }
      end
    end
  end
end
