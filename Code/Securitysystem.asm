
_key4x3:

;Securitysystem.c,20 :: 		char key4x3(short x){ // Function to return key number
;Securitysystem.c,22 :: 		switch(x){
	GOTO       L_key4x30
;Securitysystem.c,23 :: 		case 1: kp = '1'; break;
L_key4x32:
	MOVLW      49
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,24 :: 		case 2: kp = '2'; break;
L_key4x33:
	MOVLW      50
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,25 :: 		case 3: kp = '3'; break;
L_key4x34:
	MOVLW      51
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,26 :: 		case 5: kp = '4'; break;
L_key4x35:
	MOVLW      52
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,27 :: 		case 6: kp = '5'; break;
L_key4x36:
	MOVLW      53
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,28 :: 		case 7: kp = '6'; break;
L_key4x37:
	MOVLW      54
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,29 :: 		case 9: kp = '7'; break;
L_key4x38:
	MOVLW      55
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,30 :: 		case 10: kp = '8'; break;
L_key4x39:
	MOVLW      56
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,31 :: 		case 11: kp = '9'; break;
L_key4x310:
	MOVLW      57
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,32 :: 		case 13: kp = '*'; break;
L_key4x311:
	MOVLW      42
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,33 :: 		case 14: kp = '0'; break;
L_key4x312:
	MOVLW      48
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,34 :: 		case 15: kp = '#'; break;
L_key4x313:
	MOVLW      35
	MOVWF      R1+0
	GOTO       L_key4x31
;Securitysystem.c,35 :: 		}
L_key4x30:
	MOVF       FARG_key4x3_x+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_key4x32
	MOVF       FARG_key4x3_x+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_key4x33
	MOVF       FARG_key4x3_x+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_key4x34
	MOVF       FARG_key4x3_x+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_key4x35
	MOVF       FARG_key4x3_x+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_key4x36
	MOVF       FARG_key4x3_x+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_key4x37
	MOVF       FARG_key4x3_x+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_key4x38
	MOVF       FARG_key4x3_x+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_key4x39
	MOVF       FARG_key4x3_x+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_key4x310
	MOVF       FARG_key4x3_x+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_key4x311
	MOVF       FARG_key4x3_x+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_key4x312
	MOVF       FARG_key4x3_x+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_key4x313
L_key4x31:
;Securitysystem.c,36 :: 		return kp;
	MOVF       R1+0, 0
	MOVWF      R0+0
;Securitysystem.c,37 :: 		}
L_end_key4x3:
	RETURN
; end of _key4x3

_main:

;Securitysystem.c,38 :: 		void main(){
;Securitysystem.c,39 :: 		trisd = 0; // Define D as output
	CLRF       TRISD+0
;Securitysystem.c,40 :: 		RD0_bit = 0; // Turn off RD0 portd.f0 = 0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;Securitysystem.c,41 :: 		RD1_bit = 0; // Turn off RD1 portd.f1 = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;Securitysystem.c,42 :: 		Lcd_Init(); // Inialize LCD screen
	CALL       _Lcd_Init+0
;Securitysystem.c,43 :: 		Keypad_Init(); // Inialize keypad
	CALL       _Keypad_Init+0
;Securitysystem.c,44 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,46 :: 		Lcd_Out(1, 1, "Hello^_^"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,47 :: 		Delay_ms(1000); // Wait 1 seconds
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;Securitysystem.c,48 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,49 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,50 :: 		Lcd_Out(1, 1, "Enter Password: "); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,51 :: 		while (1){
L_main15:
;Securitysystem.c,52 :: 		do{
L_main17:
;Securitysystem.c,53 :: 		k = Keypad_Key_Click(); // read clicked keypad keys
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _k+0
;Securitysystem.c,54 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;Securitysystem.c,55 :: 		if(k != 0){ //has the user pressed on a key? // if a new key clicked
	MOVF       _k+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;Securitysystem.c,56 :: 		if (key4x3(k) == '#'){ // if pressed key ='#' clear screen
	MOVF       _k+0, 0
	MOVWF      FARG_key4x3_x+0
	CALL       _key4x3+0
	MOVF       R0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;Securitysystem.c,57 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,58 :: 		Lcd_Out(1, 1, "Enter Password: "); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,59 :: 		RD0_bit = 0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;Securitysystem.c,60 :: 		RD1_bit = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;Securitysystem.c,61 :: 		i = 0; // reset counter
	CLRF       _i+0
;Securitysystem.c,62 :: 		Q = 0; // reset counter
	CLRF       _Q+0
	CLRF       _Q+1
;Securitysystem.c,63 :: 		}else{ // Store pressed key in input array and print it on lcd sceen
	GOTO       L_main23
L_main22:
;Securitysystem.c,64 :: 		pass_input[i] = key4x3(k);
	MOVF       _i+0, 0
	ADDLW      _pass_input+0
	MOVWF      FLOC__main+0
	MOVF       _k+0, 0
	MOVWF      FARG_key4x3_x+0
	CALL       _key4x3+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Securitysystem.c,65 :: 		lcd_chr(2, i + 1, pass_input[i]); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDLW      _pass_input+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Securitysystem.c,66 :: 		i++; // increment input numbers counter
	INCF       _i+0, 1
;Securitysystem.c,67 :: 		}
L_main23:
;Securitysystem.c,68 :: 		}
L_main21:
;Securitysystem.c,70 :: 		while(i < 5); // If input keys = 5 go to next step to check password
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      5
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;Securitysystem.c,71 :: 		if(strcmp(pass, pass_input) == 0){ // if password is correct
	MOVLW      _pass+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _pass_input+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      0
	XORWF      R0+0, 0
L__main32:
	BTFSS      STATUS+0, 2
	GOTO       L_main24
;Securitysystem.c,72 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,73 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,74 :: 		Lcd_Out(1, 1, "Correct Password"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,75 :: 		Lcd_Out(2, 1, "Welcome^_^"); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,76 :: 		RD0_bit = 1; // Turn on relay
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;Securitysystem.c,77 :: 		delay_ms(2000); // Wait 2 seconds
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;Securitysystem.c,78 :: 		Q = 0; // reset counter
	CLRF       _Q+0
	CLRF       _Q+1
;Securitysystem.c,79 :: 		}else{ // If password is wronge
	GOTO       L_main26
L_main24:
;Securitysystem.c,80 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,81 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,82 :: 		Lcd_Out(1, 1, "Wrong Password!"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,83 :: 		Lcd_Out(2, 1, "Try again.."); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,84 :: 		RD0_bit = 0; // Turn off relay
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;Securitysystem.c,85 :: 		delay_ms(2000); // Wait 2 seconds
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;Securitysystem.c,86 :: 		Q++; // count +110
	INCF       _Q+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Q+1, 1
;Securitysystem.c,87 :: 		}
L_main26:
;Securitysystem.c,88 :: 		if( Q == 3 ){
	MOVLW      0
	XORWF      _Q+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      3
	XORWF      _Q+0, 0
L__main33:
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;Securitysystem.c,89 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,90 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,91 :: 		Lcd_Out(1, 1, "warning!!"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,92 :: 		Lcd_Out(2, 1, "system break"); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,93 :: 		RD1_bit = 1; // Turn on D1
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;Securitysystem.c,94 :: 		break;
	GOTO       L_main16
;Securitysystem.c,95 :: 		}else{
L_main28:
;Securitysystem.c,96 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,97 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Securitysystem.c,98 :: 		Lcd_Out(1, 1, "Enter Password: "); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Securitysystem+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Securitysystem.c,99 :: 		i = 0;
	CLRF       _i+0
;Securitysystem.c,101 :: 		}
	GOTO       L_main15
L_main16:
;Securitysystem.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
