local module = {}

function module.Init(player, guiFolder)
    -- 1. Setup the UI
    local playerGui = player:WaitForChild("PlayerGui")
    local gui = guiFolder:Clone()
    gui.Parent = playerGui
    
    -- 2. Define Polaris Functions (Naming Convention)
    _G.Polaris = {}
    
    _G.Polaris.execute = function(code)
        local func, err = loadstring(code)
        if func then 
            task.spawn(func)
        else 
            warn("[Mango] Execution Error: " .. tostring(err))
        end
    end
    
    _G.Polaris.attach = function()
        print("[Mango] Polaris API Attached to " .. player.Name)
    end

    -- 3. Link UI Buttons
    local mainFrame = gui:WaitForChild("Main")
    local exeButton = mainFrame:WaitForChild("Exe"):FindFirstChild("LocalScript")
    local clearButton = mainFrame:WaitForChild("Cle"):FindFirstChild("LocalScript")
    local textBox = mainFrame:WaitForChild("Frame1"):WaitForChild("TextBox")

    -- Connect your 'Execute' button to your Polaris function
    -- Note: Since this is server-side logic, you'd usually use a RemoteEvent 
    -- found in your 'own ss' folder to trigger the execution.
    
    print("[Mango] Real Logic Initialized via GitHub.")
end

return module
