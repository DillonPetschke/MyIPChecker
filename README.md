# MyIPChecker
This script will read a CSV file of IP addresses and search well known blacklists looking for matches. 

To Use, you will need to list your external IPs in a CSV file titled "MyList.csv" 
  An example of MyList.csv will be saved in this repository.

Note:
This script will create directory "BlackLists" in the folder it is saved in. It downloads the current version of well known
blacklists and saves them as .CSVs in this folder. 

If any IP is found, it is added to results.csv that will be created and placed in the same directory MyIPChecker is saved in. 

----------------------------------------------------------------------------------------------------

Black Lists used:

AlienVault

BitcoinNodes

BlockListde

BruteForceBlocker

DarkListde

FireHoleLevel1

QwestBlockList

SpamhauseDrop

SpamhauseT

TWCBlockList

VerizonBlockList
