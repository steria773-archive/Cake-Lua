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

-- TV Keys (Tested Well On Panasonic,Smart TV Remotes)
TVKey =
{
    Panasonic =
    {
        Up = 38,
        Down = 40,
        Left = 37,
        Right = 39,
        ChannelUp = 516,
        ChannelDown = 517,
        F0 = 588,
        F1 = 589,
        F2 = 590,
        F3 = 591,
        Enter = 13,
        Aspect = 642,
        Info = 615,
        Return = 8,
        Option = 623,
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
        LastView = 651,
        Play = 250,
        Pause = 19,
        Stop = 178,
        Record = 603,
        SkipToNext = 176,
        SkipToPrevious = 177,
        Next = 228,
        Previous = 227
    },
    Tizen =
    {
        Up = 38,
        Down = 40,
        Left = 37,
        Right = 39,
        Enter = 13,
        Back = 10009,
        VolumeUp = 447,
        VolumeDown = 448,
        VolumeMute = 449,
        ChannelUp = 427,
        ChannelDown = 428,
        ChannelList = 10073,
        F0 = 403,
        F1 = 404,
        F2 = 405,
        F3 = 406,
        MediaPlayPause = 10252,
        MediaRewind = 412,
        MediaFastForward = 417,
        MediaPlay = 415,
        MediaPause = 19,
        MediaStop = 413,
        MediaRecord = 416,
        MediaTrackPrevious = 10232,
        MediaTrackNext = 10233,
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
        Minus = 189,
        PreviousChannel = 10190,
        Menu = 18,
        Tools = 10135,
        Info = 457,
        Source = 10072,
        Exit = 10182,
        Caption = 10221,
        EManual = 10146,
        _3D = 10199,
        Extra = 10253,
        PictureSize = 10140,
        Soccer = 10228,
        Teletext = 10200,
        MTS = 10195,
        Search = 10225,
        Guide = 458 
    },
    WebOS =
    {
        Up = 0x26,
        Down = 0x28,
        Left = 0x25,
        Right = 0x27,
        OK = 0x0D,
        Back = 0x1CD,
        F0 = 0x193,
        F1 = 0x194,
        F2 = 0x195,
        F3 = 0x196
    },
    LG_HDCP =
    {
        Power = 0x08,
        Energy = 0x95,
        AV = 0x30,
        Input = 0x0B,
        TVRAD = 0xF0,
        ZERO = 0x10,
        ONE = 0x11,
        TWO = 0x12,
        THREE = 0x13,
        FOUR = 0x14,
        FIVE = 0x15,
        SIX = 0x16,
        SEVEN = 0x17,
        EIGHT = 0x18,
        NINE = 0x19,
        List = 0x53,
        QView = 0x1A,
        VolumeUp = 0x02,
        VolumeDown = 0x03,
        Favorites = 0x1E,
        Ratio = 0x79,
        Mute = 0x09,
        ChannelUp = 0x00,
        ChannelDown = 0x01,
        Menu = 0x43,
        Home = 0x23,
        Widgets = 0x58,
        Netcast = 0x59,
        QMenu = 0x45,
        _3D = 0xDC,
        Up = 0x40,
        Down = 0x41,
        Left = 0x07,
        Right = 0x06,
        OK = 0x44,
        Back = 0x28,
        Guide = 0xA9,
        Exit = 0x5B,
        F0 = 0x72,
        F1 = 0x71,
        F2 = 0x63,
        F3 = 0x61,
        _3DSetup = 0x61,
        Text = 0x20,
        TextOptions = 0x21,
        Subtitles = 0x39,
        LiveTV = 0x9E,
        Record = 0xBD,
        Stop = 0xB1,
        Play = 0xB0,
        Pause = 0xBA,
        Next = 0x8E,
        Previous = 0x8F,
        Simplink = 0x7E,
        Info = 0xAA,
        App = 0x9F,
        AD =91
    }
};

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