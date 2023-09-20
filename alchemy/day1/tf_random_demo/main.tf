resource "random_string" "demodata" {
  length = "15"
}

resource "random_string" "demodata2"{
 length = "12"
}

resource "local_file" "file1" {
    filename= "/tmp/hello-file1.txt"
    content = random_string.demodata.result
}

