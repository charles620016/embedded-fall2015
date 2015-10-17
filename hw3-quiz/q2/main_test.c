#include <stdio.h>
#include <assert.h>

/* str[] */
char alphabet[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
                   'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
                   'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                   'y', 'z', '\0'
                  };

int main(int argc, char const *argv[])
{

#if defined(ITERATIVE)
    printf("boundary test for iterative method...\n");
#endif
#if defined(RECURSIVE)
    printf("boundary test for recursive method...\n");
#endif

    assert(smallest_character(alphabet, 'a')=='b' && "error : input->a");
    assert(smallest_character(alphabet, 'n')=='o' && "error : input->n");
    assert(smallest_character(alphabet, 'x')=='y' && "error : input->x");
    assert(smallest_character(alphabet, 'z')=='a' && "error : input->z");
    
    printf("Pass the test!\n");

    return 0;
}