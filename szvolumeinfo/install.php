<?php

/**
 * This function is called on installation and is used to create database schema for the plugin
 */
function extension_install_szvolumeinfo()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery("CREATE TABLE IF NOT EXISTS `szvolumeinfo` (
                              `ID` INT(11) NOT NULL AUTO_INCREMENT,
                              `HARDWARE_ID` INT(11) NOT NULL,
                              `DRIVELETTER` VARCHAR(255) DEFAULT NULL,
                              `DRIVETYPE` VARCHAR(255) DEFAULT NULL,
							  `TOTALSIZE` VARCHAR(255) DEFAULT NULL,
							  `VOLUMENAME` VARCHAR(255) DEFAULT NULL,
							  `SERIALNUMBER` VARCHAR(255) DEFAULT NULL,
							  `SHARENAME` VARCHAR(255) DEFAULT NULL,
							  `ISREADY` VARCHAR(255) DEFAULT NULL,
							  `FREESPACE` VARCHAR(255) DEFAULT NULL,
							  `FILESYSTEM` VARCHAR(255) DEFAULT NULL,
							  `AVAILABLESPACE` VARCHAR(255) DEFAULT NULL,
                              PRIMARY KEY  (`ID`,`HARDWARE_ID`)
                            ) ENGINE=INNODB ;");
}

/**
 * This function is called on removal and is used to destroy database schema for the plugin
 */
function extension_delete_szvolumeinfo()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `szvolumeinfo`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_szvolumeinfo()
{

}

function extension_hook_szvolumeinfo()
{}
