class BaddieCollider extends GenericMassedCollider<Ball, Baddie> {
  
  BaddieCollider() {
  }
  
  void handle(Ball ball, Baddie baddie) {
    
    if (ball.AM_I_GOD())
    {
      world.delete(baddie);
      score++;
      return;
    }
    
    lives--;
  }   
}
