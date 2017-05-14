## Copyright (C) 2006-2015 John W. Eaton
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

%!function y = f (x)
%!  global g;
%!  save_g = g;
%!  unwind_protect
%!    g = 0;
%!    y = g;
%!    [1,2;x];
%!    g = 1;
%!    y = [y, g];
%!  unwind_protect_cleanup
%!    g = save_g;
%!    y = [y, g];
%!  end  # "end" is part of test, check not using "end_unwind_protect"
%!endfunction
%!
%!test
%! global g = -1;
%! y = f ([3,4]);
%! assert (y, [0,1,-1]);

%!function y = f (x)
%!  global g;
%!  save_g = g;
%!  unwind_protect
%!    g = 0;
%!    y = g;
%!    [1,2;x];
%!    g = 1;
%!    y = [y, g];
%!  unwind_protect_cleanup
%!    g = save_g;
%!    y = [y, g];
%!    assert (y, [0,-1]);
%!  end_unwind_protect
%!endfunction
%!
%!test
%! global g = -1;
%! fail ("y = f (3);", "mismatch");

