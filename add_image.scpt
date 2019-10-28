#!/usr/bin/osascript

#
# Usage:
#
#     ./add_image.scpt PATH_TO_PDF IMAGEWIDTH IMAGEHEIGHT HORIZONTALOFFSET VERTICALOFFSET [NEW_SLIDE_MASTER_SLIDE_NAME] [TITLE_OF_THE_NEW_SLIDE]
#
#        ARG1 : PATH_TO_PDF      (e.g. /home/users/me/plot.pdf)
#        ARG2 : IMAGEWIDTH       (e.g. 400)
#        ARG3 : IMAGEHEIGHT      (e.g. 300)
#        ARG4 : HORIZONTALOFFSET (e.g. 45)
#        ARG5 : VERTICALOFFSET   (e.g. 145)
#        ARG6 (optional): Provide the master slide name if wish to create a new slide before adding image
#        ARG7 (optional): Title of the new slide
#
#     If the image's desired height and width ratio is not the same as the original image, then IMAGEHEIGHT dictates
#

on run argv

    if (count of argv) > 4 then
        set thisImageFile to POSIX file (item 1 of argv) as alias
        set newImageWidth to item 2 of argv
        set newImageHeight to item 3 of argv
        set horizontalOffset to item 4 of argv
        set verticalOffset to item 5 of argv

        set createNewSlide to false
        set newMasterSlideName to ""
        if (count of argv) > 5 then
            set createNewSlide to true
            set newMasterSlideName to item 6 of argv
        end if

        set setNewSlideTitle to false
        set newMasterSlideTitle to ""
        if (count of argv) > 6 then
            set setNewSlideTitle to true
            set newMasterSlideTitle to item 7 of argv
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
            my addImageFileToSlideV2(thisSlide, thisImageFile, newImageWidth, newImageHeight, horizontalOffset, verticalOffset)
        end tell
    end if
end run

on addImageFileToSlideV2(thisSlide, thisImageFile, newImageWidth, newImageHeight, horizontalOffset, verticalOffset)
    tell application "Keynote"
        try
            activate
            tell thisSlide
                set thisImage to make new image with properties ¬
                    {file:thisImageFile ¬
                        , width:newImageWidth ¬
                        , height:newImageHeight ¬
                        , position:{horizontalOffset, verticalOffset}}
            end tell
        on error errorMessage number errorNumber
            if errorNumber is not -128 then
                display alert errorNumber message errorMessage
            end if
            error number -128
        end try
    end tell
end addImageFileToSlideV2

