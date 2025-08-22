#!/usr/bin/env python3
import curses
import time

def main(stdscr):
    curses.curs_set(0)  # Hide cursor
    stdscr.nodelay(1)   # Non-blocking input
    curses.start_color()
    curses.init_pair(1, curses.COLOR_RED, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_BLUE, curses.COLOR_BLACK)
    curses.init_pair(3, curses.COLOR_YELLOW, curses.COLOR_BLACK)
    curses.init_pair(4, curses.COLOR_GREEN, curses.COLOR_BLACK)
    
    dvd_art = [
        "⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⡀",
        "⠀⢠⣿⣿⡿⠀⠀⠈⢹⣿⣿⡿⣿⣿⣇⠀⣠⣿⣿⠟⣽⣿⣿⠇⠀⠀⢹⣿⣿⣿",
        "⠀⢸⣿⣿⡇⠀⢀⣠⣾⣿⡿⠃⢹⣿⣿⣶⣿⡿⠋⢰⣿⣿⡿⠀⠀⣠⣼⣿⣿⠏",
        "⠀⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⠀⠀⢿⣿⣿⠏⠀⠀⢸⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣸⣟⣁⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⣠⣴⣶⣾⣿⣿⣻⡟⣻⣿⢻⣿⡟⣛⢻⣿⡟⣛⣿⡿⣛⣛⢻⣿⣿⣶⣦⣄⡀⠀",
        "⠉⠛⠻⠿⠿⠿⠷⣼⣿⣿⣼⣿⣧⣭⣼⣿⣧⣭⣿⣿⣬⡭⠾⠿⠿⠿⠛⠉⠀"
    ]
    
    height, width = stdscr.getmaxyx()
    dvd_height = len(dvd_art)
    dvd_width = len(dvd_art[0])
    
    x, y = 1, 1
    dx, dy = 1, 1
    color_index = 0
    colors = [1, 2, 3, 4]
    
    while True:
        if stdscr.getch() == ord('q'):
            break
            
        x += dx
        y += dy
        
        if x <= 0 or x >= width - dvd_width:
            dx = -dx
            color_index = (color_index + 1) % 4
        if y <= 0 or y >= height - dvd_height:
            dy = -dy
            color_index = (color_index + 1) % 4
            
        stdscr.clear()
        for i, line in enumerate(dvd_art):
            stdscr.addstr(y + i, x, line, curses.color_pair(colors[color_index]))
        stdscr.refresh()
        
        time.sleep(0.1)

if __name__ == "__main__":
    curses.wrapper(main)
