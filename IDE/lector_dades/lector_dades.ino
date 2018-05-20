
const int bc0 = 9;
const int bc1 = 10;
const int bc2 = 11;
const int bc3 = 12;
const int enableInput = 13;

int enab = 0;
int lastEnab = 0;
int b0 = 0;
int b1 = 0;
int b2 = 0;
int b3 = 0;
int pos;
const char digits[17]="0123456789ABCD*#";

void setup() {
  Serial.begin(9600);
  pinMode(bc0, INPUT); 
  pinMode(bc1, INPUT); 
  pinMode(bc2, INPUT); 
  pinMode(bc3, INPUT); 
  pinMode(enableInput, INPUT);
  Serial.print("Inici!\n");  
}


void loop(){
  enab = digitalRead(enableInput);
  if (lastEnab != enab ) // enab change detected
    {
     if (enab == HIGH) //rising edge detected
     { 
      b0 = digitalRead(bc0); 
      b1 = digitalRead(bc1); 
      b2 = digitalRead(bc2); 
      b3 = digitalRead(bc3);
      pos = b3<<3 | b2 << 2 | b1<<1 | b0;
      
      Serial.print(digits[pos]);
     } // end rising edge detected
    } // end enab change detected
    lastEnab = enab; // save last enab state
    //Serial.print("-");
} // end loop
