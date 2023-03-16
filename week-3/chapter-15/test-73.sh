#!/bin/bash
# testing lsof with file descriptors
exec 3>./files/output_file_1.txt
exec 6>./files/output_file_2.txt
exec 7<./files/output.txt
/usr/sbin/lsof -a -p $$ -d0,1,2,3,6,7
