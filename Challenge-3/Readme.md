1. The function **get-key-from-object** takes 2 parameters one is object and other is key
2. In this function we take first input parameter and we split the object with delimiter ":" ,"}","{" and we get plain string in array
3. And second paramter we take the key and split with delimiter '/' and get plain string in array.
4. And the 2 arrays we compare get the uncommon values which inturn we get value for the key.
5.  Calling Powershell function syntax  **Function call**: get-key-from-object "{x:{y:{z:a}}}" "x"

**Note:**
This is powershell script .Please pass the first input parameter without any double quotes (**ex: {x:{y:{z:a}}} **) as it not recognizing as string 

