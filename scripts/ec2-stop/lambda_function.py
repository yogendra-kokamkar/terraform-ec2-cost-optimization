import os
import boto3
import pandas as pd

def lambda_handler(event, context):
    # Specify the S3 bucket and key where the Excel file is located
    s3_bucket = ''       #ENTER YOUR BUCKET NAME
    s3_key = 'sheets/ec2-instances.XLSX'

    # Specify the action ('start' or 'stop')
    action = 'stop'

    # Download the Excel file from S3
    excel_file_path = '/tmp/ec2-instances.XLSX'
    s3 = boto3.client('s3')
    s3.download_file(s3_bucket, s3_key, excel_file_path)

    # Get instance IDs from the Excel file
    instance_ids = get_instance_ids_from_excel(excel_file_path)

    # Start or stop instances
    start_stop_ec2_instances(instance_ids, action)

def get_instance_ids_from_excel(file_path):
    # Read the Excel file
    df = pd.read_excel(file_path)

    # Extract instance IDs from the 'InstanceID' column
    instance_ids = df['InstanceID'].tolist()

    return instance_ids

def start_stop_ec2_instances(instance_ids, action):
    # Connect to EC2
    ec2 = boto3.client('ec2', region_name='ap-south-1')

    # Perform the specified action (start or stop) on instances
    if action == 'start':
        response = ec2.start_instances(InstanceIds=instance_ids)
    elif action == 'stop':
        response = ec2.stop_instances(InstanceIds=instance_ids)
    else:
        print('Invalid action. Use "start" or "stop".')
        return

    print(f'Instances {action}ed:', response)
