--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    trophyGold = love.graphics.newImage('Bronze.png')

end

function ScoreState:update(dt)
    -- go back to play if enter is pressed

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 45, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 80, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')

    

    if self.score >= 2 and self.score < 2
    then
        love.graphics.printf('CONTRATS, You earned a Bronze Medal!', 0, 200, VIRTUAL_WIDTH, 'center')
        trophyGold = love.graphics.newImage('Bronze.png')
    love.graphics.draw(trophyGold, VIRTUAL_WIDTH / 2 - 98/2, VIRTUAL_HEIGHT / 2 - 133/2)
    end

    if self.score >= 4 and self.score < 3
    then
        love.graphics.printf('CONTRATS, You earned a Silver Medal!', 0, 200, VIRTUAL_WIDTH, 'center')
        trophyGold = love.graphics.newImage('Silver.png')
    love.graphics.draw(trophyGold, VIRTUAL_WIDTH / 2 - 98/2, VIRTUAL_HEIGHT / 2 - 133/2)
    end

    if self.score >= 8
    then
        love.graphics.printf('CONTRATS, You earned a Gold Medal!', 0, 200, VIRTUAL_WIDTH, 'center')
        trophyGold = love.graphics.newImage('Gold.png')
        love.graphics.draw(trophyGold, VIRTUAL_WIDTH / 2 - 98/2, VIRTUAL_HEIGHT / 2 - 133/2)
    end

end

