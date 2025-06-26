<#
Author: Mike Glenn
Usage: .\Get-FirstRecurringCharacter.ps1 teststring
Returns first recurring character in string (e.g. 't' in 'teststring')
#>

# Get string parameter from prompt
param ([string]$param1)

function Get-FirstRecurringCharacter {    
    # Cast string parameter as char array
    param ([char[]]$foo)

    # Use HashSet to solve in O(N)
    $set = New-Object System.Collections.Generic.HashSet[char]
    
    # Loop through string (now char array)
    foreach ($char in $foo) {
        # HashSet<T>.Add(T) returns true if the element is added to the HashSet<T> object
        # false if the element is already present.
        # https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.hashset-1.add?view=net-5.0
        # Conditionally true on negation (not[!] false)  
        if (!$set.Add($char)) {
            # Element ($char) is already present in $set so return it as the recurring character
            return $char
        }
    }

    # Went through all string characters so no recurring character found
    return 'No recurring character found in string.'
}

Get-FirstRecurringCharacter $param1
