char _smallest_character(char str[], char c, int index)
{
    if (str[index] != '\0') {
        if (str[index] <= c)
            return _smallest_character(str, c, ++index);
        return str[index];
    }
    return str[0];
}

char smallest_character(char str[], char c){
    char a = _smallest_character(str, c, 0);
    return a;
}