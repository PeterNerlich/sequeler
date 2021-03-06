/*
* Copyright (c) 2011-2018 Alecaddd (http://alecaddd.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Alessandro "Alecaddd" Castellani <castellani.ale@gmail.com>
*/

namespace Sequeler {
    public Sequeler.Services.Settings settings;
}

public class Sequeler.Application : Granite.Application {
    public GLib.List <Window> windows;

    construct {
        flags |= ApplicationFlags.HANDLES_OPEN;
        build_data_dir = Constants.DATADIR;
        build_pkg_data_dir = Constants.PKGDATADIR;
        build_release_name = Constants.RELEASE_NAME;
        build_version = Constants.VERSION;
        build_version_info = Constants.VERSION_INFO;

        settings = new Sequeler.Services.Settings ();
        windows = new GLib.List <Window> ();

        program_name = "Sequeler";
        exec_name = "com.github.alecaddd.sequeler";
        app_launcher = "com.github.alecaddd.sequeler.desktop";
        application_id = "com.github.alecaddd.sequeler";
    }

    public void new_window () {
        new Sequeler.Window (this).present ();
    }

    public override void window_added (Gtk.Window window) {
        windows.append (window as Window);
        base.window_added (window);
    }

    public override void window_removed (Gtk.Window window) {
        windows.remove (window as Window);
        base.window_removed (window);
    }

    protected override void activate () {
        var window = new Sequeler.Window (this);
        this.add_window (window);
    }
}