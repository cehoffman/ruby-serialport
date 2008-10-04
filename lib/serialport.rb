#--
#  ruby-serialport - ruby extension to system serial port
#  Copyright (C) 2008  Chris Hoffman, Danniel E. Shipton
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program; if not, write to the Free Software Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#++

require "serialport.so"

# = SerialPort Class
# The SerialPort class is a loose wrapper around C functions for interfacing
# with RS232 serial ports.
class SerialPort
   private_class_method(:create)

   # Create a new instance of SerialPort referencing a particular system
   # RS232 port.  On *nix systems this is usually found under <code>/dev</code>
   # as a <code>tty</code> device.  In windows this is a COM* port such as 
   # <code>COM1</code>.
   def SerialPort::new(port, *params)
      sp = create(port)
      begin
         sp.set_modem_params(*params)
      rescue
         sp.close
         raise
      end
      return sp
   end

   # Like new, this opens a port on the system.  Open has been designed for
   # block usage/short temporary access to a serial port.
   def SerialPort::open(port, *params) # :yields: serialport
      sp = create(port)
      begin
         sp.set_modem_params(*params)
         if (block_given?)
            yield sp
            sp.close
            return nil
         end
      rescue
         sp.close
         raise
      end
      return sp
   end
end
