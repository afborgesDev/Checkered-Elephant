Feature: As a checkered elephant user
    I want to configure the lib once and use this through my whole application as simple as possible.

    Scenario: Try to connect using a valid applicationSettings.json
        Given an applicationSettings whit the configurations
        When the applicationsettings is passed through the entry point
        Then the checkered elephant validate and connect on redis instance

    Scenario: Try to connect using bad formated applicationSettings.json
        Given an applicationSettings whit the configurations in a not compliance formmat
        When the applicationsettings is passed through the entry point
        Then the checkered elephant validate and throws an single exception for all invalid arguments

    Scenario Outline: Try to connect using applicationSettings.json not founded or invalid file type
        Given a file to represent the applicationSettings '<fileName>'
        When the file is passed through the entry point
        Then the checkered elepahnt validate and throws an exception with the error code: '<errorCode>' and description: '<exceptionDescription>'
        Examples:
            | fileName                 | errorCode | exceptionDescription                                                                                       |
            | notExistentFileName.json | CEL-1     | could not found the applicationSettings on the path <fileName>                                             |
            |                          | CEL-1     | could not found the applicationSettings on the path <fileName>                                             |
            | invalidFormat.json       | CEL-2     | the file <fileName> has a non-compliance format, please check if this file are a valid applicationSettings |
            | invalidFormat.xml        | CEL-2     | the file <fileName> has a non-compliance format, please check if this file are a valid applicationSettings |

    Scenario: Try to connect using environment variables
        Given the environments requesteds to connect well configurated
        When an entry point that explicitly works with environment variables is called
        Then the checkered elepahnt validate and connect on redis instance

    Scenario: Fail on try to connect using not not found or invalid environment variables
        Given that invalid environments variables
            | hostName    | port        | user        | password    |
            |             |             |             |             |
            | invalidHost | invalidPort | invalidUser | invalidPass |
        When the entry point that explicitly works with environment variables is called
        Then the checkred elepahnt validate and throws an single exception for all missing or invalid environment variables

    Scenario: