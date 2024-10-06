local t = {}

export type SignalConfig = {
    QUEUE_PERIOD: number,
    DEBUG_PRINTS: boolean,
    MIDDLEWARE_IN: boolean,
    MIDDLEWARE_OUT: boolean
}

function t.AffirmType(value, type)
    if typeof(value) ~= type then
        return false, `Type mismatch for {value}: {typeof(value)}, expected type: {type}`
    end
    return true
end

function t.AffirmTypes(values: table, types: table)
    for index, value in values do
        if typeof(value) ~= types[index] and types[index] ~= nil then
            return false, `Type mismatch for {value}: {typeof(value)}, expected type: {types[index]}`
        end
    end
    return true
end

function t.AffirmTypesStrict(values: table, types: table)
    for index, value in values do
        if typeof(value) ~= types[index] then
            return false, `Type mismatch for {value}: {typeof(value)}, expected type: {types[index]}`
        end
    end 
    return true
end


return t