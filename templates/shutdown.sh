#! /bin/sh

cd {{ rights_app_dest }}/rights-app-dist
cat RUNNING_PID | xargs kill || rm RUNNING_PID
