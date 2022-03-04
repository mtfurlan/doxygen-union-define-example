# example of doxy2man not dealing with define macros or unions very well

## union
input:
```
/** example struct */
struct whatever {
    uint8_t someNumber; /**< a number */
    union {
        char ch;        /**< a char in the union */
        uint8_t num;    /**< a number in the union */
    } someUnion;        /**< a union */
};
```
man page:
```
   example struct
              struct whatever {
                uint8_t            someNumber; // a number
                char               ch;         // a char in the union
                uint8_t            num;        // a number in the union
                union whatever::@0 someUnion;  // a union
              };
```

## defines
They just aren't documented, and if a define has parameters like
```
/**
 * get size of array
 *
 * @param  arr array to get size of
 * @return     number of elements in arr
 **/
#define ARRAY_SIZE(arr)     (sizeof(arr) / sizeof((arr)[0]))
```

doxy2man outputs the warning
```
Can't find param name:  "arr"
```
