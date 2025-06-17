-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Configuration
local correctKey = "KEY_t3!?V7gSd4W9"
local scriptExecuted = false
local keyLink = "https://mscrypts.xyz/dynamic-U3VjY2VzPXRydWU=" -- Replace with your key source

-- Create the Rayfield Window
local Window = Rayfield:CreateWindow({
    Name = "Matcha Key System",
    LoadingTitle = "Matcha UI is Starting...",
    LoadingSubtitle = "Powered by Matcha Scrypts",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false,
    Theme = "DarkBlue"
})

-- Create Key System Tab with Lucide Icon
local KeyTab = Window:CreateTab("Key System", "key") -- Lucide icon: https://lucide.dev/icons/key

-- Instructional Paragraph
KeyTab:CreateParagraph({
    Title = "Matcha Key Verification",
    Content = "To continue, you must provide a valid key. You can retrieve your key from the official link below. Once the correct key is entered, your script will automatically load."
})

-- Section: Copy Key Link
KeyTab:CreateSection("Key Retrieval")

KeyTab:CreateButton({
    Name = "Copy Key URL to Clipboard",
    Icon = "link",
    Callback = function()
        setclipboard(keyLink)
        Rayfield:Notify({
            Title = "Copied",
            Content = "Copied link to clipboard successfully.",
            Duration = 4,
            Image = "clipboard-check",
        })
    end
})

-- Section: Key Verification
KeyTab:CreateSection("Key Verification")

KeyTab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Enter the key here...",
    RemoveTextAfterFocusLost = false,
    Icon = "lock",
    Callback = function(input)
        if scriptExecuted then return end

        if input == correctKey then
            scriptExecuted = true
            Rayfield:Notify({
                Title = "Correct Key",
                Content = "Executing script, please wait.",
                Duration = 6.5,
                Image = "check",
            })

            local success, result = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mikasuru/Arc/refs/heads/main/Arc.lua"))()
                task.wait(3)
                Rayfield:Destroy()
            end)

            if not success then
                Rayfield:Notify({
                    Title = "Execution Failed",
                    Content = "An error occurred while trying to execute script.",
                    Duration = 6.5,
                    Image = "ban",
                })
                warn("Script error:", result)
            end
        else
            Rayfield:Notify({
                Title = "Incorrect Key",
                Content = "The key you entered is incorrect.",
                Duration = 6.5,
                Image = "ban",
            })
        end
    end
})