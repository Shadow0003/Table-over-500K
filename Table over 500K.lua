
local _shad = _G['gg']
 
local function removeResultsInBatches(batchSize, maxResults)
    local totalResults = _shad.getResultsCount()
    
    while totalResults > 0 and maxResults > 0 do

        local currentBatchSize = math.min(batchSize, maxResults)
        local results = _shad.getResults(currentBatchSize)
        _shad.removeResults(results)

        totalResults = _shad.getResultsCount()
        maxResults = maxResults - currentBatchSize
    end
end

_shad.searchPointer(0)

local batchSize = 100000
local maxResults = 500000
removeResultsInBatches(batchSize, maxResults)
