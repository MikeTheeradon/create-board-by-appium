*** Settings ***
Library     AppiumLibrary
Test Teardown     Close Application

*** Test Cases ***
open youtube
    open device
    open app
    #sign up
    #login app
    create board

*** Keywords ***
open device
    Open Application        http://localhost:4723/wd/hub
    ...                     appium:deviceName=Test Device    
    ...                     appium:platformVersion=15.0    
    ...                     platformName=Android
    ...                     automationName=UiAutomator2

open app
    Click Element                    accessibility_id=Trello

sign up
    Wait Until Element Is Visible     xpath=//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View[2]/android.widget.Button
    Click Element                     xpath=//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View[2]/android.widget.Button
    Wait Until Element Is Visible     id=com.trello:id/google_auth
    Click Element                     id=com.trello:id/google_auth 
    # Wait Until Element Is Visible     id=com.android.chrome:id/signin_fre_continue_button #กดยืนยันGmail ครั้งเดียว
    # Click Element                     id=com.android.chrome:id/signin_fre_continue_button
    # Wait Until Element Is Visible     id=com.android.chrome:id/button_primary
    # Click Element                     id=com.android.chrome:id/button_primary  
    Sleep    6
    Click Element                      xpath=//android.view.View[@content-desc="Mike Theeradon theeradon.mth@gmail.com"]
    Click Element                      xpath=//android.widget.Button[@text="Continue"]
    Click Element                      id=login-submit  
    Click Element                      id=recaptcha-anchor     
    Click Element                      id=login-submit
    Click Element                      id=login-submit
    #finish
 
login app
    Wait Until Element Is Visible     xpath=//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View[3]/android.widget.Button
    Click Element                     xpath=//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View[3]/android.widget.Button
    Click Element                     id=com.trello:id/google_auth
    Wait Until Element Is Visible     xpath=//android.view.View[@content-desc="Mike Theeradon theeradon.mth@gmail.com"]
    Click Element                     xpath=//android.view.View[@content-desc="Mike Theeradon theeradon.mth@gmail.com"]
    Sleep    10
    Click Element                     xpath=//android.widget.Button[@resource-id="login-submit"]

create board                        
    Wait Until Element Is Visible       accessibility_id=Create board
    Click Element                       accessibility_id=Create board 
    Wait Until Element Is Visible       id=com.trello:id/board_name
    Input Text                          id=com.trello:id/board_name    Software testing
    Click Element                       id=com.trello:id/background_preview 
    Wait Until Element Is Visible       id=com.trello:id/image
    Click Element                       id=com.trello:id/image
    Wait Until Element Is Visible       accessibility_id=lime
    Click Element                       accessibility_id=lime
    Wait Until Element Is Visible       id=com.trello:id/create_board_button
    Click Element                       id=com.trello:id/create_board_button
    Press Key Code    3