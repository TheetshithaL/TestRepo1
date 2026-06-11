*** Settings ***
Documentation     TS0001 Automated Test Suite
Library           SeleniumLibrary
Library           BuiltIn

Suite Setup       Suite Setup Keywords
Test Setup        Method Setup
Test Teardown     Method Teardown
Suite Teardown    Suite Teardown Keywords


*** Variables ***
${BASE_URL}           https://practicetestautomation.com
${TIMEOUT}            15s
${DELAY}              0.5s
${PRACTICE_URL}           https://practicetestautomation.com/practice/
${COURSES_URL}           https://practicetestautomation.com/courses/
${BLOG_URL}           https://practicetestautomation.com/blog/
${CONTACT_URL}           https://practicetestautomation.com/contact/
${VALUE_161_VALUE}           theetshitha
${EMAIL}           theetshitha@gmail.com
${ELEMENT_1}           link=Practice
${ELEMENT_2}           link=Courses
${ELEMENT_3}           link=Blog
${ELEMENT_4}           link=Contact
${ELEMENT_5}           id=wpforms-161-field_0
${ELEMENT_6}           id=wpforms-161-field_0-last
${ELEMENT_7}           id=wpforms-161-field_1
${ELEMENT_8}           id=wpforms-161-field_1__2


*** Keywords ***
Suite Setup Keywords
    Log    Suite setup started
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --disable-gpu
        Call Method    ${options}    add_argument    --disable-software-rasterizer
        Call Method    ${options}    add_argument    --no-first-run
        Call Method    ${options}    add_argument    --disable-extensions
        Call Method    ${options}    add_argument    --disable-web-security
        Call Method    ${options}    add_argument    --allow-running-insecure-content
        Call Method    ${options}    add_argument    --user-data-dir\=/tmp/chrome_ca3c86a200a24bfba4f502c2b504409d
        Call Method    ${options}    add_argument    --remote-debugging-port\=0
        Call Method    ${options}    add_argument    --user-agent\=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36
        Log To Console    ${options.arguments}
        Create Webdriver    Chrome    options=${options}

Suite Teardown Keywords
    Log    Suite teardown started
        Run Keywords    Capture Page Screenshot    AND    Close Browser
    Log    Browser closed successfully

Method Setup
    Log    Test setup started
    Log    Test setup completed

Method Teardown
    Log    Test teardown started
    Log    Test teardown completed

Capture Screenshot On Failure
    Run Keyword If Test Failed    Capture Page Screenshot


*** Test Cases ***

TS0001
    [Documentation]    TS0001
    Maximize Browser Window
    Set Window Size    1920    1080
    Sleep    ${DELAY}
    Go To    ${BASE_URL}
    Wait Until Location Contains    practicetestautomation.com    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_1}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_1}     ${TIMEOUT}
    Click Element    ${ELEMENT_1}
    Go To    ${PRACTICE_URL}
    Wait Until Location Contains    /practice/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_2}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_2}     ${TIMEOUT}
    Click Element    ${ELEMENT_2}
    Go To    ${COURSES_URL}
    Wait Until Location Contains    /courses/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_3}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_3}     ${TIMEOUT}
    Click Element    ${ELEMENT_3}
    Go To    ${BLOG_URL}
    Wait Until Location Contains    /blog/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_4}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_4}     ${TIMEOUT}
    Click Element    ${ELEMENT_4}
    Go To    ${CONTACT_URL}
    Wait Until Location Contains    /contact/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_5}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_5}     ${TIMEOUT}
    Input Text    ${ELEMENT_5}     ${VALUE_161_VALUE}
    Wait Until Element Is Visible    ${ELEMENT_6}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_6}     ${TIMEOUT}
    Input Text    ${ELEMENT_6}     L
    Wait Until Element Is Visible    ${ELEMENT_7}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_7}     ${TIMEOUT}
    Input Text    ${ELEMENT_7}     ${VALUE_161_VALUE}
    Wait Until Element Is Visible    ${ELEMENT_8}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_8}     ${TIMEOUT}
    Input Text    ${ELEMENT_8}     ${EMAIL}
