local module = {}

module.Init = function()
    local classA = _G.class.New(11)
    local classB = _G.class.New(123456789)

    classA:Print()
    classB:Print()

end
module.Start = function()
    print(0.1)
end

return module