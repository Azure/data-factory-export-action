#!/bin/sh -l

dataFactoryDirectory=$1
dataFactoryId=$2

armTemplateOutputSubDirectory="armTemplate"

cd $dataFactoryDirectory
ls -l

echo "Installing Azure Data Factory package..."
npm install
echo "Installation completed."

echo "Validating $dataFactoryId at $(pwd)..."
npm run build validate $(pwd) $dataFactoryId
echo "Validation completed."

if [[ "$dataFactoryDirectory" == */ ]]; then
  armTemplateOutputDirectory="$dataFactoryDirectory$armTemplateOutputSubDirectory"
else
  armTemplateOutputDirectory="$dataFactoryDirectory/$armTemplateOutputSubDirectory"
fi

echo "Exporting $dataFactoryId to $armTemplateOutputDirectory..."
npm run build export $(pwd) $dataFactoryId $armTemplateOutputSubDirectory
echo "Export completed."

echo "::set-output name=arm-template-directory::$armTemplateOutputDirectory"
