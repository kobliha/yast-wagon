# encoding: utf-8

#
# Copyright (c) 2011 Novell, Inc.
#
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.   See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail,
# you may find current contact information at www.novell.com
#
# File:
#	include/wagon/wagon_helpers.ycp
#
# Module:
#	Wagon
#
# Authors:
#	Ladislav Slezak <lslezak@suse.cz>
#
# Summary:
#	Online Migration Tool
#
# $Id$
#
module Yast
  module WagonWagonHelpersInclude
    # Find a mount point for given directory/file path. Returns "/" if no mount point matches
    # @param dir requested path
    # @param dirs list of mount points
    # @return string a mount point from the input list or "/" if not found
    def FindMountPoint(dir, dirs)
      dirs = deep_copy(dirs)
      while dir != nil && dir != "" && !Builtins.contains(dirs, dir)
        # strip the last path component and try it again
        comps = Builtins.splitstring(dir, "/")
        comps = Builtins.remove(comps, Ops.subtract(Builtins.size(comps), 1))
        dir = Builtins.mergestring(comps, "/")
      end

      dir = "/" if dir == nil || dir == ""

      dir
    end
  end
end
