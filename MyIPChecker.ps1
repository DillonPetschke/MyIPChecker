# Read in MyList file as an array to compare to
$set1 = Get-Content -Path .\MyList.csv
# Prepare to collect the results
$results = New-Object -TypeName System.Text.StringBuilder
# Create the BlackLists directory to hold the CSVs
New-Item -Force -Path ".\" -Name "BlackLists" -ItemType "directory"
# Download and save the blacklists to be used.
Invoke-WebRequest https://iplists.firehol.org/files/firehol_level1.netset -OutFile .\BlackLists\fireholeLevel1.csv
Invoke-WebRequest https://iplists.firehol.org/files/alienvault_reputation.ipset -OutFile .\BlackLists\alienvault.csv
Invoke-WebRequest https://iplists.firehol.org/files/et_spamhaus.netset -OutFile .\BlackLists\spamhauset.csv
Invoke-WebRequest https://iplists.firehol.org/files/spamhaus_drop.netset -OutFile .\BlackLists\spamhausedrop.csv
Invoke-WebRequest https://iplists.firehol.org/files/bitcoin_nodes_30d.ipset -OutFile .\BlackLists\bitcoinnodes.csv
Invoke-WebRequest https://iplists.firehol.org/files/blocklist_de.ipset -OutFile .\BlackLists\blocklistde.csv
Invoke-WebRequest https://iplists.firehol.org/files/bruteforceblocker.ipset -OutFile .\BlackLists\bruteforceblocker.csv
Invoke-WebRequest https://iplists.firehol.org/files/darklist_de.netset -OutFile .\BlackLists\darklistde.csv
Invoke-WebRequest https://iplists.firehol.org/files/iblocklist_isp_verizon.netset -OutFile .\BlackLists\verizonblocklist.csv
Invoke-WebRequest https://iplists.firehol.org/files/iblocklist_isp_qwest.netset -OutFile .\BlackLists\qwestblocklist.csv
Invoke-WebRequest https://iplists.firehol.org/files/iblocklist_isp_twc.netset -OutFile .\BlackLists\twcblocklist.csv

# Start looking for any matches
Get-Content -Path .\BlackLists\fireholeLevel1.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on fireholeLevel1.csv")
        }
    }
Get-Content -Path .\BlackLists\alienvault.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on alienvault.csv")
        }
    }
Get-Content -Path .\BlackLists\spamhauset.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on spamhauset.csv")
        }
    }
Get-Content -Path .\BlackLists\spamhausedrop.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on spamhausedrop.csv")
        }
    }
Get-Content -Path .\BlackLists\bitcoinnodes.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on bitcoinnodes.csv")
        }
    }
Get-Content -Path .\BlackLists\blocklistde.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on blocklistde.csv")
        }
    }
Get-Content -Path .\BlackLists\verizonblocklist.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on verizonblocklist.csv")
        }
    }
Get-Content -Path .\BlackLists\qwestblocklist.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on qwestblocklist.csv")
        }
    }
Get-Content -Path .\BlackLists\twcblocklist.csv | foreach {
        if ($_ -in $set1)
        {
            [void]$results.AppendLine($_ + " Was found on twcblocklist.csv")
        }
    }
# Output the results
$results.ToString() | Out-File -FilePath .\results.csv -Encoding ascii