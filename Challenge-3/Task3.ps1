function get-key-from-object([string]$given_string, [string]$key)
{

# Split the object using delimiter ':' , '{' ,'{' and get the plain string.
$split_string=($given_string -split ":") -replace '{','' -replace '}',''

# split the key with delimiter '/' and get the plain string
$key_split = $key -split "/"

# compare the 2 arrays one array is $split string and other array is $key_split
$result = Compare-Object -ReferenceObject $split_string -DifferenceObject $key_split -PassThru

# return the ouput value
return  $result

}
