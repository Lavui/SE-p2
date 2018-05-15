
const int bc0 = 13;
const int bc1 = 12;
const int bc2 = 11;
const int bc3 = 10;
const int enableInput = 9;

int enab = 0;
int b0 = 0;
int b1 = 0;
int b2 = 0;
int b3 = 0;

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
  if (enab == HIGH) {   
    b0 = digitalRead(bc0); 
    b1 = digitalRead(bc1); 
    b2 = digitalRead(bc2); 
    b3 = digitalRead(bc3);    
    Serial.print(b0);
    Serial.print(b1);
    Serial.print(b2);
    Serial.print(b3);
    Serial.print("\t");

  } 
  Serial.print(enab);
  Serial.print("\n");
}
