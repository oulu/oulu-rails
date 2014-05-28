# Mixins

[back](index.md)

## +text-block

文字のスタイルをまとめて一行で書けるmixin。

`+text-block(1, 2, 3, 4, 5, 6, 7)`

1. $font-size
	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color
2. $line-height
 	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color
3. $margin-bottom
	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color
4. $font-weight
	- XXpx -> $top
	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color
5. $text-align
	- XXpx -> $top
	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color
6. $top（$font-weight, $text-align, $color）
	- XXpx -> $top
	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color
7. $color
	- XXpx -> $top
	- normal, bold, >=100 -> $font-weight
	- left, center, right -> $text-align
	- `#ffffff`, red, rgba(0, 0, 0, .4) -> $color