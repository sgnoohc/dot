#!/usr/bin/osascript

on run argv

    if (count of argv) > 4 then
        set thisImageFile to POSIX file (item 1 of argv) as alias
        set newImageWidth to item 2 of argv
        set newImageHeight to item 3 of argv
        set horizontalOffset to item 4 of argv
        set verticalOffset to item 5 of argv

        set createNewSlide to false
        if (count of argv) > 5 then
            set createNewSlide to true
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
                            {base slide:master slide "VVV Main"}
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

