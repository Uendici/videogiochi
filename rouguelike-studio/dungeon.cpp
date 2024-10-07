#include <iostream>
#include <vector>
#include <string>
#include <unistd.h>
#include <cstdlib>

constexpr auto W = 10;
constexpr auto H = 10;

using namespace std;

void print_entity(int x, int y, char glyph);
void init_map();
void clear();

char map[W][H];

void clear() {
    std::system("clear");
}

void init_map() {
    for(auto i = 0; i < H; i++) {
        for(auto j = 0; j < W; j++) {
            map[i][j] = '.';
        }
    }
}

void print_entity(int x, int y, char glyph) {
    map[y][x] = glyph;
}

int main() {
    char hero_glyph = '@';
    int hero_x = 5, hero_y = 7;
    bool running = true;
    cout << hero_glyph << " ti saluta\n";
    
    init_map();

    while (running) {
        clear();

        // Stampa la mappa prima di posizionare il personaggio
        for(auto i = 0; i < H; i++) {
            for(auto j = 0; j < W; j++) {
                cout << map[i][j];
            }
            cout << endl;
        }

        // Posizionamento eroe
        // Ripristina la posizione precedente
        map[hero_y][hero_x] = '.'; // Mette un punto dove il personaggio era

        // Richiesta dell'input per il comando
        char cmd;
        cout << endl << "> ";
        cin >> cmd;

        // Gestione dei comandi
        if (cmd == 'q') { // Quit command
            running = false;
        } else {
            if (cmd == 'd') { // Spostamento a destra
                if (hero_x < W - 1) { // Assicurati che il personaggio non esca dalla mappa
                    hero_x++;
                }
            }
            if (cmd == 'a') { // Spostamento a sinistra
                if (hero_x > 0) { // Assicurati che il personaggio non esca dalla mappa
                    hero_x--;
                }
            }
            if (cmd == 'w') { // Spostamento in alto
                if (hero_y > 0) { // Assicurati che il personaggio non esca dalla mappa
                    hero_y--;
                }
            }
            if (cmd == 's') { // Spostamento in basso
                if (hero_y < H - 1) { // Assicurati che il personaggio non esca dalla mappa
                    hero_y++;
                }
            }
        }

        // Posiziona di nuovo l'eroe dopo aver gestito il comando
        print_entity(hero_x, hero_y, hero_glyph);
    }
    return 0;
}
