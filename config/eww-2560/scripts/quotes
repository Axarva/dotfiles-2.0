#!/bin/bash
num=$(echo $((1 + $RANDOM % 500)))

cat /tmp/xmonad/quotes/quotes.json | jq --arg num "$num" ".[$num]" | jq -r ".text" > /tmp/xmonad/quotes/quote
cat /tmp/xmonad/quotes/quotes.json | jq --arg num "$num" ".[$num]" | jq -r ".author" > /tmp/xmonad/quotes/author

quote=$(cat /tmp/xmonad/quotes/quote)
qc=$(cat /tmp/xmonad/quotes/quote | wc -c)
rm /tmp/xmonad/quotes/quote
rm /tmp/xmonad/quotes/quote-tail
if [ "$qc" -le 58 ]; then
	echo "$quote" > /tmp/xmonad/quotes/quote
        echo "" > /tmp/xmonad/quotes/quote-tail
else
     	printf '%s\n' "${quote:0:${#quote}/2}" > /tmp/xmonad/quotes/quote
        printf '%s\n' "${quote:${#quote}/2}" > /tmp/xmonad/quotes/quote-tail
fi
