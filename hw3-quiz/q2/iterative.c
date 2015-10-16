char smallest_character(char str[], char c)
{
    int index = 0;
    while (str[index] != 127) { 
        if (str[index] > c)
            return str[index];
        ++index;
    }
    return str[0];
}