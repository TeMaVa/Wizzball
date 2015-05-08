class BaddieCollider extends GenericMassedCollider<Ball, Baddie> {
  
  BaddieCollider() {

  }
  
   void handle(Ball ball, Baddie baddie) {
    
    println("Handlattu"); // have GenericMassedCollider do the rest
  } 
  
}
