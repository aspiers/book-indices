# Indices for jazz real / fake books

This repository is intended to be a high quality, collaboratively
edited collection of indices for well known jazz real / fake books.
If you spot any mistakes or want to contribute a new index, you are
extremely welcome to do so
[right now](https://help.github.com/articles/creating-and-editing-files-in-your-repository)!

## File format

The format of these index files is extremely simple to understand, so
anyone should be able to make contributions - it's the very well-known
[CSV (or Comma-Separated Values) format](http://en.wikipedia.org/wiki/Comma-separated_values).
Each line in an index file contains:

1   the name of a tune
2   the number of the first page of the tune within the PDF file
3   (optional) the number of the last page of the tune within the PDF file

For example:

    Stormy Weather,452,453

means that the tune Stormy Weather starts on page 452 and finishes on
the next page.

The final page number is optional, because it can often be
automatically inferred by the starting page of the next tune, and this
makes indices a lot easier to type, edit, and read.  For example, here
the first tune can be assumed to be only one page long, i.e. finishing
on page 391:

    Seven Come Eleven,391,
    Seven Steps To Heaven,392,

Sometimes a tune will actually bleed over onto a page on which another
tune starts, in which case its final page can be manually specified to
eliminate the chance of the computer guessing wrong.

Note that these page numbers refer to the number of the page in the
PDF, **not** the number you will see printed at one of the corners of
the page!  They are usually different because the numbering in the
original books does not simply start at 1 and increase in a perfect
sequence due to the presence of cover pages, prefaces, indices,
appendices etc. which are usually excluded from the printed numbering.

As you can see, the three values are separated by commas.  If the name
of the tune contains a comma, then you must surround the whole tune
name with double quotes, e.g.

    "Night In Tunisia, A",20,

(This repository adopts the standard that tunes whose name begins with
"A" or "The" should place the
[definite or indefinite article](http://en.wikipedia.org/wiki/Article_(grammar))
at the end of the name, after a comma, in order to facilitate a more
useful alphabetical sorting order.)

If the tune itself already contains double quotes, then you must also
double those double quotes:

    "Take The ""A"" Train",434,

Finally, UNIX line endings are used, rather than MS-DOS / Windows-style
[CR/LF](http://en.wikipedia.org/wiki/Newline) line endings.

## Legal stuff

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">Music book indices</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/aspiers/book-indices" property="cc:attributionName" rel="cc:attributionURL">Adam Spiers</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

I am not a lawyer, but I understand that there is a slim chance that
these indices could be argued to be derivative works of copyrighted
material.  If so, they are distributed under
[fair use](http://en.wikipedia.org/wiki/Fair_use), given that:

*   the distribution is not for profit
*   the distribution cannot negatively impact the expected revenue from
    or market for the original works (in fact if anything it should
    increase it)
*   the indices substantially less than the original work
*   considerable original effort was invested in creating accurate indices
