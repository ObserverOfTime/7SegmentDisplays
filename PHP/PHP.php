<?php

function invalid($string)
{
    return preg_match('/[gkmqvwxzio]/i', $string);
}

$longest = '';
$maxlen = 0;

foreach (file('words.txt') as $word) {
    if (!invalid($word)) {
        if (strlen($word) == $maxlen) {
            $longest .= $word;
        } elseif (strlen($word) > $maxlen) {
            $longest = $word;
            $maxlen = strlen($word);
        }
    }
}

echo $longest;
