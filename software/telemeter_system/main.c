#include "system.h"
#include "unistd.h"
#include "stdio.h"

#define TELEMETRE_BASE ((volatile int*) 0x00081070)  // Replace with
#define SEG7_DISPLAY_BASE ((volatile int*)0x00081000)


const unsigned char SevenSeg[10] = { // Table de correspondance 7 segments
    0x3F, // 0
    0x06, // 1
    0x5B, // 2
    0x4F, // 3
    0x66, // 4
    0x6D, // 5
    0x7D, // 6
    0x07, // 7
    0x7F, // 8
    0x6F  // 9
};

// Fonction pour afficher la valeur sur un afficheur 7 segments
void display_7seg(int value) {
    int digit1 = value % 10;         // Unités
    int digit2 = (value / 10) % 10;  // Dizaines
    int digit3 = (value / 100) % 10; // Centaines

    // Écriture dans les registres PIO via pointeurs mémoire
    *(SEG7_DISPLAY_BASE + 0) = ~SevenSeg[digit1];
    *(SEG7_DISPLAY_BASE + 1) = ~SevenSeg[digit2];
    *(SEG7_DISPLAY_BASE + 2) = ~SevenSeg[digit3];
}

int main() {
    printf("Nios II: Telemetre US Distance Measurement\n");
    fflush(stdout);

    while (1) {
        // Lire la distance depuis le télémètre via accès mémoire direct
        int distance = *TELEMETRE_BASE;

        // Afficher la distance
        printf("Distance: %d cm\n", distance);
        fflush(stdout);

        // Affichage sur le 7 segments
        display_7seg(distance);

        // Pause de 500ms
        usleep(5000);

    }

    return 0;
}
