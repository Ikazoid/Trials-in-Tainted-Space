package classes.Engine.Combat 
{
	import classes.Creature;
	import classes.Engine.Utility.rand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function combatMiss(attacker:Creature, target:Creature, overrideAttack:Number = -1, missModifier:Number = 1):Boolean 
	{
		if (overrideAttack == -1) overrideAttack = attacker.meleeWeapon.attack;
		
		if(rand(100) + attacker.physique()/5 + overrideAttack - target.reflexes()/5 < 10 * missModifier && !target.isImmobilized()) 
		{
			return true;
		}
		//Evasion chances
		if(target.evasion() >= rand(100) + 1) {
			trace("EVASION WORKED!: " + target.evasion());
			return true;
		}
		//10% miss chance for lucky breaks!
		if (target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
		if(target.hasPerk("Melee Immune")) return true;
		return false;
	}

}