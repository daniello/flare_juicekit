package flare.physics
{
import flare.physics.*;

  /**
   * Represents a Spring in a physics simulation. A spring connects two
   * particles and is defined by the springs rest length, spring tension,
   * and damping (friction) co-efficient.
   */
public class DynamicSpring extends flare.physics.Spring
{

  /**
   * Creates a new Spring with given parameters.
   * @param p1 the first particle attached to the spring
   * @param p2 the second particle attached to the spring
   * @param restLength the rest length of the spring
   * @param tension the tension of the spring
   * @param damping the damping (friction) co-efficient of the spring
   */
  public function DynamicSpring(p1:Particle, p2:Particle, restLength:Number = 10,
                                tension:Number = 0.1, damping:Number = 0.1)
  {
    super(p1, p2, restLength, tension, damping)
  }

  /**
   * Function for assigning rest length values to springs. By default,
   * this simply returns the default rest length value. This function can
   * be replaced to perform custom rest length assignment.
   */
  public var dynamicDistance:Function = function():Number {
    return 500;
  }

  override public function get restLength():Number {
    var dd:Number = dynamicDistance()
    if (dd < 0) {
      trace('minimal - :'+_restLength + "   "+dd)
      return _restLength - 2*dd
    } else {
      trace('minimal + :'+(_restLength))
      return _restLength
    }
  }

} // end of class DynamicSpring
}