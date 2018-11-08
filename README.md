# Dice Thrower from a File Lab

## Learning Goals

- Read Data from a file
- Parse Data from a file
- Create Object-Oriented program

## Introduction

Object Orientation (OO) is a powerful technique that keeps code easy to reason
about. It wraps data and behaviors into little "cells." This makes code that's
easier to understand and maintain because we only have to reason about what's
going on inside of a tiny little "cell." As any human knows, many specialized
cells working together can produce an amazing outcome (you, for example).

Most OO instruction focuses on building classes that represent or mimic things
in the real world: `Die`, a `Dog`, or a `DiceRoller`. With practice, you'll see
how you can make classes that represent other less-tangible things like
processes, policies, strategies for solving problems.

In this lesson we'll increase the intelligence of a plain old [CSV] ("comma
separated values") data file by "wrapping" it in a class. It's kinda like
putting a human in mecha power armor (without the cool intro music): it's still
an ordinary thing inside, but it's surrounded by **awesome**.

![Mecha Manga 4Eva: Robotech](https://media.giphy.com/media/r1UKKfxA5riJq/giphy.gif)

Before we can power up files with the power of OO, we need to review some facts
about how programs work with data files.

## Read Data From a File

There are many types of files that programming languages can read. Some are
written in binary: 1's and 0's that humans can't read. Files like Word docs,
JPGs, GIFs, and music files are all _binary_ files.

Other types of files, like Ruby source or a text file, can be read by humans
_as well as computers_. We call those files "plain text" files.

So any file that _both_ humans and computers can read will have to be in plain
text. But for a computer to read a data file, the data needs to be regular and
predictable. The content must follow a _format_. It must be _structured_.
Consider the difference between the body of an email and an HTML `<table>`. The
email body has no regular structure, but the HTML `<table>` does!

HTML is a good example of a _format_. It explains what bits of text can follow
other bits of text. That's why it's possible for a computer to validate HTML or
for an HTML processing library like `nokogiri` to find elements.

Here's a sample of some CSV data:

```csv
1,Arya,6,"4,3"
2,Belinda,6,"4,2"
3,Max,6,"5,3"
```

The [CSV] _format_ is used to store data that both humans and computers can
use. It acts like a plain-text database. CSV files are a very common way to
share information. While executives might work with binary Excel files, Excel
files can be exported to CSV, and languages like Ruby, JavaScript, Python, and
Java **all** know how to process CSV.

Each row ("file contents `split` on `\n`") is made up of fields which are
separated by `,` ("each row `split` on `,`"). The first field seems to be an
`id`, the second a name, the third a constant integer, and the fourth a
grouping surrounded by `"` and internally divided into sub-fields based on a
`,` again.

[CSV] doesn't say which data has to come first or second: just that it's
divided into rows by `\n` and the fields are separated by commas. We could have
put the name first or the id looking thing last. Both would have been valid
CSV. We'll explain the specifics of this file as we get into the lab work
below.

## Parse Data from a file

We can use Ruby's built-in [CSV] library to interpret the `.csv` file according
to the "comma-separated values" format.

In this lab you'll create a class that manages a CSV file. It will turn "data
from the disk" into "rows of CSV-foratted data." Furthermore, the class will
provide analysis of the data it possesses (augmenting the powerless file like
how a mecha armor augments a green-haired anime hero!).

![Voltron is a wrapping class to humans](https://media.giphy.com/media/niNOWsn2lTxXq/giphy.gif)

_The lion mechs are "wrappers" to humans in this analogy_

## Create Object-Oriented Program

### Scenario

Let's suppose we're working at a certain magical high school of wizard-like
studies. Our Department of Luck Studies (DoLS) is looking for a new
President. To do this, they had candidates throw many dice rolls in hopes of
finding the luckiest individual. _Unluckily_, the database they were storing
this information in crashed and lost most of its records. Our dedicated IT
team, assisted by Unix magic and the powerful spells `grep` and `awk`, however,
managed to save 100 of the trials to the file `trials.csv`.

The rows in the CSV represent:

```csv
1,Arya,6,"4,3"
```

1.  An `id` for the trial
2.  A participant name (a candidate)
3.  The maximum number of pips on the die thrown in the next field
4.  The results of the candidate's throw. Multiple die are separated by a `,`

So the line above says, in English, "In trial 1, Arya threw six sided dice.
There were two of them (splitting the last field and counting the numbers),
their pips were 4 and 3 leading to a total pip-value of `7`."

### First Release: Learn About the Data

We want to analyze this file for the DoLS.

The tests will guide you in creating a class called `LuckAnalyzer.rb` in
`lib/luck_analyzer.rb`.

- `LuckAnalyzer` class will:
  - Be initialized by being passed the name of the file to read. It must also
    end in `.csv`. Else we `raise` an `ArgumentError`
  - `initialize`
    - Will build a file path from the file name passed in (starter code is
      provided)
    - Will "parse" the data in the file at the file path according to the CSV
      format using the Ruby [CSV] library method that reads in a file and
      converts the rows to an `Array` of `Arrays`. Consult the
      [documentation][csv] for this method
    - The parsed CSV data should be available through a reader called
      `csv_data`
  - Instance methods
    - `#common_number_of_trials`: Because the database crashed, we're not sure
      how many trials are common to the participants. We need this class to
      tell us the minimum _common_ number of trials.
      ```csv
        1,Arya,6,"1,3"
        2,Arya,6,"2,3"
        3,Arya,6,"3,3"
        4,Arya,6,"4,3"
        5,Byron,6,"1,3"
        6,Byron,6,"2,3"
        7,Byron,6,"3,3"
        8,Byron,6,"4,3"
        9,Byron,6,"5,3"
        10,Carl,6,"1,3"
        11,Carl,6,"2,3"
        12,Carl,6,"3,3"
      ```
      In this CSV file, we have a `common_number_of_trials` of `3`. "Carl" has the
      fewest trials and so, if we want to compare candidates equally as a
      percentage, we need the denominator to be **`3`**
    - `#least_trials_candidate`: Which candidate had the least, and thus
      common, number of trials? Returns a `String`
    - `#most_trials_candidate`: Which candidate had the most trials? Returns a
      `String`

> **TYPOGRAPHICAL NOTE**: Developer documentation uses `#methodname` to show that
> `methodname` is an instance method. They use `::methodname` to denote a class
> method. For trigonometry equations there's `Math::sin`, for instances of
> `Mankind` there's `Mankind#sin`.

Use the command `rspec spec/luck_analyzer_spec.rb` from the terminal and get
all of these tests passing.

### Second Release: Who is the Luckiest?

The DoLS would like for you to determine the following:

1.  "Who is the luckiest candidate?" Where:
2.  "Lucky" is defined as having had a dice roll where the total pips is equal
    to `7`
3.  "Luckiest" is defined as having the most "lucky" rolls within a set of
    size `common_number_of_trials`. We should take as many "lucky" rolls as
    possible
    - Example
    - Gven a common size of 3 (where "L" means "Lucky" and "U" means "Unlucky"):
    - A has L, L, L, L => [L, L, L] => 3/3 => 100%
    - B has U, U, U, L => [L, U, U] => 1/3 => 33%
    - C has U, U, U, U, U, U, U, U, U, L, U, L => [L, L, U] => 66%
    - "A" is the luckiest!

The (DoLS) famously asks for new features often, so we want to build this using
an OO. DoLS have certified that the current code of `Die` and `DiceRoller` are
very lucky. They have requested, and paid you handsomely, to update the
existing classes (provided in `lib/`). The trick is that _new_ features can't
break _existing_ functionality. They have given you an existing test suite.

> You can run the full test suite (including your work to satisfy
> `luck_analyzer_spec`, by running `rspec` from the Terminal or `learn`).

- Update `Die` so that:

  - It can be initialized with a permanent value. When a set value is present, all
    calls to the `#roll` instance method return the set value. The permanent
    value should be accessible via a call to `set_value`
  - It provides a `#random_roll?` method which returns `true` if the `Die`'s
    roll value is set randomly and `false` if not.

- Update `DiceRoller` so that:

  - It can be initialized with an `Array` of `Die`
  - If it is initialized with an `Array` of `Die`, when the generate_set
    method is called, it should return the `Array` of the `roll` values of the
    `Die`
  - It has a `lucky?` method to return `true` if the `Array` of `Die`s' pips
    total 7, `false` otherwise

- Update `LuckAnalyzer`
  - Add a method called `luckiest` to return the luckiest participant as
    defined above. The DoLS would like the output to be of the form:
    `candidate_name (lucky_percentage[rounded to the nearest whole number])`
    e.g. `"Perry Hotter (43%)"`

To do so you will need to follow this pseudocoded algorithm

```text
For each row of CSV data
  Find the pips count field, split it on `,`
    For each sub field create a Die with a hard-set values and save them to an
      Array
  Take the Array of Die, and load them up into a DiceRoller because they know
    how to determine whether a roll was `lucky?`
  If the roll was lucky adjust the participant's "lucky percentage"
    Increase their lucky count (numerator) by 1 as its divided by
    `common_number_of_trials` (denominator)
```

## Conclusion

Whew! This is a worthy OO challenge and represents what software developers do
a lot of the time: maintain an existing OO code base, adding features but
keeping the old tests happy while adding new ones! Congratulations!

We also guided you through a process of thinking about how to make small
"cells" of objects collaborate together to make getting answers simpler.

In subsequent lessons, we'll be taking a solution to this problem and
refactor the code to make it concise, clear, and beautiful. You won't want to
miss it!

## Resources

- [CSV]

[csv]: https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html
