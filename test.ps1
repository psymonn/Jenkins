#Let try passing a parameter from Jenkins to the script
param($VariableA)

write-host "Well, did we get $VariableA passed in correctly?"

$LASTEXITCODE =1
# Now commit to GitHub!


#Let make it a drop down box as well