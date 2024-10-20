#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <map>

using namespace std;

const int VIEW_W = 10; // Larghezza della finestra visibile
const int VIEW_H = 10; // Altezza della finestra visibile

vector<vector<char>> global_map; // Mappa globale caricata dal file

struct Enemy {
    int x, y;
    bool alive = true;
};

// Nemici mappati dalle loro coordinate globali
map<pair<int, int>, Enemy> enemies;

// Funzioni per gestire la mappa e il movimento
void load_map_from_file(const string &filename);
void display_map(int view_x, int view_y, int hero_x, int hero_y);
void gestione_comandi(char cmd, int &hero_x, int &hero_y, int &view_x, int &view_y, bool &running);
void genera_nemico(int x, int y);

int main() {
    int hero_x = 5, hero_y = 7;  // Posizione dell'eroe
    int view_x = 0, view_y = 0;  // Coordinate della "finestra" di visualizzazione
    bool running = true;

    // Carica la mappa da file
    load_map_from_file("mappa.txt");

    // Genera un nemico (goblin) nella posizione globale [9][9]
    genera_nemico(9, 9);

    while (running) {
        // Cancella lo schermo (funzione di sistema)
        system("clear");

        // Mostra la finestra corrente della mappa
        display_map(view_x, view_y, hero_x, hero_y);

        // Richiedi input del giocatore
        char cmd;
        cout << "> ";
        cin >> cmd;

        // Gestisci il comando
        gestione_comandi(cmd, hero_x, hero_y, view_x, view_y, running);
    }

    return 0;
}

// Carica la mappa globale dal file
void load_map_from_file(const string &filename) {
    ifstream file(filename);
    string line;

    while (getline(file, line)) {
        vector<char> row(line.begin(), line.end());
        global_map.push_back(row);
    }

    file.close();
}

// Mostra una porzione della mappa globale (una finestra 10x10)
void display_map(int view_x, int view_y, int hero_x, int hero_y) {
    for (int i = view_y; i < view_y + VIEW_H; ++i) {
        for (int j = view_x; j < view_x + VIEW_W; ++j) {
            // Se l'eroe è in questa posizione, mostralo
            if (i == hero_y && j == hero_x) {
                cout << '@';
            }
            // Se c'è un nemico in questa posizione, mostralo solo se è vivo
            else if (enemies.find({j, i}) != enemies.end() && enemies[{j, i}].alive) {
                cout << '!';
            }
            // Altrimenti, mostra il contenuto della mappa
            else {
                cout << global_map[i][j];
            }
        }
        cout << endl;
    }
}

// Gestione dei comandi di movimento e cambiamento della finestra di visualizzazione
void gestione_comandi(char cmd, int &hero_x, int &hero_y, int &view_x, int &view_y, bool &running) {
    if (cmd == 'q') {
        running = false;
        return;
    }

    int new_hero_x = hero_x;
    int new_hero_y = hero_y;

    // Muovi l'eroe in base al comando
    if (cmd == 'w' && hero_y > 0) new_hero_y--;           // Su
    if (cmd == 's' && hero_y < global_map.size() - 1) new_hero_y++;   // Giù
    if (cmd == 'a' && hero_x > 0) new_hero_x--;           // Sinistra
    if (cmd == 'd' && hero_x < global_map[0].size() - 1) new_hero_x++; // Destra

    // Aggiorna la visualizzazione della mappa quando l'eroe raggiunge i bordi
    if (new_hero_x >= view_x + VIEW_W) view_x++;
    if (new_hero_x < view_x) view_x--;
    if (new_hero_y >= view_y + VIEW_H) view_y++;
    if (new_hero_y < view_y) view_y--;

    // Verifica se c'è un nemico nella nuova posizione dell'eroe
    if (enemies.find({new_hero_x, new_hero_y}) != enemies.end() && enemies[{new_hero_x, new_hero_y}].alive) {
        cout << "Combattimento con goblin!\n";
        enemies[{new_hero_x, new_hero_y}].alive = false;  // Goblin sconfitto
    }

    // Aggiorna la posizione dell'eroe
    hero_x = new_hero_x;
    hero_y = new_hero_y;
}

// Genera un nemico nella posizione data
void genera_nemico(int x, int y) {
    enemies[{x, y}] = {x, y, true};  // Aggiungi un nemico vivo alla posizione (x, y)
}
