# Remove Old Artifact

$exportPath = ".\Artifact"

if (Test-Path -Path $exportPath)
{
    Remove-Item $exportPath
}
mkdir $exportPath
