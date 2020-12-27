local surface = require "gamesense/surface"
local MainFont = surface.create_font("JosefinSans-VariableFont_wght", 26, 900, 0x010)
local TabFont = surface.create_font("JosefinSans-VariableFont_wght", 17, 600, 0x010)
local InSubFont = surface.create_font("JosefinSans-VariableFont_wght", 10, 500, 0x010)
local WeaponFont = surface.create_font("astriumwep", 21, 1, 0x010)
local xpos = 200
local ypos = 200
local opac = 0
local bpac = 0
local lpac = 0 
local gpac = 30

local RageReference = {

}

local VisualReference = {

}

local MiscReference = {
    MenuKey = ui.reference("MISC", "Settings", "Menu key")
}

local InventoryReference = {

}

local LegitReference = {

}






local startpos = {      
DRegionx = 0, DRegiony = 0,
AxNav = 160, AyNav = 37,                                --First letter (uppercase) defines row (example: A = ActiveTab)                                             
Ax1 = 160, Ay1 = 37,                                    --Second letter (lowercase) defines axis (example: Ax = ActiveTab, x axis)                                  
Ax2 = 222, Ay2 = 37,                                    --Third digit defines item (example: Ax1 = ActiveTab, x axis, RAGE)                                         
Ax3 = 303, Ay3 = 37,                                                                                                                                                
Ax4 = 356, Ay4 = 37,
Ax5 = 462, Ay5 = 37,

Bx1 = 17, By1 = 98,

Cx1 = 52, Cy1 = 144
}

local endpos = {
DRegionx = 800, DRegiony = 30,
AxNav = 508, AyNav = 50,
Ax1 = 206, Ay1 = 50,
Ax2 = 288, Ay2 = 50,
Ax3 = 341, Ay3 = 50,
Ax4 = 446, Ay4 = 50,
Ax5 = 508, Ay5 = 50,


Bx1 = 107, By1 = 130,

Cx1 = 110, Cy1 = 163
}

local MenuIndc = {                                          --middle pos of all ActiveTab lines. (ex. Ax01)
Ax01 = 159, Ay01 = 55, Ax11 = 207, Ay11 = 55,               --(end position line - start position line) : 2 + start position line
Ax02 = 255, Ay02 = 55, Ax12 = 255, Ay12 = 55,
Ax03 = 322, Ay03 = 55, Ax13 = 322, Ay13 = 55,
Ax04 = 401, Ay04 = 55, Ax14 = 401, Ay14 = 55,
Ax05 = 485, Ay05 = 55, Ax15 = 485, Ay15 = 55


}


HoverA = false  
gstateb = false
CheckMState = false

RAGEop = 30
VISUALSop = 30
MISCop = 30
INVENTORYop = 30
LEGITop = 30

ActiveTab = "RAGE"
ActiveSubTab = "AIMBOT"
ActiveHover = "NONE"

switch = function(check)                                        --P4ST3D FR0M https://pastebin.com/MxhirT7Z
    return function(cases)
        if type(cases[check]) == "function" then
            return cases[check]()
        elseif type(cases["default"] == "function") then
            return cases["default"]()
        end
    end
end


local function BackgroundAnimation()
    if bpac == 255 then
        return
    else
        bpac = bpac + 15
    end
end


local function MenuAnimation()
    if opac == 200 then
        return
    else
        opac = opac + 5
    end
end

local function ElementAnimation()
    if lpac == 102 then
        return
    else    
        lpac = lpac + 3
    end
end

local function GradientAnimation()

    if gstateb == false then
            gpac = gpac + 0.20

    elseif gstateb == true then
            gpac = gpac - 0.20
    end
end

local function CheckAnimState()                 

    if SelectChangedA == false and HoverA == false then
        return
    else
        if SelectChangedA == true then
            client.color_log(123, 194, 21, ActiveTab)
            
            switch(ActiveTab) {
                
                RAGE = function()
                    if MenuIndc.Ax01 == 159 and MenuIndc.Ax02 == 255 and MenuIndc.Ax03 == 322 and MenuIndc.Ax04 == 401 and MenuIndc.Ax05 == 485 then
                        SelectChangedA = false
                    else

                        if MenuIndc.Ax02 <= 254 then
                            MenuIndc.Ax02 = MenuIndc.Ax02 + 1
                            MenuIndc.Ax12 = MenuIndc.Ax12 - 1
                        end

                        if MenuIndc.Ax03 <= 321 then
                            MenuIndc.Ax03 = MenuIndc.Ax03 + 1
                            MenuIndc.Ax13 = MenuIndc.Ax13 - 1
                        end

                        if MenuIndc.Ax04 <= 400 then
                            MenuIndc.Ax04 = MenuIndc.Ax04 + 1
                            MenuIndc.Ax14 = MenuIndc.Ax14 - 1
                        end

                        if MenuIndc.Ax05 <= 484 then
                            MenuIndc.Ax05 = MenuIndc.Ax05 + 1
                            MenuIndc.Ax15 = MenuIndc.Ax15 - 1
                        end

                    end
                end,
                
                VISUALS = function() 
                    if MenuIndc.Ax01 == 183 and MenuIndc.Ax02 == 221 and MenuIndc.Ax03 == 322 and MenuIndc.Ax04 == 401 and MenuIndc.Ax05 == 485 then
                        SelectChangedA = false
                    else

                        if MenuIndc.Ax01 <= 182 then
                            MenuIndc.Ax01 = MenuIndc.Ax01 + 1
                            MenuIndc.Ax11 = MenuIndc.Ax11 - 1
                        end

                        if MenuIndc.Ax03 <= 321 then
                            MenuIndc.Ax03 = MenuIndc.Ax03 + 1
                            MenuIndc.Ax13 = MenuIndc.Ax13 - 1
                        end

                        if MenuIndc.Ax04 <= 400 then
                            MenuIndc.Ax04 = MenuIndc.Ax04 + 1
                            MenuIndc.Ax14 = MenuIndc.Ax14 - 1
                        end

                        if MenuIndc.Ax05 <= 484 then
                            MenuIndc.Ax05 = MenuIndc.Ax05 + 1
                            MenuIndc.Ax15 = MenuIndc.Ax15 - 1
                        end

                    end
                end,
        
                MISC = function()
                    if MenuIndc.Ax01 == 183 and MenuIndc.Ax02 == 255 and MenuIndc.Ax03 == 322 and MenuIndc.Ax04 == 401 and MenuIndc.Ax05 == 485 then
                        SelectChangedA = false
                    else

                        if MenuIndc.Ax01 <= 182 then
                            MenuIndc.Ax01 = MenuIndc.Ax01 + 1
                            MenuIndc.Ax11 = MenuIndc.Ax11 - 1
                        end

                        if MenuIndc.Ax02 <= 254 then
                            MenuIndc.Ax02 = MenuIndc.Ax02 + 1
                            MenuIndc.Ax12 = MenuIndc.Ax12 - 1
                        end

                        if MenuIndc.Ax04 <= 400 then
                            MenuIndc.Ax04 = MenuIndc.Ax04 + 1
                            MenuIndc.Ax14 = MenuIndc.Ax14 - 1
                        end

                        if MenuIndc.Ax05 <= 484 then
                            MenuIndc.Ax05 = MenuIndc.Ax05 + 1
                            MenuIndc.Ax15 = MenuIndc.Ax15 - 1
                        end

                    end
                end,
            
                INVENTORY = function()
                    if MenuIndc.Ax01 == 183 and MenuIndc.Ax02 == 255 and MenuIndc.Ax03 == 322 and MenuIndc.Ax04 == 355 and MenuIndc.Ax05 == 485 then
                        SelectChangedA = false
                    else
                        
                        if MenuIndc.Ax01 <= 182 then
                            MenuIndc.Ax01 = MenuIndc.Ax01 + 1
                            MenuIndc.Ax11 = MenuIndc.Ax11 - 1
                        end

                        if MenuIndc.Ax02 <= 254 then
                            MenuIndc.Ax02 = MenuIndc.Ax02 + 1
                            MenuIndc.Ax12 = MenuIndc.Ax12 - 1
                        end

                        if MenuIndc.Ax03 <= 321 then
                            MenuIndc.Ax03 = MenuIndc.Ax03 + 1
                            MenuIndc.Ax13 = MenuIndc.Ax13 - 1
                        end

                        if MenuIndc.Ax05 <= 484 then
                            MenuIndc.Ax05 = MenuIndc.Ax05 + 1
                            MenuIndc.Ax15 = MenuIndc.Ax15 - 1
                        end
                    end
                end,
                    
                LEGIT = function()
                    if MenuIndc.Ax01 == 183 and MenuIndc.Ax02 == 255 and MenuIndc.Ax03 == 322 and MenuIndc.Ax04 == 401 and MenuIndc.Ax05 == 461 then
                        SelectChangedA = false
                    else

                        if MenuIndc.Ax01 <= 182 then
                            MenuIndc.Ax01 = MenuIndc.Ax01 + 1
                            MenuIndc.Ax11 = MenuIndc.Ax11 - 1
                        end

                        if MenuIndc.Ax02 <= 254 then
                            MenuIndc.Ax02 = MenuIndc.Ax02 + 1
                            MenuIndc.Ax12 = MenuIndc.Ax12 - 1
                        end

                        if MenuIndc.Ax03 <= 321 then
                            MenuIndc.Ax03 = MenuIndc.Ax03 + 1
                            MenuIndc.Ax13 = MenuIndc.Ax13 - 1
                        end

                        if MenuIndc.Ax04 <= 400 then
                            MenuIndc.Ax04 = MenuIndc.Ax04 + 1
                            MenuIndc.Ax14 = MenuIndc.Ax14 - 1
                        end

                    end
                end   
            }
        end

        if HoverA == true then
            switch(ActiveHover) {

                RAGE = function() 

                    if VISUALSop >= 32 then
                        VISUALSop = VISUALSop - 3
                    elseif MISCop >= 32 then
                        MISCop = MISCop - 3
                    elseif INVENTORYop >= 32 then
                        INVENTORYop = INVENTORYop - 3
                    elseif LEGITop >= 32 then
                        LEGITop = LEGITop - 3
                    end
                end,

                VISUALS = function() 

                    if RAGEop >= 32 then
                        RAGEop = RAGEop - 3
                    elseif MISCop >= 32 then
                        MISCop = MISCop - 3
                    elseif INVENTORYop >= 32 then
                        INVENTORYop = INVENTORYop - 3
                    elseif LEGITop >= 32 then
                        LEGITop = LEGITop - 3
                    end
                end,

                MISC = function() 

                    if RAGEop >= 32 then
                        RAGEop = RAGEop - 3
                    elseif VISUALSop >= 32 then
                        VISUALSop = VISUALSop - 3
                    elseif INVENTORYop >= 32 then
                        INVENTORYop = INVENTORYop - 3
                    elseif LEGITop >= 32 then
                        LEGITop = LEGITop - 3
                    end
                end,

                INVENTORY = function() 

                    if RAGEop >= 32 then
                        RAGEop = RAGEop - 3
                    elseif VISUALSop >= 32 then
                        VISUALSop = VISUALSop - 3
                    elseif MISCop >= 32 then
                        MISCop = MISCop - 3
                    elseif LEGITop >= 32 then
                        LEGITop = LEGITop - 3
                    end
                end,

                LEGIT = function() 

                    if RAGEop >= 32 then
                        RAGEop = RAGEop - 3
                    elseif VISUALSop >= 32 then
                        VISUALSop = VISUALSop - 3
                    elseif MISCop >= 32 then
                        MISCop = MISCop - 3
                    elseif INVENTORYop >= 32 then
                        INVENTORYop = INVENTORYop - 3
                    end
                end,

                NONE = function()

                    if RAGEop >= 32 then
                        RAGEop = RAGEop - 3
                    elseif VISUALSop >= 32 then
                        VISUALSop = VISUALSop - 3
                    elseif MISCop >= 32 then
                        MISCop = MISCop - 3
                    elseif INVENTORYop >= 32 then
                        INVENTORYop = INVENTORYop - 3
                    elseif LEGITop >= 32 then
                        LEGITop = LEGITop - 3
                    end
                end
            }
        end
    end    
end

local function MainHover()

    if HoverA == true then
        CheckAnimState()    
        switch(ActiveHover) {

            RAGE = function() 
                
                if ActiveTab == RAGE or RAGEop >= 254 then
                    return
                else

                RAGEop = RAGEop + 3
                end
            end,

            VISUALS = function() 
                
                if ActiveTab == VISUALS or VISUALSop >= 254 then
                    return
                else

                    VISUALSop = VISUALSop + 3
                end
            end,

            MISC = function() 
                
                if ActiveTab == MISC or MISCop >= 254 then
                    return
                else

                    MISCop = MISCop + 3
                end
            end,

            INVENTORY = function() 
                
                if ActiveTab == INVENTORY or INVENTORYop >= 254 then
                    return
                else

                    INVENTORYop = INVENTORYop + 3
                end
            end,

            LEGIT = function() 
                
                if ActiveTab == LEGIT or LEGITop >= 254 then
                    return
                else

                    LEGITop = LEGITop + 3
                end
            end,

            NONE = function()
                return
            end
        }
    
    elseif HoverA == false then

        if RAGEop >= 32 then
            RAGEop = RAGEop - 3
        elseif VISUALSop >= 32 then
            VISUALSop = VISUALSop - 3
        elseif MISCop >= 32 then
            MISCop = MISCop - 3
        elseif INVENTORYop >= 32 then
            INVENTORYop = INVENTORYop - 3
        elseif LEGITop >= 32 then
            LEGITop = LEGITop - 3
        end
    end
end


local function Dragging()
    xpos = rawmouseposX - mouseposX 
    ypos = rawmouseposY - mouseposY

end

local function HoverAnimationA()

    if mouseposY >= startpos.Ay1 and mouseposY <= endpos.Ay1 and mouseposX >= startpos.Ax1 and mouseposX <= endpos.Ax1 then
        ActiveHover = "RAGE"

    elseif mouseposY >= startpos.Ay2 and mouseposY <= endpos.Ay2 and mouseposX >= startpos.Ax2 and mouseposX <= endpos.Ax2 then
        ActiveHover = "VISUALS"

    elseif mouseposY >= startpos.Ay3 and mouseposY <= endpos.Ay3 and mouseposX >= startpos.Ax3 and mouseposX <= endpos.Ax3 then
        ActiveHover = "MISC"

    elseif mouseposY >= startpos.Ay4 and mouseposY <= endpos.Ay4 and mouseposX >= startpos.Ax4 and mouseposX <= endpos.Ax4 then
        ActiveHover = "INVENTORY"

    elseif mouseposY >= startpos.Ay5 and mouseposY <= endpos.Ay5 and mouseposX >= startpos.Ax5 and mouseposX <= endpos.Ax5 then
        ActiveHover = "LEGIT"

    else
        ActiveHover = "NONE"

    end

end

local function ChangeActiveTab()

    switch(ActiveHover) {
        RAGE = function() 
            if ActiveTab == RAGE then
                return
            else
                SelectChangedA = true
                ActiveTab = "RAGE"
            end
        end,

        VISUALS = function() 

            if ActiveTab == VISUALS then
                return
            else
                SelectChangedA = true
                ActiveTab = "VISUALS"
            end
        end,

        MISC = function() 

            if ActiveTab == MISC then
                return
            else
                SelectChangedA = true
                ActiveTab = "MISC"
            end
        end,

        INVENTORY = function() 

            if ActiveTab == INVENTORY then
                return
            else
                SelectChangedA = true
                ActiveTab = "INVENTORY"
            end
        end,

        LEGIT = function() 

            if ActiveTab == LEGIT then
                return
            else
                SelectChangedA = true
                ActiveTab = "LEGIT"
            end
        end,

        NONE = function()
            return
        end
    }

    CheckMState = true 
end



local function ClickAnimationA()
    
    switch(ActiveTab) {
        RAGE = function()
            if MenuIndc.Ax01 == 159 and MenuIndc.Ax11 == 207 then
                return
            else
                MenuIndc.Ax01 = MenuIndc.Ax01 - 1
                MenuIndc.Ax11 = MenuIndc.Ax11 + 1
            end
        end,
        
        VISUALS = function() 
            if MenuIndc.Ax02 == 221 and MenuIndc.Ax12 == 289 then
                return
            else
                MenuIndc.Ax02 = MenuIndc.Ax02 - 1
                MenuIndc.Ax12 = MenuIndc.Ax12 + 1
            end
        end,

        MISC = function()
            if MenuIndc.Ax03 == 302 and MenuIndc.Ax13 == 342 then
                return
            else
                MenuIndc.Ax03 = MenuIndc.Ax03 - 1
                MenuIndc.Ax13 = MenuIndc.Ax13 + 1
            end
        end,
    
        INVENTORY = function()
            if MenuIndc.Ax04 == 355 and MenuIndc.Ax14 == 447 then
                return
            else
                MenuIndc.Ax04 = MenuIndc.Ax04 - 1
                MenuIndc.Ax14 = MenuIndc.Ax14 + 1
            end
        end,
            
        LEGIT = function()
            if MenuIndc.Ax05 == 461 and MenuIndc.Ax15 == 509 then
                return
            else
                MenuIndc.Ax05 = MenuIndc.Ax05 - 1
                MenuIndc.Ax15 = MenuIndc.Ax15 + 1
            end
        end
    }
end

--local function ClickAnimationB()
  --  switch(ActiveSubTab) {

 ----   }
--end

local function DrawMenu(x, y, w, h, r, g, b, a)
    surface.draw_outlined_rect(xpos - 1, ypos - 1, 802, 652, 59, 58, 100, bpac)
    surface.draw_filled_rect(xpos, ypos, 800, 650, 19, 14, 33, bpac)
    surface.draw_filled_rect(xpos, ypos, 800, 72, 29, 24, 63, opac)
    surface.draw_text(xpos + 15, ypos + 30, 255, 0, 0, 150, MainFont, "FATALITY")
    surface.draw_text(xpos + 17, ypos + 32, 0, 0, 255, 150, MainFont, "FATALITY")
    surface.draw_text(xpos + 16, ypos + 31, 255, 255, 255, 255, MainFont, "FATALITY")
    surface.draw_filled_gradient_rect(xpos, ypos + 16, 800, 2, 59, 58, 255, gpac, 255, 0, 10, gpac, true)
    surface.draw_filled_rect(xpos, ypos, 800, 16, 29, 24, 63, bpac)
    surface.draw_text(xpos + 160, ypos + 37, 255, 255, 255, RAGEop, TabFont, "RAGE")
    surface.draw_text(xpos + 222, ypos + 37, 255, 255, 255, VISUALSop, TabFont, "VISUALS")
    surface.draw_text(xpos + 303, ypos + 37, 255, 255, 255, MISCop, TabFont, "MISC")
    surface.draw_text(xpos + 356, ypos + 37, 255, 255, 255, INVENTORYop, TabFont, "INVENTORY")
    surface.draw_text(xpos + 462, ypos + 37, 255, 255, 255, LEGITop, TabFont, "LEGIT")
    surface.draw_line(xpos + MenuIndc.Ax01, ypos + MenuIndc.Ay01, xpos + MenuIndc.Ax11, ypos + MenuIndc.Ay11, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax02, ypos + MenuIndc.Ay02, xpos + MenuIndc.Ax12, ypos + MenuIndc.Ay12, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax03, ypos + MenuIndc.Ay03, xpos + MenuIndc.Ax13, ypos + MenuIndc.Ay13, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax04, ypos + MenuIndc.Ay04, xpos + MenuIndc.Ax14, ypos + MenuIndc.Ay14, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax05, ypos + MenuIndc.Ay05, xpos + MenuIndc.Ax15, ypos + MenuIndc.Ay15, 210, 7, 91, opac)


    switch(ActiveTab) {

        RAGE = function()
            surface.draw_filled_rect(xpos + 15, ypos + 88, 770, 550, 29, 24, 63, lpac)
            surface.draw_outlined_rect(xpos + 15, ypos + 87, 772, 550, 59, 58, 100, opac)
            surface.draw_filled_rect(xpos + 15, ypos + 87, 772, 33, 59, 58, 100, opac)
            surface.draw_filled_rect(xpos + 16, ypos + 88, 770, 31, 29, 24, 63, bpac)
            surface.draw_text(xpos + 160, ypos + 37, 255, 255, 255, 255, TabFont, "RAGE")
            surface.draw_text(xpos + 30, ypos + 94, 255, 255, 255, 255, TabFont, "AIMBOT")
            surface.draw_text(xpos + 125, ypos + 96, 255, 255, 255, 30, TabFont, "ANTI-AIM")
            surface.draw_filled_rect(xpos + 16, ypos + 116, 90, 3, 210, 7, 91, bpac)
            surface.draw_text(xpos + 52, ypos + 144, 255, 255, 255, 255, WeaponFont, "Y")
            surface.draw_text(xpos + 140, ypos + 147, 255, 255, 255, 30, WeaponFont, "a")
            surface.draw_text(xpos + 225, ypos + 147, 255, 255, 255, 30, WeaponFont, "Z")
            surface.draw_text(xpos + 314, ypos + 147, 255, 255, 255, 30, WeaponFont, "J")
            surface.draw_text(xpos + 370, ypos + 147, 255, 255, 255, 30, WeaponFont, "G")
            surface.draw_text(xpos + 434, ypos + 147, 255, 255, 255, 30, WeaponFont, "W")
            surface.draw_filled_rect(xpos + 35, ypos + 190, 219, 398, 29, 24, 63, bpac)
            surface.draw_filled_rect(xpos + 271.5, ypos + 190, 219, 398, 29, 24, 63, bpac)
            surface.draw_filled_rect(xpos + 508, ypos + 148, 219, 330, 29, 24, 63, bpac)
            surface.draw_filled_rect(xpos + 508, ypos + 498, 219, 90, 29, 24, 63, bpac)
            surface.draw_outlined_rect(xpos + 35, ypos + 190, 219, 398, 59, 58, 100, opac)
            surface.draw_outlined_rect(xpos + 271.5, ypos + 190, 219, 398, 59, 58, 100, opac)
            surface.draw_outlined_rect(xpos + 508, ypos + 148, 219, 330, 59, 58, 100, opac)
            surface.draw_outlined_rect(xpos + 508, ypos + 498, 219, 90, 59, 58, 100, opac)

            if ActiveSubTab == "AIMBOT" then
                ActiveWeapon = "AUTO"


                switch(ActiveWeapon) {
                    AUTO = function()
                        surface.draw_filled_rect(xpos + 35, ypos + 175, 90, 3, 210, 7, 91, bpac)
                       -- client.color_log(123, 194, 21, "AUTO")
                    end,
                    
                    SCOUT = function()
                        surface.draw_filled_rect(xpos + 130, ypos + 175, 90, 3, 210, 7, 91, bpac)
                        client.color_log(123, 194, 21, "SCOUT")
                    end,

                    AWP = function()
                        surface.draw_filled_rect(xpos + 215, ypos + 175, 90, 3, 210, 7, 91, bpac)
                        client.color_log(123, 194, 21, "AWP")
                    end,

                    HEAVY = function()
                        surface.draw_filled_rect(xpos + 300, ypos + 175, 90, 3, 210, 7, 91, bpac)
                        client.color_log(123, 194, 21, "HEAVY")
                    end,

                    PISTOL = function()
                        surface.draw_filled_rect(xpos + 355, ypos + 175, 90, 3, 210, 7, 91, bpac)
                        client.color_log(123, 194, 21, "PISTOL")
                    end,

                    RIFLE = function()
                        surface.draw_filled_rect(xpos + 415, ypos + 175, 90, 3, 210, 7, 91, bpac)
                        client.color_log(123, 194, 21, "RIFLE")
                    end
                }
            end
        end,

        VISUALS = function() 
            surface.draw_text(xpos + 222, ypos + 37, 255, 255, 255, 255, TabFont, "VISUALS")
        end,

        MISC = function()
            surface.draw_text(xpos + 303, ypos + 37, 255, 255, 255, 255, TabFont, "MISC")
        end,

        INVENTORY = function()
            surface.draw_text(xpos + 356, ypos + 37, 255, 255, 255, 255, TabFont, "INVENTORY")
        end,
        
        LEGIT = function()
            surface.draw_text(xpos + 462, ypos + 37, 255, 255, 255, 255, TabFont, "LEGIT")
        end
    }
end 

local function OnFrame()    
    
    if ui.is_menu_open() then
        DrawMenu()
        MenuAnimation()
        ElementAnimation()
        BackgroundAnimation()
        GradientAnimation()
        MainHover()
        ClickAnimationA()
        CheckAnimState() 


        local LClick = client.key_state(0x01)
        local mousepos = { ui.mouse_position() }
        rawmouseposX = mousepos[1]
        rawmouseposY = mousepos[2]
        mouseposX = mousepos[1] - xpos
        mouseposY = mousepos[2] - ypos
        client.color_log(123, 194, 21, mouseposX)
        client.color_log(123, 194, 21, mouseposY)

        if LClick == true and CheckMState == false then
            ChangeActiveTab()

            if mouseposY >= startpos.DRegiony and mouseposY <= endpos.DRegiony and mouseposX >= startpos.DRegionx and mouseposX <= endpos.DRegionx then
                Dragging()
            end

        elseif LClick == false then
            CheckMState = false
        end

        if mouseposY >= startpos.AyNav and mouseposY <= endpos.AyNav and mouseposX >= startpos.AxNav and mouseposX <= endpos.AxNav then
            HoverA = true
            HoverAnimationA()
        else
            HoverA = false
            ActiveHover = "NONE"
        end

        if gpac >= 229.9 then
            gstateb = true
        end
    
        if gpac >= 29.9 and gpac <= 30.1 then
            gstateb = false
        end
    
    else
        opac = 0
        lpac = 0
        bpac = 0
        gpac = 30
        gstateb = false
        CheckMState = true
    end 
end

client.set_event_callback("paint_ui", OnFrame)
