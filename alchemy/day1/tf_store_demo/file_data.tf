resource "local_file" "newfile" {
filename="/tmp/hell-uttam.txt"
content= random_string.d1.result
}
