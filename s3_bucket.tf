resource "aws_s3_bucket" "s3_excel_sheet" {
  bucket        = ""  #ENTER YOUR BUCKET NAME
  force_destroy = true
  tags = {
    Name = "EC2 Details"
  }
}
resource "aws_s3_object" "sheets-folder" {
  bucket      = aws_s3_bucket.s3_excel_sheet.id
  acl         = "private"
  key         = "sheets/ec2-instances.XLSX"
  source      = "${path.module}/sheets/ec2-instances.XLSX"
  source_hash = filemd5("${path.module}/sheets/ec2-instances.XLSX")
}