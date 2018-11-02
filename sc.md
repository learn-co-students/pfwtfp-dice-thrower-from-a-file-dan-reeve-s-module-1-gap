

imagine that we're retrieving data about dice throws from
a plain-text file in the [CSV] format. It's good to practice reading data from
[CSV]s and converting that data into instances of objects because this is only
_slightly_ different from reading from a _database_. We'll wrap the file in
object-oriented code and, in so doing, turn a "dumb" text file into a class
instance that can answer sophisticated questions.


In this lesson, we'll expand "real world" classes: `Die` and `DiceRoller`.
We'll also see how we can use classes to describe things that don't have a
direct real-world analog.

Learning to work with CSVs is good practice for preparing to work with
databases. Over and above that, CSVs or JSON files are a very common way to
share information in developer communities. While the executives might speak
Excel, Excel can be exported to CSV, and developers' tools know how to speak
CSV.
