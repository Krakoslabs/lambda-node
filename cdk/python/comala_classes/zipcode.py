from zipfile import ZipFile
import os
from os.path import basename

class ComalaZipcode():

    def __init__(self, zipname, pathtozip):
      with ZipFile(zipname, 'w') as zipObj:
        for folderName, subfolders, filenames in os.walk(pathtozip):
            for filename in filenames:
                filePath = os.path.join(folderName, filename)
                zipObj.write(filePath, basename(filePath))
