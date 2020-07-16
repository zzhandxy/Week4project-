## Code Book

### Data

The data used in this project is provided by <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

### Original File

(1)"X_train.txt"/"y_train.txt": Training set/labels

(2)"X_test.txt"/"y_test.txt": Test set/labels

(3)"subject_train.txt"/"subject_test.txt" :The subject who performed the activity

(4)"features.txt":List of all features

(5)"activity_labels.txt":Links the class labels with their activity name.

### Package

`dplyr`:dplyr is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges. More information about `dplyr` can be found in <https://github.com/tidyverse/dplyr>

## Function

(1)`read.table()`: load the original files

(2)`cbind()`and`rbind()`:combine the training and test set

(3)`grep()`:search for matches to "mean()" and "sd()"

(4)`as.factor()`: convert the class to 'factor'

(5)`levels()`: return the labels of a factor object

(6)`gsub()`:perform replacement of the all matches 

(7)`group_by()`:convert an exiting tbl into a grouped tbl where operations are performed "by group"

(8)`summarise_each()`:return a `data.frame` contains all means for each activity and subject


