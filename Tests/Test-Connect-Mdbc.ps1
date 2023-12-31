#Requires -Modules @{ ModuleName='Mdbc'; GUID='12c81cd8-bde3-4c91-a292-e6c4f868106a'; ModuleVersion='6.6.5' }

# Test: Connect-Mdbc (Mongo)
# https://github.com/nightroman/Mdbc

# Connect the new collection test.test
Connect-Mdbc mongodb://mongo test test -NewCollection

# Add two documents
@{_id = 1; value = 42 }, @{_id = 2; value = 3.14 } | Add-MdbcData

# Get documents as PS objects
Get-MdbcData -As PS | Format-Table

# Get the document by _id
Get-MdbcData @{_id = 1 }

# Update the document, set 'value' to 100
Update-MdbcData @{_id = 1 } @{'$set' = @{value = 100 } }

# Get the document again, 'value' is 100
$doc = Get-MdbcData @{_id = 1 }

# Remove the document
$doc | Remove-MdbcData

# Count documents, 1
Get-MdbcData -Count
