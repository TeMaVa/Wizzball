class PowerUpCollider extends GenericMassedCollider<Ball, PowerUp> {
  
  PowerUpCollider() {
  }
  
   void handle(Ball ball, PowerUp powerup) {
    score++;   
    ball.godmode();
    world.delete(powerup);
  }   
}
