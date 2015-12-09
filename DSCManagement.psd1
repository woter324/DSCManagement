#
# Module manifest for module 'DSCManagement'
#
# Generated by: Tex
#
# Generated on: 01/12/2015
#
@{
# Script module or binary module file associated with this manifest.
# RootModule = ''

# ID used to uniquely identify this module
GUID="{9fd52909-cbc8-456d-8632-ef5aca5ab2a5}"

# Author of this module
Author="Arcotek Limited"

# Company or vendor of this module
CompanyName="Arcotek Limited"

# Copyright statement for this module
Copyright="© Arcotek Limited. All rights reserved."

# Description of the functionality provided by this module
Description = 'Confirgures Desired State Configuration (DSC) Pull server and target agents'

# Version number of this module.
ModuleVersion="1.0.0.0"

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion="3.0"

# Module name to process
ModuleToProcess = 'DSCManagement.psm1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
#RequiredModules = @('ErrorsAndLogs', 'ActiveDirectory')

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

#Cmdlets to export from this module
#CmdletsToExport = 'Send-TargetNodeConfig'

# Functions to export from this module
#FunctionsToExport = 'Send-DSCTargetNodeConfig','*'
FunctionsToExport = 'Start-DSCManagement','*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess
# PrivateData = ''

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''
}