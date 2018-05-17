
const int bc0 = 13;
const int enableInput = 9;

int enab = 0;
int b0 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(bc0, INPUT); 
  pinMode(enableInput, INPUT);
  Serial.print("Inici!");  
}


void loop(){
  enab = digitalRead(enableInput);
  if (enab == HIGH) {   
    b0 = digitalRead(bc0); 
    Serial.print(b0);
    Serial.print("\n");
  } 
}
