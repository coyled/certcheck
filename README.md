certcheck
=========

Check a web site's SSL cert and print the number of days until it
expires.


Status
------

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)


Usage
-----

```
    % git clone https://github.com/coyled/certcheck.git
    % cd certcheck
    % bin/certcheck 
    Usage: checkcert --domains example.com [foo.example.com <...>]
        -d, --domains *DOMAINS           domain(s)
        -h, --help                       Show this message
    % bin/certcheck -d coyled.com
    coyled.com,79.38
    % 
```
