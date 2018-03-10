$content = Get-Content ./load.json | ConvertFrom-json
# Write-Output $content

foreach($perk in $content.Perks){
    Write-Output $perk.name
    Write-Output $perk.desc
    Write-Output $perk.notify

}

$types = ('boxer', 'martial artist', 'unarmed master', 'barbarian', 'slow metabolism','desert rat','evasive','precise','scout','stealthy','gastronome')

foreach ($type in $types){

    Write-Output "('$($content.Perks.$($type).name)', '$($content.Perks.$($type).desc)', '$($content.Perks.$($type).notify)')"
}