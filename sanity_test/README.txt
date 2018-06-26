To run cucumber files please use the command

bin/run <host> <name_of_feature_file:line_number> <--tags @tag_name ~@tag_name>

@wip tagged scenarios are not run by default

for example to run the homepage feature
bin/run prod homepage.feature
for example to run the all features tagged with teacher
bin/run prod --tags @teacher
for example to run the all the features not tagged with @parent
bin/run prod --tags ~@parent
for example to run a specific scenario in a file (using the line number)
bin/run prod homepage.feature:42


Rukuli information
Info on installation and dependencies can be found at the following link:
https://github.com/andreanastacio/Rukuli
The basics: JRuby must be installed, as must Sikuli X. One of the dependencies is the java gem - the most recent version of this gem (0.0.2) requires Ruby 2.1.0, which is not available on Windows, so I have put java 0.0.1 in the Gemfile.
