# Get all local groups on a remote server
powershell -c "([ADSI]'WinNT://SERVER,computer').psbase.children | where { $_.psbase.schemaClassName -eq 'group' } | foreach { ($_.name)[0]}"

# Find members of the local Administrators group on a remote server
powershell -c "$([ADSI]'WinNT://SERVER/Administrators,group').psbase.Invoke('Members') | foreach { $_.GetType().InvokeMember('ADspath', 'GetProperty', $null, $_, $null).Replace('WinNT://', '') }"

# Enable the local Administrator account on a remote server
powershell -c "$a=([ADSI]'WinNT://SERVER/Administrator,user');$a.UserFlags=2;$a.CommitChanges()"

# Disable the local Administrator account on a remote server
powershell -c "$a=([ADSI]'WinNT://SERVER/Administrator,user');$a.UserFlags=512;$a.CommitChanges()"
