-- Created By Rabia Alhaffar In 10/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

RandomAlpha = math.random()
u = nil

-- Colors
RED = "red"
ORANGE = "orange"
YELLOW = "yellow"
GREEN = "green"
BLUE = "blue"
PINK = "pink"
PURPLE = "purple"
WHITE = "white"
BLACK = "black"
GREY = "grey"
SILVER = "silver"
CYAN = "cyan"

-- XBOX Gamepad Keys
XBKey = 
{
    A = 0,
    B = 1,
    X = 2,
    Y = 3,
    LB = 4,
    RB = 5,
    LT = 6,
    RT = 7,
    Back = 8,
    Start = 9,
    LeftAnalogStick = 10,
    RightAnalogStick = 11,
    Up = 12,
    Down = 13,
    Left = 14,
    Right = 15
}

-- PlayStation Gamepad Keys
PSKey = 
{
    X = 0,
    O = 1,
    Square = 2,
    Triangle = 3,
    L1 = 4,
    R1 = 5,
    L2 = 6,
    R2 = 7,
    Select = 8,
    Start = 9,
    LeftAnalogStick = 10,
    RightAnalogStick = 11,
    Up = 12,
    Down = 13,
    Left = 14,
    Right = 15
}

-- TV Keys (Tested Well On Panasonic Remotes)
TVKey = 
{
    Up = 38,
    Down = 40,
    Left = 37,
    Right = 39,
    ChannelUp = 516,
    ChannelDown = 517,
    Enter = 13,
    Aspect = 642,
    Info = 615,
    Return = 8,
    Option = 623,
    Zero = 48,
    One = 49,
    Two = 50,
    Three = 51,
    Four = 52,
    Five = 53,
    Six = 54,
    Seven = 55,
    Eight = 56,
    Nine = 57,
    LastView = 651,
    Play = 250,
    Pause = 19,
    Stop = 178,
    Record = 603,
    Next = 228,
    Previous = 227,
    SkipToNext = 176,
    SkipToPrevious = 177
}

KeyboardKey = 
{
    Key = 
    {
        A = "a",
        B = "b",
        C = "c",
        D = "d",
        E = "e",
        F = "f",
        G = "g",
        H = "h",
        I = "i",
        J = "j",
        K = "k",
        L = "l",
        M = "m",
        N = "n",
        O = "o",
        P = "p",
        Q = "q",
        R = "r",
        S = "s",
        T = "t",
        U = "u",
        V = "v",
        W = "w",
        X = "x",
        Y = "y",
        Z = "z",
        ZERO = "0",
        ONE = "1",
        TWO = "2",
        THREE = "3",
        FOUR = "4",
        FIVE = "5",
        SIX = "6",
        SEVEN = "7",
        EIGHT = "8",
        NINE = "9",
        UP = "ArrowUp",
        DOWN = "ArrowDown",
        LEFT = "ArrowLeft",
        Right = "ArrowRight",
        SPACE = 32,
        TAB = "Tab",
        SHIFT = "Shift",
        CONTROL = "Control",
        ALT = "Alt",
        BACKSPACE = "Backspace",
        ENTER = "Enter",
        OS = "OS",
        UNIDENTIFIED = "Unidentified",
        HOME = "Home",
        PGUP = "PageUp",
        PGDN = "PageDown",
        CLEAR = "Clear",
        DELETE = "Delete",
        ESCAPE = "Escape",
        INSERT = "Insert"
    },

    KeyCode =
    {
        A = 65,
        B = 66,
        C = 67,
        D = 68,
        E = 69,
        F = 70,
        G = 71,
        H = 72,
        I = 73,
        J = 74,
        K = 75,
        L = 76,
        M = 77,
        N = 78,
        O = 79,
        P = 80,
        Q = 81,
        R = 82,
        S = 83,
        T = 84,
        U = 85,
        V = 86,
        W = 87,
        X = 88,
        Y = 89,
        Z = 90,
        ZERO = 48,
        ONE = 49,
        TWO = 50,
        THREE = 51,
        FOUR = 52,
        FIVE = 53,
        SIX = 54,
        SEVEN = 55,
        EIGHT = 56,
        NINE = 57,
        UP = 38,
        DOWN = 40,
        LEFT = 37,
        RIGHT = 39,
        SPACE = 32,
        TAB = 9,
        SHIFT = 16,
        CONTROL = 17,
        ALT = 18,
        BACKSPACE = 8,
        ENTER = 13,
        NUMLOCK = 144,
        OS = 91,
        UNIDENTIFIED = 0,
        HOME = 36,
        PGUP = 33,
        PGDN = 34,
        CLEAR = 12,
        DELETE = 46,
        ESCAPE = 27,
        INSERT = 45
    }
}

MouseButton =
{
    LEFT = 0,
    RIGHT = 2,
    MIDDLE = 1
}

Swap = function(a,b)
    disposed = a
    a = b
    b = disposed
end
