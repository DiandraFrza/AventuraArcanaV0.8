 /// @function ScreenShake(magnitude, frames)
/// @arg magnitude sets the strength of the shake (radius in pixels)
/// @arg frames sets the length of the shake in frames (60 - 1 second at 60fps)

with (oCamera)
{
	if (argument0 > shake_remain) //it will override when we have another shake which is bigger
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}