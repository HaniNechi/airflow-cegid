__version__ = "1.0.0"

## This is needed to allow Airflow to pick up specific metadata fields it needs for certain features.
def get_provider_info():
    return {
        "package-name": "airflow-provider-cegid-sftp",  # Required
        "name": "cegid_sftp",  # Required
        "description": "custom sftp for ccegid retail ERP.",  # Required
        "connection-types": [
            {
                "connection-type": "sftp-cegid",
                "hook-class-name": "cegid_sftp.hooks.sftp.SFTPHook"
            }
        ],
        
        "versions": [__version__],  # Required
    }
    