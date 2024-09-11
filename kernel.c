void kmain(void)
{
    const char *str = "My kernel yupppi";
    char *vidptr = (char*)0xb8000;
    unsigned int i = 0;
    unsigned int j = 0;

    while (j < 80 * 25 * 2)
    {
        vidptr[j] = ' ';
        vidptr[j+1] = 0x02; //attribute-byte
        j += 2;
    }
    j = 0;

    while (str[j] != '\0')
    {
        vidptr[i] = str[j];
        vidptr[i+1] = 0x02; //attribute-byte
        j++;
        i += 2;
    }

    return;
}
