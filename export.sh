#!/usr/bin/env bash

dataFactoryDirectory=$1
dataFactoryId=$2

armTemplateOutputSubDirectory="armTemplate"

cd $dataFactoryDirectory
ls -l

echo "Installing Azure Data Factory package..."
npm install @microsoft/azure-data-factory-utilities
echo "Installation completed."

echo "Validating $dataFactoryId at $(pwd)..."
node ./node_modules/@microsoft/azure-data-factory-utilities/lib/index validate $(pwd) $dataFactoryId
echo "Validation completed."

if [[ "$dataFactoryDirectory" == */ ]]; then
  armTemplateOutputDirectory="$dataFactoryDirectory$armTemplateOutputSubDirectory"
else
  armTemplateOutputDirectory="$dataFactoryDirectory/$armTemplateOutputSubDirectory"
fi

echo "Exporting $dataFactoryId to $armTemplateOutputDirectory..."
node ./node_modules/@microsoft/azure-data-factory-utilities/lib/index export $(pwd) $dataFactoryId $armTemplateOutputSubDirectory
echo "Export completed."

echo "arm-template-directory=$armTemplateOutputDirectory" >> $GITHUB_OUTPUT
