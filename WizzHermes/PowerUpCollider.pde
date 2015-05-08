class PowerUpCollider extends GenericMassedCollider<Ball, PowerUp> {
  
  PowerUpCollider() {

  }
  
   void handle(Ball ball, PowerUp powerup) {
    
    ball.godmode();
    world.delete(powerup);
  } 
  
}
