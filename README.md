# NightWriter

# Learning Goals / Areas of Focus

Practice breaking a program into logical components
Testing components in isolation and in combination
Applying Enumerable techniques in a real context
Reading text from and writing text to files

# Before You Begin

The idea of Night Writing was first developed for Napoleon’s army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille’s development of his Braille tactile writing system.

In this project we’ll implement systems for generating Braille-like text from normal characters and the reverse.

# Simulating Braille

Braille uses a two-by-three grid of dots to represent characters. We’ll simulate that concept by using three lines of symbols:

0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0
....0.0.0....00.0.0...
The 0 represents a raised dot. The period is an unraised space. The above code reads “hello world” in normal text. You can experiment with converting other words yourself and share some samples with your classmates.

Let’s also constrain our Braille files to 80 braille characters (160 dots) wide.

# Base Expectations

### An Interaction Model

The tool is used from the command line like so:

$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
That will use the plaintext file message.txt to create a Braille simulation file braille.txt.

Then we can convert that Braille simulation back to normal text:

$ ruby ./lib/night_read.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
Character Support
Use the lowercase letters a-z here from the American Foundation for the Blind for your project.

We also need to support capitalization. In Braille, capitalization comes from a shift character. You’ll find that character at the end of the fourth row of the previous graphic. When that character appears, the next character (and only the next character) is a capital. So e comes out as one 2x3 set of Braille points, but E is 4x3: the shift character followed by the normal e. Consider how this will affect your line width restrictions.

# Development Phases

As you work to implement the project below are some ideas of how you might start into the problem.

If you’d like an example of how you might extract the File I/O into an external class, check out this gist.

# 1. The Runner

Write a Ruby program that can output a string like:

$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
Then work to:

Pull the specified output filename from the command line arguments and print it in the terminal
Get the actual number of characters from the message.txt and output it in the terminal

# 2. Echo Characters

Your Braille-simulation file will need three lines of output for every one line of input. Start by outputting your input in three repeated rows.

hello world
Turns into

hello world
hello world
hello world

# 3. Mapping

You’ll need a component that takes a normal text character and returns the Braille equivalent. It’s time to build that now.

# 4. Triple Replacement

Bringing together the Echo Characters idea with the Mapping idea, you can actually output your Braille characters to the file. Consider building a component that would take in a plain-text letter and a position (maybe numbered 0-5) and would return either a 0 or ..

About this point, you should try Braille-ifying a message and exchange it with a classmate. Are your outputs identical?

# 5. Translate Braille to English

Repeat steps 2 - 4 to translate a Braille text file to an English text file.
