Code signing - Nico Bendlin <nico@nicode.net>
=============================================

In the past I just published the compiled Windows binaries for several projects
to allow the users to directly download and run the applications. Some projects
(especially my run-time patches for old games) require a particular development
environment, and don't include the compiler's default libraries. Over the years
this triggered the heuristics of several Anti-Virus products (again and again).
Due to the false-positive reports some "Web of Trust" services gave my domain a
really bad rating. And in the end some users (behind a transparent proxy and/or
firewall) were not able to access the files or the domain at all. Finally I got
bugged by sending whitelist requests to all the vendors after every release and
switched to publishing password-protected ZIP archives with the binaries. Well,
this is not very user-friendly and doesn't solve the ever-growing problems with
unsigned/untrusted binaries. Therefore I bought a code signing certificate from
a certificate authority that is trusted by default on current Windows versions.
Now I'm publishing (signed) binaries again. The password-protected ZIP archives
will still be published to keep winetricks/install scripts working and to allow
users to at least download the file if a proxy/firewall/AV denies the access...

codesign.bat
------------

This batch script is used in the build process to sign the release binaries.
Code signing is only enabled if a signtool.exe is present in this directory.
Since dual signing is used (SHA-1/256) a SignTool v6.3 or newer is required.

copyst63.cmd
------------

This script copies the SignTool from the Windows 8.1 SDK to this directory.

SVN repository: <svn://nicode.net/codesign>
Browse at: <http://svn.nicode.net/codesign>
