// Lcd pinout settings
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;
// Pin direction
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;
char keypadPort at PORTC; // Configure Keypad connection at port C
char pass[6] = "12345"; // Password = 12345
char pass_input[6]; // Array to read input password
short i = 0, k = 0; // i "count number if inputs" , k = "Read index of pressed key"
int Q = 0; // O "count number for wrong enter"
char key4x3(short x){ // Function to return key number
char kp;
switch(x){
case 1: kp = '1'; break;
case 2: kp = '2'; break;
case 3: kp = '3'; break;
case 5: kp = '4'; break;
case 6: kp = '5'; break;
case 7: kp = '6'; break;
case 9: kp = '7'; break;
case 10: kp = '8'; break;
case 11: kp = '9'; break;
case 13: kp = '*'; break;
case 14: kp = '0'; break;
case 15: kp = '#'; break;
}
return kp;
}
void main(){
trisd = 0; // Define D as output
RD0_bit = 0; // Turn off RD0 portd.f0 = 0;
RD1_bit = 0; // Turn off RD1 portd.f1 = 0;
Lcd_Init(); // Inialize LCD screen
Keypad_Init(); // Inialize keypad
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "Hello^_^"); // Write text in first row
Delay_ms(1000); // Wait 1 seconds
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "Enter Password: "); // Write text in first row
while (1){
do{
k = Keypad_Key_Click(); // read clicked keypad keys
delay_ms(100);
if(k != 0){ //has the user pressed on a key? // if a new key clicked
if (key4x3(k) == '#'){ // if pressed key ='#' clear screen
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Out(1, 1, "Enter Password: "); // Write text in first row
RD0_bit = 0;
RD1_bit = 0;
i = 0; // reset counter
Q = 0; // reset counter
}else{ // Store pressed key in input array and print it on lcd sceen
pass_input[i] = key4x3(k);
lcd_chr(2, i + 1, pass_input[i]); // Write text in second row
i++; // increment input numbers counter
}
}
}
while(i < 5); // If input keys = 5 go to next step to check password
if(strcmp(pass, pass_input) == 0){ // if password is correct
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "Correct Password"); // Write text in first row
Lcd_Out(2, 1, "Welcome^_^"); // Write text in second row
RD0_bit = 1; // Turn on relay
delay_ms(2000); // Wait 2 seconds
Q = 0; // reset counter
}else{ // If password is wronge
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "Wrong Password!"); // Write text in first row
Lcd_Out(2, 1, "Try again.."); // Write text in second row
RD0_bit = 0; // Turn off relay
delay_ms(2000); // Wait 2 seconds
Q++; // count +110
}
if( Q == 3 ){
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "warning!!"); // Write text in first row
Lcd_Out(2, 1, "system break"); // Write text in second row
RD1_bit = 1; // Turn on D1
break;
}else{
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "Enter Password: "); // Write text in first row
i = 0;
}
}
}