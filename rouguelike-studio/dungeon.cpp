#include <iostream>
constexpr auto W = 10;
constexpr auto H = 10;

using namespace std;

char map[W][H];

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