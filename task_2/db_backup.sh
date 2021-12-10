#!/bin/bash

mysqldump --no-tablespaces -u ivan -pivan1234 My_database > My_db_dump_"`date +"%d-%m-%Y_%H:%M"`".sql
