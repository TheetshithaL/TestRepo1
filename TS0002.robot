*** Settings ***
Documentation     TS0002 Automated Test Suite
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
${BLOG_URL}           https://practicetestautomation.com/blog/
${CONTACT_URL}           https://practicetestautomation.com/contact/
${ELEMENT_1}           link=Blog
${ELEMENT_2}           link=Contact
${ELEMENT_3}           id=wpforms-161-field_0-last
${ELEMENT_4}           id=wpforms-161-field_0
${ELEMENT_5}           id=wpforms-161-field_1


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
        Call Method    ${options}    add_argument    --user-data-dir\=/tmp/chrome_e61416a82ce444c0a59995cc00c5da26
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

TS0002
    [Documentation]    TS0002
    Maximize Browser Window
    Set Window Size    1920    1080
    Sleep    ${DELAY}
    Go To    ${BASE_URL}
    Wait Until Location Contains    practicetestautomation.com    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_1}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_1}     ${TIMEOUT}
    Click Element    ${ELEMENT_1}
    Go To    ${BLOG_URL}
    Wait Until Location Contains    /blog/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_2}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_2}     ${TIMEOUT}
    Click Element    ${ELEMENT_2}
    Go To    ${CONTACT_URL}
    Wait Until Location Contains    /contact/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_3}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_3}     ${TIMEOUT}
    Input Text    ${ELEMENT_3}     heloo
    Wait Until Element Is Visible    ${ELEMENT_4}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_4}     ${TIMEOUT}
    Input Text    ${ELEMENT_4}     hi
    Wait Until Element Is Visible    ${ELEMENT_5}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_5}     ${TIMEOUT}
    Input Text    ${ELEMENT_5}     jjakakaa
