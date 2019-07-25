# -*- coding: UTF-8 -*-

##########################################################################
# Copyright (c) 2019 elonzyy                                             #
# Licensed under the MIT License.                                        #
# See LICENSE file in the project root for full license information.     #
##########################################################################

module CourseHelpers
  def self.random_color
    Sketchup::Color.new(rand(0..255), rand(0..255), rand(0..255))
  end

  def self.visualize_pt(pt, radius=100.mm)
    group = Sketchup.active_model.entities.add_group

    n_lat, n_long = 10, 10
    drho, dphi = Math::PI / n_lat, 2*Math::PI / n_long

    circles = 0.upto(n_lat).map do |j|
      0.upto(n_long).map { |i|
        [
          Math.sin(j * drho) * Math.cos(i * dphi) * radius,
          Math.sin(j * drho) * Math.sin(i * dphi) * radius,
          Math.cos(j * drho) * radius,
        ]
      }
    end

    [*circles.transpose, *circles].each { |pts| group.entities.add_line(*pts) }

    group.entities.grep(Sketchup::Edge).each(&:find_faces)
    group.entities.grep(Sketchup::Edge).each {|e| e.soft=true}
    group.material = random_color
    group.transformation = Geom::Transformation.translation(pt)
  end

  def self.visualize_vec(vec, position=ORIGIN, r_cylindar=100.mm)
    group = Sketchup.active_model.entities.add_group

    n_cylindar = 10
    h_cylindar = Math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
    r_cap_ratio = 1.25
    dtheta = 2*Math::PI / n_cylindar
    cylindar_base = 0.upto(n_cylindar).map do |i|
      [
        Math.cos(i * dtheta) * r_cylindar,
        Math.sin(i * dtheta) * r_cylindar,
        0
      ]
    end

    cap_base = cylindar_base.map {|pt| Geom::Point3d.new([pt.x*r_cap_ratio, pt.y*r_cap_ratio, pt.z])}

    cylindar_group = group.entities.add_group
    base = cylindar_group.entities.add_face(*cylindar_base)
    base.reverse! unless base.normal.samedirection?(Z_AXIS)
    base.pushpull(h_cylindar)
    cylindar_group.entities.grep(Sketchup::Edge).each {|e| e.soft=true}
    cylindar_group.material = random_color

    cap_group = group.entities.add_group
    cap = cap_group.entities.add_face(*cap_base)
    top_pt = ORIGIN.offset(Z_AXIS, 2 * r_cylindar)
    cap_base.each {|pt| cap_group.entities.add_line(pt, top_pt)}
    cap_group.entities.grep(Sketchup::Edge).each(&:find_faces)
    cap_group.transform!(Geom::Transformation.translation([0, 0, h_cylindar]))
    cap_group.entities.grep(Sketchup::Edge).each {|e| e.soft=true}

    group.material = random_color

    group.transformation = Geom::Transformation.new(position, vec)
  end
end
