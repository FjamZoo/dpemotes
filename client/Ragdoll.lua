if Config.RagdollEnabled then
    local stop = true
    local function Ragdoll()
        if Config.RagdollAsToggle then
            stop = not stop
        else
            stop = false
        end

        while not stop do
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) then
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
            end
            Wait(10)
        end
    end

    local function StopRagdoll()
        if Config.RagdollAsToggle then return end
        stop = true
    end


    RegisterCommand('+ragdoll', function() Ragdoll() end)
    RegisterCommand('-ragdoll', function() StopRagdoll() end)
    RegisterKeyMapping("+ragdoll", "Ragdoll your character", "keyboard", Config.RagdollKeybind)
end
