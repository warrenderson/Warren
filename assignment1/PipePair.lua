--[[
    PipePair Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Used to represent a pair of pipes that stick together as they scroll, providing an opening
    for the player to jump through in order to score a point.
]]

PipePair = Class{}

-- size of the gap between pipes
local GAP_HEIGHT = math.random(90, 150)
--local INIT_RANDOMIZED = math.random(40, 280) / 3

function PipePair:init(y)
    -- flag to hold whether this pair has been scored (jumped through)
    self.scored = false

    -- initialize pipes past the end of the screen
    self.x = VIRTUAL_WIDTH --+ INIT_RANDOMIZED

    -- y value is for the topmost pipe; gap is a vertical shift of the second lower pipe
    self.y = y

    -- instantiate two pipes that belong to this pair
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
    }

    -- whether this pipe pair is ready to be removed from the scene
    self.remove = false

    -- Gap Randomizer: every time a new pipe is spawned the next Gap is randomized.
    GAP_HEIGHT = math.random(90, 150)

end

function PipePair:update(dt)



    -- remove the pipe from the scene if it's beyond the left edge of the screen,
    -- else move it from right to left
    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        
        self.remove = true
    end
     -- Spawn Randomizer: every time a pipe is removed the next Spawn is randomized.
    --INIT_RANDOMIZED = math.random(40 , 280) / 3
end

function PipePair:render()
    for l, pipe in pairs(self.pipes) do
        pipe:render()
    end
end