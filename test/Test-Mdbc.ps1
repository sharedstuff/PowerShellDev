# dot-source all *.function.ps1
$GetChildItemParams = @{
    Path = '/'
    Filter = '*.function.ps1'
    File = $true
    Recurse = $true
}
Get-ChildItem @GetChildItemParams | Select-Object -ExpandProperty FullName | ForEach-Object { . $_ }

# https://github.com/nightroman/Mdbc

# Connect the new collection test.test
Connect-Mdbc mongodb://mongo test test -NewCollection

# Add two documents
@{_id = 1; value = 42}, @{_id = 2; value = 3.14} | Add-MdbcData

# Get documents as PS objects
Get-MdbcData -As PS | Format-Table

# Get the document by _id
Get-MdbcData @{_id = 1}

# Update the document, set 'value' to 100
Update-MdbcData @{_id = 1} @{'$set' = @{value = 100}}

# Get the document again, 'value' is 100
$doc = Get-MdbcData @{_id = 1}

# Remove the document
$doc | Remove-MdbcData

# Count documents, 1
Get-MdbcData -Count
