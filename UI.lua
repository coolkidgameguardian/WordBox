--[=[
    WORD SEARCH ENGINE v4 (Smart Search)
    - Default: "Starts With" (Prefix) search.
    - Space + Text: "Contains" (Substring) search.
    - Underscore (_): "Hangman" (Wildcard) search.
    - Highlights matching letters in RED.
]=]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Instances: 26 | Scripts: 0 | Modules: 0 | Tags: 0
local LMG2L = {};

-- PlayerGui.ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
LMG2L["ScreenGui_1"]["DisplayOrder"] = 9999;
LMG2L["ScreenGui_1"]["ResetOnSpawn"] = false;

-- PlayerGui.ScreenGui.Base
LMG2L["Base_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Base_2"]["BorderSizePixel"] = 0;
LMG2L["Base_2"]["BackgroundColor3"] = Color3.fromRGB(142, 255, 0);
LMG2L["Base_2"]["Size"] = UDim2.new(0.37853, 0, 0.54644, 0);
LMG2L["Base_2"]["Position"] = UDim2.new(0.2594, 0, 0.12193, 0);
LMG2L["Base_2"]["Name"] = [[Base]];

-- PlayerGui.ScreenGui.Base.UICorner
LMG2L["UICorner_3"] = Instance.new("UICorner", LMG2L["Base_2"]);
LMG2L["UICorner_3"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Minimize
LMG2L["Minimize_4"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Minimize_4"]["BorderSizePixel"] = 0;
LMG2L["Minimize_4"]["BackgroundColor3"] = Color3.fromRGB(142, 255, 0);
LMG2L["Minimize_4"]["Size"] = UDim2.new(0.11168, 0, 0.17355, 0);
LMG2L["Minimize_4"]["Position"] = UDim2.new(0.88325, 0, -0.21488, 0);
LMG2L["Minimize_4"]["Name"] = [[Minimize]];

-- PlayerGui.ScreenGui.Base.Minimize.UICorner
LMG2L["UICorner_5"] = Instance.new("UICorner", LMG2L["Minimize_4"]);
LMG2L["UICorner_5"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Minimize.UIStroke
LMG2L["UIStroke_6"] = Instance.new("UIStroke", LMG2L["Minimize_4"]);
LMG2L["UIStroke_6"]["Thickness"] = 4;

-- PlayerGui.ScreenGui.Base.Minimize.ImageLabel
LMG2L["ImageLabel_7"] = Instance.new("ImageLabel", LMG2L["Minimize_4"]);
LMG2L["ImageLabel_7"]["BorderSizePixel"] = 0;
LMG2L["ImageLabel_7"]["ScaleType"] = Enum.ScaleType.Fit;
LMG2L["ImageLabel_7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ImageLabel_7"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["ImageLabel_7"]["Image"] = [[rbxassetid://101726985999950]];
LMG2L["ImageLabel_7"]["Size"] = UDim2.new(5.5, 0, 5.80952, 0);
LMG2L["ImageLabel_7"]["BackgroundTransparency"] = 1;
LMG2L["ImageLabel_7"]["Position"] = UDim2.new(-2.36364, 0, -2.33333, 0);

-- PlayerGui.ScreenGui.Base.Modules
LMG2L["Modules_8"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Modules_8"]["BorderSizePixel"] = 0;
LMG2L["Modules_8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Modules_8"]["Size"] = UDim2.new(0.69543, 0, 0.95041, 0);
LMG2L["Modules_8"]["Position"] = UDim2.new(0.28934, 0, 0.02479, 0);
LMG2L["Modules_8"]["Name"] = [[Modules]];
LMG2L["Modules_8"]["BackgroundTransparency"] = 1;

-- PlayerGui.ScreenGui.Base.Modules.UICorner
LMG2L["UICorner_9"] = Instance.new("UICorner", LMG2L["Modules_8"]);
LMG2L["UICorner_9"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Modules.ScrollingFrame
LMG2L["ScrollingFrame_a"] = Instance.new("ScrollingFrame", LMG2L["Modules_8"]);
LMG2L["ScrollingFrame_a"]["BorderSizePixel"] = 0;
LMG2L["ScrollingFrame_a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ScrollingFrame_a"]["Size"] = UDim2.new(1, 0, 0.85217, 0);
LMG2L["ScrollingFrame_a"]["Position"] = UDim2.new(0, 0, 0.14783, 0);
LMG2L["ScrollingFrame_a"]["BackgroundTransparency"] = 1;
LMG2L["ScrollingFrame_a"]["ScrollBarThickness"] = 0; -- Invisible Scroll
LMG2L["ScrollingFrame_a"]["AutomaticCanvasSize"] = Enum.AutomaticSize.None; 

local ModulesLayout = Instance.new("UIListLayout", LMG2L["ScrollingFrame_a"])
ModulesLayout.Padding = UDim.new(0, 5)
ModulesLayout.SortOrder = Enum.SortOrder.LayoutOrder

local ModulesPadding = Instance.new("UIPadding", LMG2L["ScrollingFrame_a"])
ModulesPadding.PaddingTop = UDim.new(0, 2)
ModulesPadding.PaddingBottom = UDim.new(0, 10)
ModulesPadding.PaddingLeft = UDim.new(0, 5)
ModulesPadding.PaddingRight = UDim.new(0, 5)

-- PlayerGui.ScreenGui.Base.Modules.ScrollingFrame.UICorner
LMG2L["UICorner_b"] = Instance.new("UICorner", LMG2L["ScrollingFrame_a"]);
LMG2L["UICorner_b"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Modules.Search
LMG2L["Search_c"] = Instance.new("Frame", LMG2L["Modules_8"]);
LMG2L["Search_c"]["BorderSizePixel"] = 0;
LMG2L["Search_c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Search_c"]["Size"] = UDim2.new(0.9562, 0, 0.10435, 0);
LMG2L["Search_c"]["Position"] = UDim2.new(0.0219, 0, 0.02609, 0);
LMG2L["Search_c"]["Name"] = [[Search]];
LMG2L["Search_c"]["BackgroundTransparency"] = 1;

local SearchBox = Instance.new("TextBox", LMG2L["Search_c"])
SearchBox.Size = UDim2.new(1, 0, 1, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.Text = ""
SearchBox.PlaceholderText = "Search..."
SearchBox.TextColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.TextScaled = true
SearchBox.Font = Enum.Font.GothamBold

-- PlayerGui.ScreenGui.Base.Modules.Search.UICorner
LMG2L["UICorner_d"] = Instance.new("UICorner", LMG2L["Search_c"]);
LMG2L["UICorner_d"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Modules.Search.UIStroke
LMG2L["UIStroke_e"] = Instance.new("UIStroke", LMG2L["Search_c"]);
LMG2L["UIStroke_e"]["Thickness"] = 4;

-- PlayerGui.ScreenGui.Base.Modules.UIStroke
LMG2L["UIStroke_f"] = Instance.new("UIStroke", LMG2L["Modules_8"]);
LMG2L["UIStroke_f"]["Thickness"] = 4;

-- PlayerGui.ScreenGui.Base.Category
LMG2L["Category_10"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Category_10"]["BorderSizePixel"] = 0;
LMG2L["Category_10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Category_10"]["Size"] = UDim2.new(0.24873, 0, 0.95041, 0);
LMG2L["Category_10"]["Position"] = UDim2.new(0.01523, 0, 0.02479, 0);
LMG2L["Category_10"]["Name"] = [[Category]];
LMG2L["Category_10"]["BackgroundTransparency"] = 1;

-- PlayerGui.ScreenGui.Base.Category.UICorner
LMG2L["UICorner_11"] = Instance.new("UICorner", LMG2L["Category_10"]);
LMG2L["UICorner_11"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Category.ScrollingFrame
LMG2L["ScrollingFrame_12"] = Instance.new("ScrollingFrame", LMG2L["Category_10"]);
LMG2L["ScrollingFrame_12"]["BorderSizePixel"] = 0;
LMG2L["ScrollingFrame_12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ScrollingFrame_12"]["Size"] = UDim2.new(1, 0, 1, 0);
LMG2L["ScrollingFrame_12"]["BackgroundTransparency"] = 1;
LMG2L["ScrollingFrame_12"]["ScrollBarThickness"] = 0; -- Invisible Scroll
LMG2L["ScrollingFrame_12"]["AutomaticCanvasSize"] = Enum.AutomaticSize.None; 

local CategoryLayout = Instance.new("UIListLayout", LMG2L["ScrollingFrame_12"])
CategoryLayout.Padding = UDim.new(0, 5)
CategoryLayout.SortOrder = Enum.SortOrder.LayoutOrder

local CategoryPadding = Instance.new("UIPadding", LMG2L["ScrollingFrame_12"])
CategoryPadding.PaddingTop = UDim.new(0, 2)
CategoryPadding.PaddingBottom = UDim.new(0, 2)
CategoryPadding.PaddingLeft = UDim.new(0, 5)
CategoryPadding.PaddingRight = UDim.new(0, 5)

-- PlayerGui.ScreenGui.Base.Category.ScrollingFrame.UICorner
LMG2L["UICorner_13"] = Instance.new("UICorner", LMG2L["ScrollingFrame_12"]);
LMG2L["UICorner_13"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Category.UIStroke
LMG2L["UIStroke_14"] = Instance.new("UIStroke", LMG2L["Category_10"]);
LMG2L["UIStroke_14"]["Thickness"] = 4;

-- PlayerGui.ScreenGui.Base.Client Name
LMG2L["Client Name_15"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Client Name_15"]["BorderSizePixel"] = 0;
LMG2L["Client Name_15"]["BackgroundColor3"] = Color3.fromRGB(142, 255, 0);
LMG2L["Client Name_15"]["Size"] = UDim2.new(0.5736, 0, 0.17355, 0);
LMG2L["Client Name_15"]["Position"] = UDim2.new(-0.00508, 0, -0.21488, 0);
LMG2L["Client Name_15"]["Name"] = [[Client Name]];

-- PlayerGui.ScreenGui.Base.Client Name.UICorner
LMG2L["UICorner_16"] = Instance.new("UICorner", LMG2L["Client Name_15"]);
LMG2L["UICorner_16"]["CornerRadius"] = UDim.new(0, 10);

-- PlayerGui.ScreenGui.Base.Client Name.ImageLabel
LMG2L["ImageLabel_17"] = Instance.new("ImageLabel", LMG2L["Client Name_15"]);
LMG2L["ImageLabel_17"]["BorderSizePixel"] = 0;
LMG2L["ImageLabel_17"]["ScaleType"] = Enum.ScaleType.Fit;
LMG2L["ImageLabel_17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ImageLabel_17"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["ImageLabel_17"]["Image"] = [[rbxassetid://82682329439369]];
LMG2L["ImageLabel_17"]["Size"] = UDim2.new(1.12389, 0, 1.7619, 0);
LMG2L["ImageLabel_17"]["BackgroundTransparency"] = 1;
LMG2L["ImageLabel_17"]["Position"] = UDim2.new(-0.0708, 0, -0.38095, 0);

-- PlayerGui.ScreenGui.Base.Client Name.UIStroke
LMG2L["UIStroke_18"] = Instance.new("UIStroke", LMG2L["Client Name_15"]);
LMG2L["UIStroke_18"]["Thickness"] = 4;

-- PlayerGui.ScreenGui.Base.UIStroke
LMG2L["UIStroke_19"] = Instance.new("UIStroke", LMG2L["Base_2"]);
LMG2L["UIStroke_19"]["Thickness"] = 4;

-- PlayerGui.ScreenGui.Base.UIAspectRatioConstraint
LMG2L["UIAspectRatioConstraint_1a"] = Instance.new("UIAspectRatioConstraint", LMG2L["Base_2"]);
LMG2L["UIAspectRatioConstraint_1a"]["AspectRatio"] = 1.6281;

----------------------------------------------------------------------------------
-- [[ INTERACTION LOGIC ]]
----------------------------------------------------------------------------------

-- 1. Create the Drag Handle (INVISIBLE)
local DragHandle = Instance.new("Frame")
DragHandle.Name = "DragHandle"
DragHandle.Size = UDim2.new(0, 30, 0, 30) 
DragHandle.Position = UDim2.new(0, 5, 1, -35) 
DragHandle.BackgroundColor3 = Color3.fromRGB(100, 200, 0)
DragHandle.BorderSizePixel = 0
DragHandle.BackgroundTransparency = 1 
DragHandle.Parent = LMG2L["Base_2"]
DragHandle.ZIndex = 10 

local DragHandleCorner = Instance.new("UICorner", DragHandle)
DragHandleCorner.CornerRadius = UDim.new(0, 6)

local DragIcon = Instance.new("ImageLabel", DragHandle)
DragIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
DragIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
DragIcon.BackgroundTransparency = 1
DragIcon.Image = "rbxassetid://9945398007" 
DragIcon.ImageColor3 = Color3.new(1,1,1)
DragIcon.ImageTransparency = 1 

-- 2. Create the "Open" Circle Button
local OpenButton = Instance.new("ImageButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 50, 0, 50) 
OpenButton.Position = UDim2.new(0.1, 0, 0.1, 0)
OpenButton.BackgroundColor3 = Color3.fromRGB(142, 255, 0) 
OpenButton.Visible = false 
OpenButton.Parent = LMG2L["ScreenGui_1"]

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0) 
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Thickness = 3
OpenStroke.Parent = OpenButton

local OpenIcon = Instance.new("ImageLabel")
OpenIcon.BackgroundTransparency = 1
OpenIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
OpenIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
OpenIcon.Image = "rbxassetid://101726985999950" 
OpenIcon.ImageColor3 = Color3.new(0,0,0)
OpenIcon.ScaleType = Enum.ScaleType.Fit 
OpenIcon.Parent = OpenButton

-- 3. TARGETED DRAGGING SYSTEM (TWEEN BASED)
local function MakeDraggableSmooth(Handle, ObjectToMove)
    local dragToggle = nil
    local dragSpeed = 0.15 
    local dragInput = nil
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        local targetPosition = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        local twInfo = TweenInfo.new(dragSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local tween = TweenService:Create(ObjectToMove, twInfo, {Position = targetPosition})
        tween:Play()
    end
    
    Handle.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = ObjectToMove.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    Handle.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

MakeDraggableSmooth(DragHandle, LMG2L["Base_2"])
MakeDraggableSmooth(OpenButton, OpenButton)

-- 4. SCROLL LOGIC
local function updateScroll(frame, layout, padding)
    if not frame or not layout or not padding then return end
    
    local h = layout.AbsoluteContentSize.Y + padding.PaddingTop.Offset + padding.PaddingBottom.Offset
    frame.CanvasSize = UDim2.new(0, 0, 0, h)
    
    local max = h - (frame.AbsoluteWindowSize.Y)
    if max < 0 then max = 0 end
    
    frame.CanvasPosition = Vector2.new(0, math.clamp(frame.CanvasPosition.Y, 0, max))
end

LMG2L["ScrollingFrame_a"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding) 
end)
ModulesLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding) 
end)

LMG2L["ScrollingFrame_12"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_12"], CategoryLayout, CategoryPadding) 
end)
CategoryLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_12"], CategoryLayout, CategoryPadding) 
end)

-- 5. SEARCH LOGIC (SMART SEARCH: PREFIX vs SUBSTRING vs WILDCARD)
SearchBox.Focused:Connect(function()
    SearchBox.PlaceholderText = ""
end)

SearchBox.FocusLost:Connect(function()
    if SearchBox.Text == "" then
        SearchBox.PlaceholderText = "Search..."
    end
end)

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local RawInput = SearchBox.Text 
    local LowerInput = RawInput:lower()
    local ScrollingFrame = LMG2L["ScrollingFrame_a"]
    
    -- [[ HIGHLIGHT COLOR: RED (#FF0000) ]] --
    local HIGHLIGHT_COLOR = '<font color="#FF0000"><b>'
    local END_COLOR = '</b></font>'

    -- 1. DETECT MODE
    local isWildcard = string.find(LowerInput, "_") ~= nil
    local isSubstringMode = string.sub(LowerInput, 1, 1) == " "
    
    -- 2. DETERMINE SEARCH QUERY (Strip space if in substring mode)
    local query = LowerInput
    if isSubstringMode then
        query = string.sub(LowerInput, 2)
    end
    
    -- 3. FILTER & HIGHLIGHT
    for _, item in pairs(ScrollingFrame:GetChildren()) do
        if item:IsA("GuiObject") and item:FindFirstChild("Label") then
            local rawWord = item.Name -- The word name
            local lowerWord = rawWord:lower()
            local textLabel = item.Label
            
            -- If empty search (or just a space), show everything normal
            if query == "" and not isWildcard then
                textLabel.Text = rawWord
                item.Visible = true
            else
                local matchFound = false
                local highlightedText = rawWord
                
                if isWildcard then
                    -- [[ A. WILDCARD MODE (_ present) ]]
                    if #query == #lowerWord then
                        local isMatch = true
                        local builtString = ""
                        
                        for i = 1, #lowerWord do
                            local inputChar = string.sub(query, i, i)
                            local wordChar = string.sub(rawWord, i, i)
                            
                            if inputChar == "_" then
                                builtString = builtString .. wordChar
                            elseif inputChar == wordChar:lower() then
                                builtString = builtString .. HIGHLIGHT_COLOR .. wordChar .. END_COLOR
                            else
                                isMatch = false
                                break
                            end
                        end
                        
                        if isMatch then
                            matchFound = true
                            highlightedText = builtString
                        end
                    end
                    
                elseif isSubstringMode then
                    -- [[ B. SUBSTRING MODE (Starts with space) ]]
                    -- Finds query anywhere in word
                    local s, e = string.find(lowerWord, query, 1, true)
                    if s then
                        matchFound = true
                        local pre = string.sub(rawWord, 1, s - 1)
                        local mid = string.sub(rawWord, s, e)
                        local post = string.sub(rawWord, e + 1)
                        highlightedText = pre .. HIGHLIGHT_COLOR .. mid .. END_COLOR .. post
                    end
                    
                else
                    -- [[ C. PREFIX MODE (Default) ]]
                    -- Finds words STARTING with query
                    if string.sub(lowerWord, 1, #query) == query then
                        matchFound = true
                        local pre = string.sub(rawWord, 1, #query)
                        local post = string.sub(rawWord, #query + 1)
                        highlightedText = HIGHLIGHT_COLOR .. pre .. END_COLOR .. post
                    end
                end
                
                if matchFound then
                    item.Visible = true
                    textLabel.RichText = true
                    textLabel.Text = highlightedText
                else
                    item.Visible = false
                end
            end
        end
    end
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding) 
end)

-- 6. MINIMIZE / OPEN LOGIC
local function MinimizeGui()
    LMG2L["Base_2"].Visible = false
    OpenButton.Visible = true
end

local function OpenGui()
    LMG2L["Base_2"].Visible = true
    OpenButton.Visible = false
end

LMG2L["Minimize_4"].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        MinimizeGui()
    end
end)

OpenButton.MouseButton1Click:Connect(function()
    OpenGui()
end)


----------------------------------------------------------------------------------
-- [[ WORD SEARCH SYSTEM API ]]
----------------------------------------------------------------------------------

local CategoryContainer = LMG2L["ScrollingFrame_12"] 
local ModuleContainer = LMG2L["ScrollingFrame_a"]  

local ActiveCategoryButton = nil
local Library = {}

-- Internal function to create a WORD button
local function CreateWordButton(wordText)
    local btn = Instance.new("TextButton")
    btn.Name = wordText -- Set name for search indexing
    btn.Parent = ModuleContainer
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.AutoButtonColor = false

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    
    local title = Instance.new("TextLabel", btn)
    title.Name = "Label"
    t = 10 

local DragHandleCorner = Instance.new("UICorner", DragHandle)
DragHandleCorner.CornerRadius = UDim.new(0, 6)

local DragIcon = Instance.new("ImageLabel", DragHandle)
DragIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
DragIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
DragIcon.BackgroundTransparency = 1
DragIcon.Image = "rbxassetid://9945398007" 
DragIcon.ImageColor3 = Color3.new(1,1,1)
DragIcon.ImageTransparency = 1 

-- 2. Create the "Open" Circle Button
local OpenButton = Instance.new("ImageButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 50, 0, 50) 
OpenButton.Position = UDim2.new(0.1, 0, 0.1, 0)
OpenButton.BackgroundColor3 = Color3.fromRGB(142, 255, 0) 
OpenButton.Visible = false 
OpenButton.Parent = LMG2L["ScreenGui_1"]

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0) 
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Thickness = 3
OpenStroke.Parent = OpenButton

local OpenIcon = Instance.new("ImageLabel")
OpenIcon.BackgroundTransparency = 1
OpenIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
OpenIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
OpenIcon.Image = "rbxassetid://101726985999950" 
OpenIcon.ImageColor3 = Color3.new(0,0,0)
OpenIcon.ScaleType = Enum.ScaleType.Fit 
OpenIcon.Parent = OpenButton

-- 3. TARGETED DRAGGING SYSTEM (TWEEN BASED)
local function MakeDraggableSmooth(Handle, ObjectToMove)
    local dragToggle = nil
    local dragSpeed = 0.15 
    local dragInput = nil
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        local targetPosition = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        local twInfo = TweenInfo.new(dragSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local tween = TweenService:Create(ObjectToMove, twInfo, {Position = targetPosition})
        tween:Play()
    end
    
    Handle.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = ObjectToMove.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    Handle.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

MakeDraggableSmooth(DragHandle, LMG2L["Base_2"])
MakeDraggableSmooth(OpenButton, OpenButton)

-- 4. SCROLL LOGIC
local function updateScroll(frame, layout, padding)
    if not frame or not layout or not padding then return end
    
    local h = layout.AbsoluteContentSize.Y + padding.PaddingTop.Offset + padding.PaddingBottom.Offset
    frame.CanvasSize = UDim2.new(0, 0, 0, h)
    
    local max = h - (frame.AbsoluteWindowSize.Y)
    if max < 0 then max = 0 end
    
    frame.CanvasPosition = Vector2.new(0, math.clamp(frame.CanvasPosition.Y, 0, max))
end

LMG2L["ScrollingFrame_a"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding) 
end)
ModulesLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding) 
end)

LMG2L["ScrollingFrame_12"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_12"], CategoryLayout, CategoryPadding) 
end)
CategoryLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() 
    updateScroll(LMG2L["ScrollingFrame_12"], CategoryLayout, CategoryPadding) 
end)

-- 5. ADVANCED SEARCH LOGIC (RED HIGHLIGHT + WILDCARD)
SearchBox.Focused:Connect(function()
    SearchBox.PlaceholderText = ""
end)

SearchBox.FocusLost:Connect(function()
    if SearchBox.Text == "" then
        SearchBox.PlaceholderText = "Search..."
    end
end)

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local InputText = SearchBox.Text 
    local lowerInput = InputText:lower()
    local ScrollingFrame = LMG2L["ScrollingFrame_a"]
    
    -- Detect Mode
    local isWildcard = string.find(lowerInput, "_") ~= nil
    
    -- [[ HIGHLIGHT COLOR: RED (#FF0000) ]] --
    local HIGHLIGHT_COLOR = '<font color="#FF0000"><b>'
    local END_COLOR = '</b></font>'

    for _, item in pairs(ScrollingFrame:GetChildren()) do
        if item:IsA("GuiObject") and item:FindFirstChild("Label") then
            local rawWord = item.Name -- The word name set in CreateWordButton
            local lowerWord = rawWord:lower()
            local textLabel = item.Label
            
            -- If empty search, show everything normal
            if lowerInput == "" then
                textLabel.Text = rawWord
                item.Visible = true
            else
                local matchFound = false
                local highlightedText = rawWord
                
                if isWildcard then
                    -- [[ WILDCARD LOGIC (Length + Chars) ]]
                    if #lowerInput == #lowerWord then
                        -- Check char by char
                        local isMatch = true
                        local builtString = ""
                        
                        for i = 1, #lowerWord do
                            local inputChar = string.sub(lowerInput, i, i)
                            local wordChar = string.sub(rawWord, i, i) -- Keep original casing
                            
                            if inputChar == "_" then
                                -- Match: Wildcard matches anything
                                builtString = builtString .. wordChar
                            elseif inputChar == wordChar:lower() then
                                -- Match: Specific letter matches -> Highlight RED
                                builtString = builtString .. HIGHLIGHT_COLOR .. wordChar .. END_COLOR
                            else
                                -- Mismatch
                                isMatch = false
                                break
                            end
                        end
                        
                        if isMatch then
                            matchFound = true
                            highlightedText = builtString
                        end
                    end
                else
                    -- [[ SUBSTRING LOGIC ]]
                    local s, e = string.find(lowerWord, lowerInput, 1, true)
                    if s then
                        matchFound = true
                        -- Reconstruct string with highlight
                        local pre = string.sub(rawWord, 1, s - 1)
                        local mid = string.sub(rawWord, s, e)
                        local post = string.sub(rawWord, e + 1)
                        highlightedText = pre .. HIGHLIGHT_COLOR .. mid .. END_COLOR .. post
                    end
                end
                
                if matchFound then
                    item.Visible = true
                    textLabel.RichText = true
                    textLabel.Text = highlightedText
                else
                    item.Visible = false
                end
            end
        end
    end
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding) 
end)

-- 6. MINIMIZE / OPEN LOGIC
local function MinimizeGui()
    LMG2L["Base_2"].Visible = false
    OpenButton.Visible = true
end

local function OpenGui()
    LMG2L["Base_2"].Visible = true
    OpenButton.Visible = false
end

LMG2L["Minimize_4"].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        MinimizeGui()
    end
end)

OpenButton.MouseButton1Click:Connect(function()
    OpenGui()
end)


----------------------------------------------------------------------------------
-- [[ WORD SEARCH SYSTEM API ]]
----------------------------------------------------------------------------------

local CategoryContainer = LMG2L["ScrollingFrame_12"] 
local ModuleContainer = LMG2L["ScrollingFrame_a"]  

local ActiveCategoryButton = nil
local Library = {}

-- Internal function to create a WORD button
local function CreateWordButton(wordText)
    local btn = Instance.new("TextButton")
    btn.Name = wordText -- Set name for search indexing
    btn.Parent = ModuleContainer
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.AutoButtonColor = false

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    
    local title = Instance.new("TextLabel", btn)
    title.Name = "Label"
    title.Text = wordText
    title.Size = UDim2.new(1, -20, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.RichText = true 

    -- Click Logic: Print and Flash
    btn.MouseButton1Click:Connect(function()
        -- Flash RED (#FF0000)
        TweenService:Create(title, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
        task.wait(0.1)
        TweenService:Create(title, TweenInfo.new(0.5), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        
        print("Selected Word: " .. wordText)
        if setclipboard then
            setclipboard(wordText)
        end
    end)
    
    updateScroll(ModuleContainer, ModulesLayout, ModulesPadding)
end

-- Function exposed to User
function Library:AddCategory(categoryName, wordsTable)
    local btn = Instance.new("TextButton")
    btn.Name = categoryName
    btn.Parent = CategoryContainer
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = categoryName
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.AutoButtonColor = false
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        -- 1. Visual Update
        if ActiveCategoryButton then
            TweenService:Create(ActiveCategoryButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(180, 180, 180), BackgroundTransparency = 1}):Play()
        end
        ActiveCategoryButton = btn
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(142, 255, 0), BackgroundTransparency = 0.9}):Play()

        -- 2. Clear Old Words
        for _, child in pairs(ModuleContainer:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        -- 3. Load New Words
        for _, word in ipairs(wordsTable) do
            CreateWordButton(word)
        end
        
        updateScroll(ModuleContainer, ModulesLayout, ModulesPadding)
    end)
    
    updateScroll(CategoryContainer, CategoryLayout, CategoryPadding)
end

return Library
