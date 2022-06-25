# Copyright (C) 2019 Greenbone Networks GmbH
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.113534");
  script_version("2019-09-19T12:45:44+0000");
  script_tag(name:"last_modification", value:"2019-09-19 12:45:44 +0000 (Thu, 19 Sep 2019)");
  script_tag(name:"creation_date", value:"2019-09-19 11:50:16 +0000 (Thu, 19 Sep 2019)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_cve_id("CVE-2019-16333");

  script_name("GetSimple CMS <= 3.3.15 Stored XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_getsimple_cms_detect.nasl");
  script_mandatory_keys("GetSimple_cms/installed");

  script_tag(name:"summary", value:"GetSimple CMS is prone to a stored cross-site scripting (XSS) vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The vulnerability is exploitable via admin/theme-edit.php.");
  script_tag(name:"impact", value:"Successful exploitation would allow an authenticated attacker to
  inject arbitrary HTML and JavaScript into the site.");
  script_tag(name:"affected", value:"GetSimple CMS through version 3.3.15.");
  script_tag(name:"solution", value:"No known solution is available as of 19th September, 2019.
  Information regarding this issue will be updated once solution details are available.");

  script_xref(name:"URL", value:"https://github.com/GetSimpleCMS/GetSimpleCMS/issues/1313");

  exit(0);
}

CPE = "cpe:/a:get-simple:getsimple_cms";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) ) exit( 0 );
version = infos["version"];
location = infos["location"];

if( version_is_less_equal( version: version, test_version: "3.3.15" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "None Available", install_path: location );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );
