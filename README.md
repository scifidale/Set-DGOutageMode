# Set-DGOutageMode

This script performs a basic scan of Citrix Delivery groups and sets the ReuseMachinesWithoutSHutDownInOutage to true if any false enteries are found. 
This script should be placed locally on a delivery controller and can be run as a scheduled task to ensure that new delivery groups are also updated 
without manual intervention. 

A single variable can be changed for the log file locations. 
A final task scans post chance and logs an event if any false results are found. 
