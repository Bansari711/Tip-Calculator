# Pre-work - *TipCalcy*

**TipCalcy** is a tip calculator application for iOS.

Submitted by: **Bansari Patel**

Time spent: **18** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] Creating the Tip Calculator
- [x] implement both the TipViewController and the SettingsViewController?
- [x] Loading and Saving via plist
- [x] Settings page to change the default tip percentage.
- [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
- [x] UI animations
- [ ] Remembering the bill amount across app restarts (if <10mins)
- [x] Using locale-specific currency and currency thousands separators.
- [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] User can set no of people to share the bill amount. 
- [x] User can save the default tip percentage settings or custom tip percentage settings through tip-settings page
- [x] User can change application gradient background and save selected background

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/rpat0Km.gifv' title='Video Walkthrough' width='' alt='Video Walkthrough' /></a>

Background of the application looks different in GIF than original application.

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:**:
- I found iOS app development very interesting and easy using XCode. Because of amazing features in XCode, building an iOS app is a fun task. Easy to design an awesome application.
- Properties of the controls can be changed using outlets. For example, if you want to change the text, size, background, etc. of the label control, then outlet of that label is used. while action is used for an event to trigger code. If user do something, then that user action is handled with action. For Example, when user press the button then action code would be executed to handle button press event.
- Storyboard is basically an XML file. Inside ViewController tag, there will be a list of control tags which we have placed on storyboard. If we have created an outlet for any control, it would be created as an outlet tag inside 'connections' tag. Outlet tag has properties, destination and id attributes. Properties attribute contains the name of the outlet given by developer. If we have created an action for any control, it would be created as an action tag inside Control tag -> connections tag. Action tag has selector, destination, eventType and id attributes. 'eventType' attribute contains the name of the event which should be performed to handle user action. For example, 'touchUpInside', 'editingChanged', 'valueChanged', etc.

**Question 2**: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** 

- If you assign a closure to a property of a class instance, and the body of that closure captures the instance. This capture might occur because the closure’s body accesses a property of the instance  or because the closure calls a method on the instance. In either case, these accesses cause the closure to “capture” self, creating a strong reference cycle.

## License

    Copyright [2017] [Bansari Patel]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
