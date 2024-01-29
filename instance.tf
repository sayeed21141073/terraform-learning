#creating key pair using ubuntu cli, not from aws

resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.ami[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.availability_zone_1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-05c72e5a6ccee47e3"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
    
  }

  connection {
    user        = var.USER
    private_key = file("dovekey")
    host        = self.public_ip
  }
}

output "public_ip" {
  value = aws_instance.dove-inst.dove-inst.public_ip
}