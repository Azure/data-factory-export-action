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

armTemplateOutputDirectory="$dataFactoryDirectory/$armTemplateOutputSubDirectory"

echo "Exporting $dataFactoryId to $armTemplateOutputDirectory..."
npm run build export $(pwd) $dataFactoryId $armTemplateOutputSubDirectory
echo "Export completed."

echo "::set-output name=arm-template-directory::$armTemplateOutputDirectory"
