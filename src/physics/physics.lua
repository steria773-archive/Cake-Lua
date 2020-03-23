-- Created By Rabia Alhaffar In 7/March/2020
-- Physics Core Port Of JavaScript Version
local js = require("js")
local math = require("math")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
CheckCollisionRect = function(r1,r2)
    return r1.x < r2.x + r2.width and
           r1.x + r1.width > r2.x and 
           r1.y < r2.y + r2.height and
           r1.y + r1.height > r2.y and
           r1.collidable and
           r2.collidable
end
CheckCollisionRectAdvanced = function(r1_x,r1_y,r1_width,r1_height,r2_x,r2_y,r2_width,r2_height)
    return r1_x < r2_x + r2_width and
           r1_x + r1_width > r2_x and
           r1_y < r2_y + r2_height and
           r1_y + r1_height > r2_y
end
CheckCollisionCircle = function(c1,c2)
    return math.sqrt((c1.x - c2.x * c1.x - c2.x) + (c1.y + c2.y * c1.y + c2.y)) < c1.radius + c2.radius and
    c1.collidable and
    c2.collidable
end
CheckCollisionCircleAdvanced = function(c1_x,c1_y,c1_r,c2_x,c2_y,c2_r)
    return math.sqrt((c1_x - c2_x * c1_x - c2_x) + (c1_y + c2_y * c1_y + c2_y)) < c1_r + c2_r
end
CheckCollisionCircleRect = function(c1,r1)
    if math.abs(c1.x - r1.x - r1.width / 2) > (r1.width / 2 + c1.radius) or
    math.abs(c1.y - r1.y - r1.height / 2) > (r1.height / 2 + c1.radius) then 
        return false
    end

    if math.abs(c1.x - r1.x - r1.width / 2) <= (r1.width / 2) or
    math.abs(c1.y - r1.y - r1.height / 2) <= (r1.height / 2) then 
        return true
    end
    return (math.abs(c1.x - r1.x - r1.width / 2) - r1.width / 2 * math.abs(c1.x - r1.x - r1.width / 2) - r1.width / 2 + math.abs(c1.y - r1.y - r1.height / 2) - r1.height / 2 * math.abs(c1.y - r1.y - r1.height / 2) - r1.height / 2 <= (c1.radius * c1.radius)) and c1.collidable and r1.collidable
end
CheckCollisionCircleRectAdvanced = function(c1_x,c1_y,c1_r,r1_x,r1_y,r1_width,r1_height)

    if math.abs(c1_x - r1_x - r1_width / 2) > (r1_width / 2 + c1_r) or
    math.abs(c1_y - r1_y - r1_height / 2) > (r1_height / 2 + c1_r) then return false end
    
    if (math.abs(c1_x - r1_x - r1_width / 2) <= (r1_width / 2) or
    math.abs(c1_y - r1_y - r1_height / 2) <= (r1_height / 2)) then return true end

    return math.abs(c1_x - r1_x - r1_width / 2) - r1_width / 2 * math.abs(c1_x - r1_x - r1_width / 2) - r1_width / 2 + math.abs(c1_y - r1_y - r1_height / 2) - r1_height / 2 * math.abs(c1_y - r1_y - r1_height / 2) - r1_height / 2 <= (c1_r * c1_r) 
end
CheckCanvasCollisionLeft = function(object)
    return object.x <= object.width * 0.5
end
CheckCanvasCollisionRight = function(object)
    return object.x + object.width >= cakecanvas.width + object.width * 0.5
end
CheckCanvasCollisionTop = function(object)
    return object.y <= object.height * 0.5 
end
CheckCanvasCollisionBottom = function(object)
    return object.y + object.height >= cakecanvas.height + object.height * 0.5
end
CheckCanvasCollisionLeftAdvanced = function(object_x,object_width)
    return object_x <= object_width * 0.5
end
CheckCanvasCollisionRightAdvanced = function(object_x,object_width)
    return object_x + object_width >= cakecanvas.width + object_width * 0.5
end
CheckCanvasCollisionTopAdvanced = function(object_y,object_height)
    return object_y <= object_height * 0.5
end
CheckCanvasCollisionBottomAdvanced = function(object_y,object_height)
    return object_y + object_height >= cakecanvas.height + object_height * 0.5
end
CheckCollisionCircleLeftCanvas = function(c1)
    return c1.x + c1.speedX < c1.radius;
end
CheckCollisionCircleLeftCanvasAdvanced = function(c1_x,c1_speedX,c1_r)
    return c1_x + c1_speedX < c1_r;
end
CheckCollisionCircleRightCanvas = function(c1)
    return c1.x + c1.speedX > cakecanvas.width - c1.radius;
end
CheckCollisionCircleRightCanvasAdvanced = function(c1_x,c1_speedX,c1_r)
    return c1_x + c1_speedX > cakecanvas.width - c1_r;
end
CheckCollisionCircleTopCanvas = function(c1)
    return c1.y + c1.speedY < c1.radius;
end
CheckCollisionCircleTopCanvasAdvanced = function(c1_y,c1_speedY,c1_r)
    return c1_y + c1_speedY < c1_r;
end
CheckCollisionCircleBottomCanvas = function(c1)
    return c1.y + c1.speedY > cakecanvas.height - c1.radius;
end
CheckCollisionCircleBottomCanvasAdvanced = function(c1_y,c1_speedY,c1_r)
    return c1_y + c1_speedY > cakecanvas.height - c1_r;
end

CheckCollisionPointSphere = function(point,sphere)
    return math.sqrt((point.x - sphere.x) * (point.x - sphere.x) +
                     (point.y - sphere.y) * (point.y - sphere.y) +
                     (point.z - sphere.z) * (point.z - sphere.z)) < sphere.radius
end

CheckCollisionSpheres = function(sphere1,sphere2)
    return math.sqrt((sphere1.x - sphere2.x) * (sphere1.x - sphere2.x) +
                     (sphere1.y - sphere2.y) * (sphere1.y - sphere2.y) +
                     (sphere1.z - sphere2.z) * (sphere1.z - sphere2.z)) < (sphere1.radius + sphere2.radius)
end

CheckCollisionCubes = function(cube1,cube2)
    if math.abs(cube1.x - cube2.x) < cube1.size + cube2.size then
      if math.abs(cube1.y - cube2.y) < cube1.size + cube2.size then
          if math.abs(cube1.z - cube2.z) < cube1.size + cube2.size then return true end
        end
    end
end

CheckCollisionCuboids = function(cuboid1,cuboid2)
    if math.abs(cuboid1.x - cuboid2.x) < cuboid1.scalation[1] + cuboid2.scalation[1] then
        if math.abs(cuboid1.y - cuboid2.y) < cuboid1.scalation[2] + cuboid2.scalation[2] then
            if math.abs(cuboid1.z - cuboid2.z) < cuboid1.scalation[3] + cuboid2.scalation[3] then return true end
          end
      end
end
