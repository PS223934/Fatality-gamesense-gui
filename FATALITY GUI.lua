local surface = require "gamesense/surface"
local MainFont = surface.create_font("JosefinSans-VariableFont_wght", 28, 700, 0x010)
local TabFont = surface.create_font("JosefinSans-VariableFont_wght", 18, 600, 0x010)
local WeaponFont = surface.create_font("astriumwep", 21, 1, 0x010)
local xpos = 200
local ypos = 200
local opac = 0
local bpac = 0
local lpac = 0
                                                                                                                --Menuindc.Ax01/2 = 184
local startpos = {
AxNav = 160, AyNav = 32,
Ax1 = 160, Ay1 = 32,
Ax2 = 230, Ay2 = 32,
Ax3 = 320, Ay3 = 32,
Ax4 = 380, Ay4 = 32,
Ax5 = 492, Ay5 = 32,

Bx1 = 17, By1 = 98,

Cx1 = 52, Cy1 = 144
}

local endpos = {
AxNav = 540, AyNav = 47,
Ax1 = 210, Ay1 = 47,
Ax2 = 303, Ay2 = 47,
Ax3 = 360, Ay3 = 47,
Ax4 = 477, Ay4 = 47,
Ax5 = 540, Ay5 = 47,


Bx1 = 107, By1 = 130,

Cx1 = 110, Cy1 = 163
}

local MenuIndc = {
Ax01 = 159, Ay01 = 50, Ax11 = 209, Ay11 = 50,
Ax02 = 267, Ay02 = 50, Ax12 = 267, Ay12 = 50,
Ax03 = 341, Ay03 = 50, Ax13 = 341, Ay13 = 50,
Ax04 = 428, Ay04 = 50, Ax14 = 428, Ay14 = 50,
Ax05 = 515, Ay05 = 50, Ax15 = 515, Ay15 = 50


}



HoverA = false  

RAGEop = 30
VISUALSop = 30
MISCop = 30
INVENTORYop = 30
LEGITop = 30

ActiveTab = "RAGE"
ActiveSubTab = "AIMBOT"
ActiveHover = "NONE"


switch = function(check)
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
    if opac == 175 then
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


local function CheckHoverState()
    
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

local function MainHover()

    if HoverA == true then

        CheckHoverState()

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

        CheckHoverState()

        switch(ActiveHover) {

            RAGE = function() 
                if ActiveTab == RAGE or RAGEop <= 33 then
                    return
                else

                    RAGEop = RAGEop - 3
                end
            end,

            VISUALS = function() 
                if ActiveTab == VISUALS or VISUALSop <= 33 then
                    return
                else

                    VISUALSop = VISUALSop - 3
                end
            end,

            MISC = function() 
                if ActiveTab == MISC or MISCop <= 33 then
                    return
                else

                    MISCop = MISCop - 3
                end
            end,

            INVENTORY = function() 
                if ActiveTab == INVENTORY or INVENTORYop <= 33 then
                    return
                else

                    INVENTORYop = INVENTORYop - 3
                end
            end,

            LEGIT = function() 
                if ActiveTab == LEGIT or LEGITop <= 33 then
                    return
                else

                    LEGITop = LEGITop - 3
                end
            end,

            NONE = function()
                return
            end
        }
    end
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
                ActiveTab = "RAGE"
              --  MenuIndc.Ax01 = 184,5
            end
        end,

        VISUALS = function() 
            if ActiveTab == VISUALS then
                return
            else
                ActiveTab = "VISUALS"
            end
        end,

        MISC = function() 
            if ActiveTab == MISC then
                return
            else
                ActiveTab = "MISC"
            end
        end,

        INVENTORY = function() 
            if ActiveTab == INVENTORY then
                return
            else
                ActiveTab = "INVENTORY"
            end
        end,

        LEGIT = function() 
            if ActiveTab == LEGIT then
                return
            else
                ActiveTab = "LEGIT"
            end
        end,

        NONE = function()
            return
        end
    }
end

local function ClickAnimationA()
    switch(ActiveTab) {
        RAGE = function()
            if MenuIndc.Ax01 == 159 and MenuIndc.Ax11 == 209 then
                return
            else
                MenuIndc.Ax01 = MenuIndc.Ax01 - 1
                MenuIndc.Ax11 = MenuIndc.Ax11 + 1
            end
        end,
        
        VISUALS = function() 
            if MenuIndc.Ax02 == 229.5 and MenuIndc.Ax12 == 302 then
                return
            else
                MenuIndc.Ax02 = MenuIndc.Ax02 - 1
                MenuIndc.Ax12 = MenuIndc.Ax12 + 1
            end
        end,

        MISC = function()
            if MenuIndc.Ax03 == 319 and MenuIndc.Ax13 == 359 then
                return
            else
                MenuIndc.Ax03 = MenuIndc.Ax03 - 1
                MenuIndc.Ax13 = MenuIndc.Ax13 + 1
            end
        end,
    
        INVENTORY = function()
            if MenuIndc.Ax04 == 379.5 and MenuIndc.Ax14 == 476 then
                return
            else
                MenuIndc.Ax04 = MenuIndc.Ax04 - 1
                MenuIndc.Ax14 = MenuIndc.Ax14 + 1
            end
        end,
            
        LEGIT = function()
            if MenuIndc.Ax05 == 491 and MenuIndc.Ax15 == 539 then
                return
            else
                MenuIndc.Ax05 = MenuIndc.Ax05 - 1
                MenuIndc.Ax15 = MenuIndc.Ax15 + 1
            end
        end
    }
end

local function DrawMenu(x, y, w, h, r, g, b, a)
    surface.draw_filled_rect(xpos - 1, ypos - 1, 764, 622, 59, 58, 82, lpac)
    surface.draw_filled_rect(xpos, ypos, 762, 620, 19, 14, 33, bpac)
    surface.draw_filled_rect(xpos, ypos, 762, 67, 29, 24, 63, opac)
    surface.draw_filled_rect(xpos + 16.5, ypos + 89, 729, 42, 59, 58, 82, opac)
    surface.draw_filled_rect(xpos + 17.5, ypos + 90, 727, 40, 29, 24, 63, bpac)
    surface.draw_outlined_rect(xpos + 16.5, ypos + 130, 729, 474, 59, 58, 82, opac)
    surface.draw_filled_rect(xpos + 17.5, ypos + 131, 727, 473, 29, 24, 63, lpac)
    surface.draw_text(xpos + 15, ypos + 26, 255, 0, 0, 255, MainFont, "FATALITY")
    surface.draw_text(xpos + 17, ypos + 28, 0, 0, 255, 255, MainFont, "FATALITY")
    surface.draw_text(xpos + 16, ypos + 27, 255, 255, 255, 255, MainFont, "FATALITY")
    surface.draw_filled_gradient_rect(xpos, ypos + 11, 762, 2, 0, 0, 150, 50, 255, 0, 0, 50, true)
    surface.draw_filled_rect(xpos, ypos, 762, 11, 29, 24, 63, bpac)
    surface.draw_text(xpos + 160, ypos + 32, 255, 255, 255, RAGEop, TabFont, "RAGE")
    surface.draw_text(xpos + 230, ypos + 32, 255, 255, 255, VISUALSop, TabFont, "VISUALS")
    surface.draw_text(xpos + 320, ypos + 32, 255, 255, 255, MISCop, TabFont, "MISC")
    surface.draw_text(xpos + 380, ypos + 32, 255, 255, 255, INVENTORYop, TabFont, "INVENTORY")
    surface.draw_text(xpos + 492, ypos + 32, 255, 255, 255, LEGITop, TabFont, "LEGIT")
    surface.draw_line(xpos + MenuIndc.Ax01, ypos + MenuIndc.Ay01, xpos + MenuIndc.Ax11, ypos + MenuIndc.Ay11, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax02, ypos + MenuIndc.Ay02, xpos + MenuIndc.Ax12, ypos + MenuIndc.Ay12, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax03, ypos + MenuIndc.Ay03, xpos + MenuIndc.Ax13, ypos + MenuIndc.Ay13, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax04, ypos + MenuIndc.Ay04, xpos + MenuIndc.Ax14, ypos + MenuIndc.Ay14, 210, 7, 91, opac)
    surface.draw_line(xpos + MenuIndc.Ax05, ypos + MenuIndc.Ay05, xpos + MenuIndc.Ax15, ypos + MenuIndc.Ay15, 210, 7, 91, opac)


    switch(ActiveTab) {

        RAGE = function()
            if ActiveSubTab == "AIMBOT" then
                ActiveWeapon = "AUTO"
                surface.draw_text(xpos + 160, ypos + 32, 255, 255, 255, 255, TabFont, "RAGE")
                surface.draw_text(xpos + 29, ypos + 98, 255, 255, 255, 255, TabFont, "AIMBOT")
                surface.draw_text(xpos + 125, ypos + 101, 255, 255, 255, 30, TabFont, "ANTI-AIM")
                surface.draw_filled_rect(xpos + 17.5, ypos + 127, 90, 3, 210, 7, 91, bpac)
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
                surface.draw_outlined_rect(xpos + 35, ypos + 190, 219, 398, 59, 58, 82, opac)
                surface.draw_outlined_rect(xpos + 271.5, ypos + 190, 219, 398, 59, 58, 82, opac)
                surface.draw_outlined_rect(xpos + 508, ypos + 148, 219, 330, 59, 58, 82, opac)
                surface.draw_outlined_rect(xpos + 508, ypos + 498, 219, 90, 59, 58, 82, opac)

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
            surface.draw_text(xpos + 230, ypos + 32, 255, 255, 255, 255, TabFont, "VISUALS")
            client.color_log(123, 194, 21, "VISUALS")
        end,

        MISC = function()
            surface.draw_text(xpos + 320, ypos + 32, 255, 255, 255, 255, TabFont, "MISC")
            client.color_log(123, 194, 21, "MISC")
        end,

        INVENTORY = function()
            surface.draw_text(xpos + 380, ypos + 32, 255, 255, 255, 255, TabFont, "INVENTORY")
            client.color_log(123, 194, 21, "INVENTORY")
        end,
        
        LEGIT = function()
            surface.draw_text(xpos + 492, ypos + 32, 255, 255, 255, 255, TabFont, "LEGIT")
            client.color_log(123, 194, 21, "LEGIT")
        end
    }
end 

local function OnFrame()    
    if ui.is_menu_open() then
        DrawMenu()
        MenuAnimation()
        ElementAnimation()
        BackgroundAnimation()
        MainHover()
        ClickAnimationA()

        local LClick = client.key_state(0x01)
        local mousepos = { ui.mouse_position() }
        mouseposX = mousepos[1] - xpos
        mouseposY = mousepos[2] -ypos
    --  client.color_log(123, 194, 21, mouseposX)
    --  client.color_log(123, 194, 21, mouseposY)

        if LClick == true then
            ChangeActiveTab()
        end

        if mouseposY >= startpos.AyNav and mouseposY <= endpos.AyNav and mouseposX >= startpos.AxNav and mouseposX <= endpos.AxNav then
            client.color_log(123, 194, 21, "yes")
            HoverA = true
            HoverAnimationA()
        else
            HoverA = false
            ActiveHover = "NONE"
        end

    else
        opac = 0
        lpac = 0
        bpac = 0
    end 
end

client.set_event_callback("paint_ui", OnFrame)
