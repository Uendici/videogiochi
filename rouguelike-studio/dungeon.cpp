#include <iostream>
#include <vector>
#include <string>
#include <unistd.h>
#include <pwd.h>


constexpr auto W = 10;
constexpr auto H = 10;

using namespace std;

void print_entity(int x, int y, char glyph);
void init_map();
void clear();

char map[W][H];

void clear(){
    COORD topleft = { 0, 0};
    HANDLE console = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO screen;

}
void init_map(){

    for(auto i = 0; i < H; i++){
        for(auto j = 0; j < W; j++){
            map[i][j] = '.';
        }
        
    }

}
void print_entity(int x, int y, char glyph){
    map[x][y] = glyph;
}
int main(){

    
    char hero_glyph = '@';
    int hero_x = 5,hero_y = 7;
    cout << hero_glyph << " ti saluta\n";

    //int map
    init_map();

    //posizionamento eroe
    print_entity(hero_x,hero_y,hero_glyph);
    //out mappa
    for(auto i = 0; i < H; i++){
        for(auto j = 0; j < W; j++){
            cout << map[i][j];
        }
        cout << endl;
    }
    return 0;
}