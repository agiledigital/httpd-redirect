#!/bin/bash

# Exit on error
set -e

/tmp/template-config.sh
/usr/bin/run-httpd -f /opt/app-root/httpd.conf
