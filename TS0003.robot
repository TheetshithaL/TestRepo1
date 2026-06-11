*** Settings ***
Documentation     TS0003 Automated Test Suite
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
${CONTACT_URL}           https://practicetestautomation.com/contact/
${BLOG_URL}           https://practicetestautomation.com/blog/
${COURSES_URL}           https://practicetestautomation.com/courses/
${PRACTICE_URL}           https://practicetestautomation.com/practice/
${ELEMENT_1}           link=Contact
${ELEMENT_2}           link=Blog
${ELEMENT_3}           link=Courses
${ELEMENT_4}           link=Practice


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
        Call Method    ${options}    add_argument    --user-data-dir\=/tmp/chrome_98b9c72d147a4588a6fb379080af04a3
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

TS0003
    [Documentation]    TS0003
    Maximize Browser Window
    Set Window Size    1920    1080
    Sleep    ${DELAY}
    Go To    ${BASE_URL}
    Wait Until Location Contains    practicetestautomation.com    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_1}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_1}     ${TIMEOUT}
    Click Element    ${ELEMENT_1} 
    Go To    ${CONTACT_URL} 
    Wait Until Location Contains    /contact/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_2}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_2}     ${TIMEOUT}
    Click Element    ${ELEMENT_2} 
    Go To    ${BLOG_URL} 
    Wait Until Location Contains    /blog/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_3}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_3}     ${TIMEOUT}
    Click Element    ${ELEMENT_3} 
    Go To    ${COURSES_URL} 
    Wait Until Location Contains    /courses/    ${TIMEOUT}
    Wait Until Element Is Visible    ${ELEMENT_4}     ${TIMEOUT}
    Wait Until Element Is Enabled    ${ELEMENT_4}     ${TIMEOUT}
    Click Element    ${ELEMENT_4} 
    Go To    ${PRACTICE_URL} 
    Wait Until Location Contains    /practice/    ${TIMEOUT}
