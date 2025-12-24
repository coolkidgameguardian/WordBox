--[=[
    WORD SEARCH ENGINE v6 (INFINITE SCROLL - ZERO LAG)
    - Lazy Loading: Only renders buttons as you scroll.
    - Optimized Search: Searches data, not UI.
    - Capable of handling 1,000,000+ words without freezing.
]=]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Global Config
local RENDER_BATCH_SIZE = 50 -- How many items to add when you scroll down
local SEARCH_RESULT_LIMIT = 500 -- Stop searching after finding this many matches (prevents lag on common letters like "e")

-- Instances
local LMG2L = {};

-- GUI Setup
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
LMG2L["ScreenGui_1"]["DisplayOrder"] = 9999;
LMG2L["ScreenGui_1"]["ResetOnSpawn"] = false;

-- Base Frame
LMG2L["Base_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Base_2"]["BorderSizePixel"] = 0;
LMG2L["Base_2"]["BackgroundColor3"] = Color3.fromRGB(142, 255, 0);
LMG2L["Base_2"]["Size"] = UDim2.new(0.37853, 0, 0.54644, 0);
LMG2L["Base_2"]["Position"] = UDim2.new(0.2594, 0, 0.12193, 0);
LMG2L["Base_2"]["Name"] = [[Base]];

LMG2L["UICorner_3"] = Instance.new("UICorner", LMG2L["Base_2"]);
LMG2L["UICorner_3"]["CornerRadius"] = UDim.new(0, 10);

-- Minimize Button
LMG2L["Minimize_4"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Minimize_4"]["BorderSizePixel"] = 0;
LMG2L["Minimize_4"]["BackgroundColor3"] = Color3.fromRGB(142, 255, 0);
LMG2L["Minimize_4"]["Size"] = UDim2.new(0.11168, 0, 0.17355, 0);
LMG2L["Minimize_4"]["Position"] = UDim2.new(0.88325, 0, -0.21488, 0);
LMG2L["Minimize_4"]["Name"] = [[Minimize]];

LMG2L["UICorner_5"] = Instance.new("UICorner", LMG2L["Minimize_4"]);
LMG2L["UICorner_5"]["CornerRadius"] = UDim.new(0, 10);

LMG2L["UIStroke_6"] = Instance.new("UIStroke", LMG2L["Minimize_4"]);
LMG2L["UIStroke_6"]["Thickness"] = 4;

LMG2L["ImageLabel_7"] = Instance.new("ImageLabel", LMG2L["Minimize_4"]);
LMG2L["ImageLabel_7"]["BorderSizePixel"] = 0;
LMG2L["ImageLabel_7"]["ScaleType"] = Enum.ScaleType.Fit;
LMG2L["ImageLabel_7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ImageLabel_7"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["ImageLabel_7"]["Image"] = [[rbxassetid://101726985999950]];
LMG2L["ImageLabel_7"]["Size"] = UDim2.new(5.5, 0, 5.80952, 0);
LMG2L["ImageLabel_7"]["BackgroundTransparency"] = 1;
LMG2L["ImageLabel_7"]["Position"] = UDim2.new(-2.36364, 0, -2.33333, 0);

-- Modules Frame
LMG2L["Modules_8"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Modules_8"]["BorderSizePixel"] = 0;
LMG2L["Modules_8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Modules_8"]["Size"] = UDim2.new(0.69543, 0, 0.95041, 0);
LMG2L["Modules_8"]["Position"] = UDim2.new(0.28934, 0, 0.02479, 0);
LMG2L["Modules_8"]["Name"] = [[Modules]];
LMG2L["Modules_8"]["BackgroundTransparency"] = 1;

LMG2L["UICorner_9"] = Instance.new("UICorner", LMG2L["Modules_8"]);
LMG2L["UICorner_9"]["CornerRadius"] = UDim.new(0, 10);

-- Module Scroll
LMG2L["ScrollingFrame_a"] = Instance.new("ScrollingFrame", LMG2L["Modules_8"]);
LMG2L["ScrollingFrame_a"]["BorderSizePixel"] = 0;
LMG2L["ScrollingFrame_a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ScrollingFrame_a"]["Size"] = UDim2.new(1, 0, 0.85217, 0);
LMG2L["ScrollingFrame_a"]["Position"] = UDim2.new(0, 0, 0.14783, 0);
LMG2L["ScrollingFrame_a"]["BackgroundTransparency"] = 1;
LMG2L["ScrollingFrame_a"]["ScrollBarThickness"] = 4;
LMG2L["ScrollingFrame_a"]["AutomaticCanvasSize"] = Enum.AutomaticSize.None; 

local ModulesLayout = Instance.new("UIListLayout", LMG2L["ScrollingFrame_a"])
ModulesLayout.Padding = UDim.new(0, 5)
ModulesLayout.SortOrder = Enum.SortOrder.LayoutOrder

local ModulesPadding = Instance.new("UIPadding", LMG2L["ScrollingFrame_a"])
ModulesPadding.PaddingTop = UDim.new(0, 2)
ModulesPadding.PaddingBottom = UDim.new(0, 10)
ModulesPadding.PaddingLeft = UDim.new(0, 5)
ModulesPadding.PaddingRight = UDim.new(0, 5)

LMG2L["UICorner_b"] = Instance.new("UICorner", LMG2L["ScrollingFrame_a"]);
LMG2L["UICorner_b"]["CornerRadius"] = UDim.new(0, 10);

-- Search Bar
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

LMG2L["UICorner_d"] = Instance.new("UICorner", LMG2L["Search_c"]);
LMG2L["UICorner_d"]["CornerRadius"] = UDim.new(0, 10);

LMG2L["UIStroke_e"] = Instance.new("UIStroke", LMG2L["Search_c"]);
LMG2L["UIStroke_e"]["Thickness"] = 4;

LMG2L["UIStroke_f"] = Instance.new("UIStroke", LMG2L["Modules_8"]);
LMG2L["UIStroke_f"]["Thickness"] = 4;

-- Category Frame
LMG2L["Category_10"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Category_10"]["BorderSizePixel"] = 0;
LMG2L["Category_10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Category_10"]["Size"] = UDim2.new(0.24873, 0, 0.95041, 0);
LMG2L["Category_10"]["Position"] = UDim2.new(0.01523, 0, 0.02479, 0);
LMG2L["Category_10"]["Name"] = [[Category]];
LMG2L["Category_10"]["BackgroundTransparency"] = 1;

LMG2L["UICorner_11"] = Instance.new("UICorner", LMG2L["Category_10"]);
LMG2L["UICorner_11"]["CornerRadius"] = UDim.new(0, 10);

LMG2L["ScrollingFrame_12"] = Instance.new("ScrollingFrame", LMG2L["Category_10"]);
LMG2L["ScrollingFrame_12"]["BorderSizePixel"] = 0;
LMG2L["ScrollingFrame_12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ScrollingFrame_12"]["Size"] = UDim2.new(1, 0, 1, 0);
LMG2L["ScrollingFrame_12"]["BackgroundTransparency"] = 1;
LMG2L["ScrollingFrame_12"]["ScrollBarThickness"] = 0;
LMG2L["ScrollingFrame_12"]["AutomaticCanvasSize"] = Enum.AutomaticSize.None; 

local CategoryLayout = Instance.new("UIListLayout", LMG2L["ScrollingFrame_12"])
CategoryLayout.Padding = UDim.new(0, 5)
CategoryLayout.SortOrder = Enum.SortOrder.LayoutOrder

local CategoryPadding = Instance.new("UIPadding", LMG2L["ScrollingFrame_12"])
CategoryPadding.PaddingTop = UDim.new(0, 2)
CategoryPadding.PaddingBottom = UDim.new(0, 2)
CategoryPadding.PaddingLeft = UDim.new(0, 5)
CategoryPadding.PaddingRight = UDim.new(0, 5)

LMG2L["UICorner_13"] = Instance.new("UICorner", LMG2L["ScrollingFrame_12"]);
LMG2L["UICorner_13"]["CornerRadius"] = UDim.new(0, 10);

LMG2L["UIStroke_14"] = Instance.new("UIStroke", LMG2L["Category_10"]);
LMG2L["UIStroke_14"]["Thickness"] = 4;

-- Client Name Frame
LMG2L["Client Name_15"] = Instance.new("Frame", LMG2L["Base_2"]);
LMG2L["Client Name_15"]["BorderSizePixel"] = 0;
LMG2L["Client Name_15"]["BackgroundColor3"] = Color3.fromRGB(142, 255, 0);
LMG2L["Client Name_15"]["Size"] = UDim2.new(0.5736, 0, 0.17355, 0);
LMG2L["Client Name_15"]["Position"] = UDim2.new(-0.00508, 0, -0.21488, 0);
LMG2L["Client Name_15"]["Name"] = [[Client Name]];

LMG2L["UICorner_16"] = Instance.new("UICorner", LMG2L["Client Name_15"]);
LMG2L["UICorner_16"]["CornerRadius"] = UDim.new(0, 10);

LMG2L["ImageLabel_17"] = Instance.new("ImageLabel", LMG2L["Client Name_15"]);
LMG2L["ImageLabel_17"]["BorderSizePixel"] = 0;
LMG2L["ImageLabel_17"]["ScaleType"] = Enum.ScaleType.Fit;
LMG2L["ImageLabel_17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["ImageLabel_17"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["ImageLabel_17"]["Image"] = [[rbxassetid://82682329439369]];
LMG2L["ImageLabel_17"]["Size"] = UDim2.new(1.12389, 0, 1.7619, 0);
LMG2L["ImageLabel_17"]["BackgroundTransparency"] = 1;
LMG2L["ImageLabel_17"]["Position"] = UDim2.new(-0.0708, 0, -0.38095, 0);

LMG2L["UIStroke_18"] = Instance.new("UIStroke", LMG2L["Client Name_15"]);
LMG2L["UIStroke_18"]["Thickness"] = 4;

LMG2L["UIStroke_19"] = Instance.new("UIStroke", LMG2L["Base_2"]);
LMG2L["UIStroke_19"]["Thickness"] = 4;

LMG2L["UIAspectRatioConstraint_1a"] = Instance.new("UIAspectRatioConstraint", LMG2L["Base_2"]);
LMG2L["UIAspectRatioConstraint_1a"]["AspectRatio"] = 1.6281;

----------------------------------------------------------------------------------
-- [[ INTERACTION LOGIC (DRAG & SCROLL) ]]
----------------------------------------------------------------------------------

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
                if input.UserInputState == Enum.UserInputState.End then dragToggle = false end
            end)
        end
    end)
    
    Handle.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then updateInput(input) end
    end)
end

MakeDraggableSmooth(DragHandle, LMG2L["Base_2"])
MakeDraggableSmooth(OpenButton, OpenButton)

-- SCROLL SIZER
local function updateScroll(frame, layout, padding)
    if not frame or not layout or not padding then return end
    local h = layout.AbsoluteContentSize.Y + padding.PaddingTop.Offset + padding.PaddingBottom.Offset
    frame.CanvasSize = UDim2.new(0, 0, 0, h)
end

LMG2L["ScrollingFrame_12"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function() updateScroll(LMG2L["ScrollingFrame_12"], CategoryLayout, CategoryPadding) end)
CategoryLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() updateScroll(LMG2L["ScrollingFrame_12"], CategoryLayout, CategoryPadding) end)

----------------------------------------------------------------------------------
-- [[ INFINITE SCROLL & SEARCH LOGIC ]]
----------------------------------------------------------------------------------

local CategoryContainer = LMG2L["ScrollingFrame_12"] 
local ModuleContainer = LMG2L["ScrollingFrame_a"]  
local ActiveCategoryButton = nil
local Library = {}

-- STATE VARIABLES
local CurrentData = {} -- The full list of words for the active category/search
local RenderedCount = 0
local IsSearchMode = false

-- Function to create a button (Cached/Recycled concept is better, but creating on fly with throttle is simpler for now)
local function CreateWordButton(wordText, highlightText)
    local btn = Instance.new("TextButton")
    btn.Name = wordText
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
    title.Text = highlightText or wordText
    title.Size = UDim2.new(1, -20, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.RichText = true 

    btn.MouseButton1Click:Connect(function()
        TweenService:Create(title, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
        task.wait(0.1)
        TweenService:Create(title, TweenInfo.new(0.5), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        print("Selected Word: " .. wordText)
        if setclipboard then setclipboard(wordText) end
    end)
end

-- RENDERER: Adds the next batch of buttons
local function RenderNextBatch()
    if RenderedCount >= #CurrentData then return end -- End of list
    
    local target = math.min(RenderedCount + RENDER_BATCH_SIZE, #CurrentData)
    
    for i = RenderedCount + 1, target do
        local entry = CurrentData[i]
        if type(entry) == "table" then
            CreateWordButton(entry.word, entry.display)
        else
            CreateWordButton(entry)
        end
    end
    
    RenderedCount = target
    updateScroll(LMG2L["ScrollingFrame_a"], ModulesLayout, ModulesPadding)
end

-- INFINITE SCROLL LISTENER
LMG2L["ScrollingFrame_a"]:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
    local scroll = LMG2L["ScrollingFrame_a"]
    -- Update Size first
    updateScroll(scroll, ModulesLayout, ModulesPadding)
    
    -- Check if near bottom
    if scroll.CanvasPosition.Y + scroll.AbsoluteWindowSize.Y >= scroll.AbsoluteCanvasSize.Y - 100 then
        RenderNextBatch()
    end
end)

-- SEARCH LOGIC
SearchBox.Focused:Connect(function() SearchBox.PlaceholderText = "" end)
SearchBox.FocusLost:Connect(function() if SearchBox.Text == "" then SearchBox.PlaceholderText = "Search..." end end)

local SearchDebounce = 0
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local thisSearch = tick()
    SearchDebounce = thisSearch
    
    -- Clear List Immediately
    for _, child in pairs(ModuleContainer:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    RenderedCount = 0
    LMG2L["ScrollingFrame_a"].CanvasPosition = Vector2.new(0,0)
    
    local RawInput = SearchBox.Text 
    local LowerInput = RawInput:lower()
    
    -- If empty, show active category data
    if LowerInput == "" then
        if ActiveCategoryButton and ActiveCategoryButton:GetAttribute("CategoryData") then
            -- Restore original category list
            CurrentData = Library.Categories[ActiveCategoryButton.Name] or {}
            RenderNextBatch()
        end
        return
    end

    -- Perform Search (Search Data, Not UI)
    local HIGHLIGHT_COLOR = '<font color="#FF0000"><b>'
    local END_COLOR = '</b></font>'
    local isWildcard = string.find(LowerInput, "_") ~= nil
    local isSubstringMode = string.sub(LowerInput, 1, 1) == " "
    local query = LowerInput
    if isSubstringMode then query = string.sub(LowerInput, 2) end
    
    local matches = {}
    
    -- Search through ALL loaded words (Assuming we have access to a master list, or just the current category)
    -- For global search, we iterate all categories if needed, but for now lets search the ACTIVE category
    local sourceList = Library.Categories[ActiveCategoryButton and ActiveCategoryButton.Name or ""] or {}
    
    task.spawn(function()
        for _, rawWord in ipairs(sourceList) do
            if SearchDebounce ~= thisSearch then return end -- Cancel old search
            
            local lowerWord = rawWord:lower()
            local matchFound = false
            local highlightedText = rawWord
            
            if isWildcard then
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
                            isMatch = false; break
                        end
                    end
                    if isMatch then
                        matchFound = true
                        highlightedText = builtString
                    end
                end
            elseif isSubstringMode then
                local s, e = string.find(lowerWord, query, 1, true)
                if s then
                    matchFound = true
                    local pre = string.sub(rawWord, 1, s - 1)
                    local mid = string.sub(rawWord, s, e)
                    local post = string.sub(rawWord, e + 1)
                    highlightedText = pre .. HIGHLIGHT_COLOR .. mid .. END_COLOR .. post
                end
            else
                if string.sub(lowerWord, 1, #query) == query then
                    matchFound = true
                    local pre = string.sub(rawWord, 1, #query)
                    local post = string.sub(rawWord, #query + 1)
                    highlightedText = HIGHLIGHT_COLOR .. pre .. END_COLOR .. post
                end
            end
            
            if matchFound then
                table.insert(matches, {word = rawWord, display = highlightedText})
                if #matches >= SEARCH_RESULT_LIMIT then break end -- Limit results for speed
            end
        end
        
        if SearchDebounce == thisSearch then
            CurrentData = matches
            RenderNextBatch() -- Render first batch of results
        end
    end)
end)

-- MINIMIZE
local function MinimizeGui()
    LMG2L["Base_2"].Visible = false
    OpenButton.Visible = true
end
local function OpenGui()
    LMG2L["Base_2"].Visible = true
    OpenButton.Visible = false
end
LMG2L["Minimize_4"].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then MinimizeGui() end
end)
OpenButton.MouseButton1Click:Connect(function() OpenGui() end)

-- LIBRARY FUNCTIONS
Library.Categories = {} -- Stores data for each category

function Library:AddCategory(categoryName, wordsTable)
    -- Store data in memory
    Library.Categories[categoryName] = wordsTable
    
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
    btn:SetAttribute("CategoryData", true)
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        if ActiveCategoryButton then
            TweenService:Create(ActiveCategoryButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(180, 180, 180), BackgroundTransparency = 1}):Play()
        end
        ActiveCategoryButton = btn
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(142, 255, 0), BackgroundTransparency = 0.9}):Play()

        -- Reset View
        SearchBox.Text = "" -- Clear search
        for _, child in pairs(ModuleContainer:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        -- Load Data & Initial Batch
        CurrentData = Library.Categories[categoryName]
        RenderedCount = 0
        LMG2L["ScrollingFrame_a"].CanvasPosition = Vector2.new(0,0)
        RenderNextBatch()
    end)
    updateScroll(CategoryContainer, CategoryLayout, CategoryPadding)
end

return Library
