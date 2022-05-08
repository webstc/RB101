# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# input: string
# output: array of substrings
#
# Explicit Requirements: 
# - write a method
# - return all substring palindromes
# - palindromes are case sensitive
#
# Implicit Requirements: 
# - return an array of the substring palindromes
# - if no palindrome, return an empty array
# - if empty string, return an empty array
# - palindromes are case-sensitive, meaning that "abBa" is not a palindrome
#
# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array



