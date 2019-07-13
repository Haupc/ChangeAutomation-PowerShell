# Invoke build


# publish











$target = New-DatabaseConnection -ServerInstance "prod01\sql2014" -Database "Production" -Username "AutomationUser" -Password "P@ssw0rd"
$buildArtifact = Import-DatabaseBuildArtifact "C:\Work\buildArtifacts\DatabaseBuildArtifact.1.0.0.nupkg"

$update = New-DatabaseReleaseArtifact -Source $buildArtifact -Target $target

Use-DatabaseReleaseArtifact $update -DeployTo $target

https://documentation.red-gate.com/sca3/reference/powershell-cmdlets/new-databasereleaseartifact