#!/usr/bin/osascript

#
# Usage:
#
#     ./add_text.scpt TEXTTOADD HORIZONTALOFFSET VERTICALOFFSET [NEW_SLIDE_MASTER_SLIDE_NAME] [TITLE_OF_THE_NEW_SLIDE]
#
#        ARG1 : TEXTTOADD        (e.g. "My conclusion of the slide is that this is AWESOME")
#        ARG2 : HORIZONTALOFFSET (e.g. 45)
#        ARG3 : VERTICALOFFSET   (e.g. 145)
#        ARG4 (optional): Provide the master slide name if wish to create a new slide before adding image
#        ARG5 (optional): Title of the new slide
#
#     If the image's desired height and width ratio is not the same as the original image, then IMAGEHEIGHT dictates
#

on run argv

    if (count of argv) > 2 then
        set thisText to item 1 of argv
        set horizontalOffset to item 2 of argv
        set verticalOffset to item 3 of argv

        set createNewSlide to false
        set newMasterSlideName to ""
        if (count of argv) > 3 then
            set createNewSlide to true
            set newMasterSlideName to item 4 of argv
        end if

        set setNewSlideTitle to false
        set newMasterSlideTitle to ""
        if (count of argv) > 4 then
            set setNewSlideTitle to true
            set newMasterSlideTitle to item 5 of argv
        end if

        tell application "Keynote"
            activate
            if playing is true then tell the front document to stop
            
            if not (exists document 1) then
                set thisDocument to make new document
                set thisSlide to the first slide of thisDocument
                set the base slide of thisSlide to master slide "Blank" of thisDocument
            else
                tell front document
                    if createNewSlide is true then
                        set thisSlide to make new slide with properties ¬
                            {base slide:master slide newMasterSlideName}
                        if setNewSlideTitle is true then
                            tell thisSlide
                                set the object text of default title item to newMasterSlideTitle
                            end tell
                        end if
                    else
                        set thisSlide to current slide
                    end if
                end tell
            end if
            my addTextToSlideV2(thisSlide, thisText, horizontalOffset, verticalOffset)
        end tell
    end if
end run

on addTextToSlideV2(thisSlide, thisText, horizontalOffset, verticalOffset)
    tell application "Keynote"
        try
            activate
            tell thisSlide
                set thisTextItem to make new text item with properties {object text:thisText}
                tell thisTextItem
                    set the size of its object text to 21
                    copy its width to horizontalWidth
                    set its position to {horizontalOffset - horizontalWidth / 2, verticalOffset}
                end tell
            end tell
        on error errorMessage number errorNumber
            if errorNumber is not -128 then
                display alert errorNumber message errorMessage
            end if
            error number -128
        end try
    end tell
end addImageFileToSlideV2

