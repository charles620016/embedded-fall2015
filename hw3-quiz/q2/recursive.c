char smallest_character(char str[], char c, int index)
{
    /* check if the index is out of bound first*/
    if (str[index] != 127) {
        if (str[index] <= c)
            return smallest_character(str, c, ++index);
        return str[index];
    }
    /* out of bound, return str[0]*/
    return str[0];
}