/**
 * @file
 * @brief example lib
 **/
#ifndef EXAMPLE_LIB_H
#define EXAMPLE_LIB_H


/** example struct */
struct whatever {
    uint8_t someNumber; /**< a number */
    union {
        char ch;        /**< a char in the union */
        uint8_t num;    /**< a number in the union */
    } someUnion;        /**< a union */
};

/**
 * get size of array
 *
 * @param  arr array to get size of
 * @return     number of elements in arr
 **/
#define ARRAY_SIZE(arr)     (sizeof(arr) / sizeof((arr)[0]))

/** some constant **/
#define CONSTANT 42

/**
 * do the thing
 *
 * @param arg example arg or whatever
 **/
void doThing(struct whatever* arg);

#endif // EXAMPLE_LIB_H

