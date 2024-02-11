#line 1 "C:/Users/hp/Desktop/Security System by PIC16f877A/Securitysystem.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;
char keypadPort at PORTC;
char pass[6] = "12345";
char pass_input[6];
short i = 0, k = 0;
int Q = 0;
char key4x3(short x){
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
trisd = 0;
RD0_bit = 0;
RD1_bit = 0;
Lcd_Init();
Keypad_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "Hello^_^");
Delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "Enter Password: ");
while (1){
do{
k = Keypad_Key_Click();
delay_ms(100);
if(k != 0){
if (key4x3(k) == '#'){
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1, 1, "Enter Password: ");
RD0_bit = 0;
RD1_bit = 0;
i = 0;
Q = 0;
}else{
pass_input[i] = key4x3(k);
lcd_chr(2, i + 1, pass_input[i]);
i++;
}
}
}
while(i < 5);
if(strcmp(pass, pass_input) == 0){
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "Correct Password");
Lcd_Out(2, 1, "Welcome^_^");
RD0_bit = 1;
delay_ms(2000);
Q = 0;
}else{
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "Wrong Password!");
Lcd_Out(2, 1, "Try again..");
RD0_bit = 0;
delay_ms(2000);
Q++;
}
if( Q == 3 ){
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "warning!!");
Lcd_Out(2, 1, "system break");
RD1_bit = 1;
break;
}else{
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "Enter Password: ");
i = 0;
}
}
}
