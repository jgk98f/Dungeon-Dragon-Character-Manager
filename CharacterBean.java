package mybeans;

/**
 * 
 * @author Jason
 */
public class CharacterBean implements java.io.Serializable {
	private String Strength;
	private String Dexterity;
	private String Constitution;
	private String Intelligence;
	private String Wisdom;
	private String Charisma;
	private String ArmorClass;
	private String Inspiration;
	private String Proficieny;
	private String Acrobatics;
	private String AnimalHandling;
	private String Arcana;
	private String Athletics;
	private String Deception;
	private String History;
	private String Insight;
	private String Initimidation;
	private String Investigation;
	private String Medicine;
	private String Nature;
	private String Perception;
	private String Performance;
	private String Persuasion;
	private String Religon;
	private String SleightOfHand;
	private String Stealth;
	private String Survival;
	private String Initiative;
	private String Speed;
	private String Health;
	private String DeathSaveSuccess;
	private String DeathSaveFail;
	private String Attack;
	private String Level;
	private String Name;
	private String Experience;
	private String Alignment;
	private String CharacterClass;
	private String Age;
	private String Height;
	private String Weight;
	private String EyeColor;
	private String SkinColor;
	private String HairColor;

        public CharacterBean(){
            
        }
        
	/**
	 * @param strength
	 * @param dexterity
	 * @param constitution
	 * @param intelligence
	 * @param wisdom
	 * @param charisma
	 * @param armorClass
	 * @param inspiration
	 * @param proficieny
	 * @param acrobatics
	 * @param animalHandling
	 * @param arcana
	 * @param athletics
	 * @param deception
	 * @param history
	 * @param insight
	 * @param initimidation
	 * @param investigation
	 * @param medicine
	 * @param nature
	 * @param perception
	 * @param performance
	 * @param persuasion
	 * @param religon
	 * @param sleightOfHand
	 * @param stealth
	 * @param survival
	 * @param initiative
	 * @param speed
	 * @param health
	 * @param deathSaveSuccess
	 * @param deathSaveFail
	 * @param attack
	 * @param level
	 * @param name
	 * @param experience
	 * @param alignment
	 * @param class1
	 * @param age
	 * @param height
	 * @param weight
	 * @param eyeColor
	 * @param skinColor
	 * @param hairColor
	 */
	public CharacterBean(String strength, String dexterity,
			String constitution, String intelligence, String wisdom,
			String charisma, String armorClass, String inspiration,
			String proficieny, String acrobatics, String animalHandling,
			String arcana, String athletics, String deception, String history,
			String insight, String initimidation, String investigation,
			String medicine, String nature, String perception,
			String performance, String persuasion, String religon,
			String sleightOfHand, String stealth, String survival,
			String initiative, String speed, String health,
			String deathSaveSuccess, String deathSaveFail, String attack,
			String level, String name, String experience, String alignment,
			String class1, String age, String height, String weight,
			String eyeColor, String skinColor, String hairColor) {
		super();
		Strength = strength;
		Dexterity = dexterity;
		Constitution = constitution;
		Intelligence = intelligence;
		Wisdom = wisdom;
		Charisma = charisma;
		ArmorClass = armorClass;
		Inspiration = inspiration;
		Proficieny = proficieny;
		Acrobatics = acrobatics;
		AnimalHandling = animalHandling;
		Arcana = arcana;
		Athletics = athletics;
		Deception = deception;
		History = history;
		Insight = insight;
		Initimidation = initimidation;
		Investigation = investigation;
		Medicine = medicine;
		Nature = nature;
		Perception = perception;
		Performance = performance;
		Persuasion = persuasion;
		Religon = religon;
		SleightOfHand = sleightOfHand;
		Stealth = stealth;
		Survival = survival;
		Initiative = initiative;
		Speed = speed;
		Health = health;
		DeathSaveSuccess = deathSaveSuccess;
		DeathSaveFail = deathSaveFail;
		Attack = attack;
		Level = level;
		Name = name;
		Experience = experience;
		Alignment = alignment;
		CharacterClass = class1;
		Age = age;
		Height = height;
		Weight = weight;
		EyeColor = eyeColor;
		SkinColor = skinColor;
		HairColor = hairColor;
	}

	/**
	 * @return the strength
	 */
	public String getStrength() {
		return Strength;
	}

	/**
	 * @param strength
	 *            the strength to set
	 */
	public void setStrength(String strength) {
		Strength = strength;
	}

	/**
	 * @return the dexterity
	 */
	public String getDexterity() {
		return Dexterity;
	}

	/**
	 * @param dexterity
	 *            the dexterity to set
	 */
	public void setDexterity(String dexterity) {
		Dexterity = dexterity;
	}

	/**
	 * @return the constitution
	 */
	public String getConstitution() {
		return Constitution;
	}

	/**
	 * @param constitution
	 *            the constitution to set
	 */
	public void setConstitution(String constitution) {
		Constitution = constitution;
	}

	/**
	 * @return the intelligence
	 */
	public String getIntelligence() {
		return Intelligence;
	}

	/**
	 * @param intelligence
	 *            the intelligence to set
	 */
	public void setIntelligence(String intelligence) {
		Intelligence = intelligence;
	}

	/**
	 * @return the wisdom
	 */
	public String getWisdom() {
		return Wisdom;
	}

	/**
	 * @param wisdom
	 *            the wisdom to set
	 */
	public void setWisdom(String wisdom) {
		Wisdom = wisdom;
	}

	/**
	 * @return the charisma
	 */
	public String getCharisma() {
		return Charisma;
	}

	/**
	 * @param charisma
	 *            the charisma to set
	 */
	public void setCharisma(String charisma) {
		Charisma = charisma;
	}

	/**
	 * @return the armorClass
	 */
	public String getArmorClass() {
		return ArmorClass;
	}

	/**
	 * @param armorClass
	 *            the armorClass to set
	 */
	public void setArmorClass(String armorClass) {
		ArmorClass = armorClass;
	}

	/**
	 * @return the inspiration
	 */
	public String getInspiration() {
		return Inspiration;
	}

	/**
	 * @param inspiration
	 *            the inspiration to set
	 */
	public void setInspiration(String inspiration) {
		Inspiration = inspiration;
	}

	/**
	 * @return the proficieny
	 */
	public String getProficieny() {
		return Proficieny;
	}

	/**
	 * @param proficieny
	 *            the proficieny to set
	 */
	public void setProficieny(String proficieny) {
		Proficieny = proficieny;
	}

	/**
	 * @return the acrobatics
	 */
	public String getAcrobatics() {
		return Acrobatics;
	}

	/**
	 * @param acrobatics
	 *            the acrobatics to set
	 */
	public void setAcrobatics(String acrobatics) {
		Acrobatics = acrobatics;
	}

	/**
	 * @return the animalHandling
	 */
	public String getAnimalHandling() {
		return AnimalHandling;
	}

	/**
	 * @param animalHandling
	 *            the animalHandling to set
	 */
	public void setAnimalHandling(String animalHandling) {
		AnimalHandling = animalHandling;
	}

	/**
	 * @return the arcana
	 */
	public String getArcana() {
		return Arcana;
	}

	/**
	 * @param arcana
	 *            the arcana to set
	 */
	public void setArcana(String arcana) {
		Arcana = arcana;
	}

	/**
	 * @return the athletics
	 */
	public String getAthletics() {
		return Athletics;
	}

	/**
	 * @param athletics
	 *            the athletics to set
	 */
	public void setAthletics(String athletics) {
		Athletics = athletics;
	}

	/**
	 * @return the deception
	 */
	public String getDeception() {
		return Deception;
	}

	/**
	 * @param deception
	 *            the deception to set
	 */
	public void setDeception(String deception) {
		Deception = deception;
	}

	/**
	 * @return the history
	 */
	public String getHistory() {
		return History;
	}

	/**
	 * @param history
	 *            the history to set
	 */
	public void setHistory(String history) {
		History = history;
	}

	/**
	 * @return the insight
	 */
	public String getInsight() {
		return Insight;
	}

	/**
	 * @param insight
	 *            the insight to set
	 */
	public void setInsight(String insight) {
		Insight = insight;
	}

	/**
	 * @return the initimidation
	 */
	public String getInitimidation() {
		return Initimidation;
	}

	/**
	 * @param initimidation
	 *            the initimidation to set
	 */
	public void setInitimidation(String initimidation) {
		Initimidation = initimidation;
	}

	/**
	 * @return the investigation
	 */
	public String getInvestigation() {
		return Investigation;
	}

	/**
	 * @param investigation
	 *            the investigation to set
	 */
	public void setInvestigation(String investigation) {
		Investigation = investigation;
	}

	/**
	 * @return the medicine
	 */
	public String getMedicine() {
		return Medicine;
	}

	/**
	 * @param medicine
	 *            the medicine to set
	 */
	public void setMedicine(String medicine) {
		Medicine = medicine;
	}

	/**
	 * @return the nature
	 */
	public String getNature() {
		return Nature;
	}

	/**
	 * @param nature
	 *            the nature to set
	 */
	public void setNature(String nature) {
		Nature = nature;
	}

	/**
	 * @return the perception
	 */
	public String getPerception() {
		return Perception;
	}

	/**
	 * @param perception
	 *            the perception to set
	 */
	public void setPerception(String perception) {
		Perception = perception;
	}

	/**
	 * @return the performance
	 */
	public String getPerformance() {
		return Performance;
	}

	/**
	 * @param performance
	 *            the performance to set
	 */
	public void setPerformance(String performance) {
		Performance = performance;
	}

	/**
	 * @return the persuasion
	 */
	public String getPersuasion() {
		return Persuasion;
	}

	/**
	 * @param persuasion
	 *            the persuasion to set
	 */
	public void setPersuasion(String persuasion) {
		Persuasion = persuasion;
	}

	/**
	 * @return the religon
	 */
	public String getReligon() {
		return Religon;
	}

	/**
	 * @param religon
	 *            the religon to set
	 */
	public void setReligon(String religon) {
		Religon = religon;
	}

	/**
	 * @return the sleightOfHand
	 */
	public String getSleightOfHand() {
		return SleightOfHand;
	}

	/**
	 * @param sleightOfHand
	 *            the sleightOfHand to set
	 */
	public void setSleightOfHand(String sleightOfHand) {
		SleightOfHand = sleightOfHand;
	}

	/**
	 * @return the stealth
	 */
	public String getStealth() {
		return Stealth;
	}

	/**
	 * @param stealth
	 *            the stealth to set
	 */
	public void setStealth(String stealth) {
		Stealth = stealth;
	}

	/**
	 * @return the survival
	 */
	public String getSurvival() {
		return Survival;
	}

	/**
	 * @param survival
	 *            the survival to set
	 */
	public void setSurvival(String survival) {
		Survival = survival;
	}

	/**
	 * @return the initiative
	 */
	public String getInitiative() {
		return Initiative;
	}

	/**
	 * @param initiative
	 *            the initiative to set
	 */
	public void setInitiative(String initiative) {
		Initiative = initiative;
	}

	/**
	 * @return the speed
	 */
	public String getSpeed() {
		return Speed;
	}

	/**
	 * @param speed
	 *            the speed to set
	 */
	public void setSpeed(String speed) {
		Speed = speed;
	}

	/**
	 * @return the health
	 */
	public String getHealth() {
		return Health;
	}

	/**
	 * @param health
	 *            the health to set
	 */
	public void setHealth(String health) {
		Health = health;
	}

	/**
	 * @return the deathSaveSuccess
	 */
	public String getDeathSaveSuccess() {
		return DeathSaveSuccess;
	}

	/**
	 * @param deathSaveSuccess
	 *            the deathSaveSuccess to set
	 */
	public void setDeathSaveSuccess(String deathSaveSuccess) {
		DeathSaveSuccess = deathSaveSuccess;
	}

	/**
	 * @return the deathSaveFail
	 */
	public String getDeathSaveFail() {
		return DeathSaveFail;
	}

	/**
	 * @param deathSaveFail
	 *            the deathSaveFail to set
	 */
	public void setDeathSaveFail(String deathSaveFail) {
		DeathSaveFail = deathSaveFail;
	}

	/**
	 * @return the attack
	 */
	public String getAttack() {
		return Attack;
	}

	/**
	 * @param attack
	 *            the attack to set
	 */
	public void setAttack(String attack) {
		Attack = attack;
	}

	/**
	 * @return the level
	 */
	public String getLevel() {
		return Level;
	}

	/**
	 * @param level
	 *            the level to set
	 */
	public void setLevel(String level) {
		Level = level;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return Name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		Name = name;
	}

	/**
	 * @return the experience
	 */
	public String getExperience() {
		return Experience;
	}

	/**
	 * @param experience
	 *            the experience to set
	 */
	public void setExperience(String experience) {
		Experience = experience;
	}

	/**
	 * @return the alignment
	 */
	public String getAlignment() {
		return Alignment;
	}

	/**
	 * @param alignment
	 *            the alignment to set
	 */
	public void setAlignment(String alignment) {
		Alignment = alignment;
	}

	/**
	 * @return the class
	 */
	public String getCharacterClass() {
		return CharacterClass;
	}

	/**
	 * @param class1
	 *            the class to set
	 */
	public void setCharacterClass(String class1) {
		CharacterClass = class1;
	}

	/**
	 * @return the age
	 */
	public String getAge() {
		return Age;
	}

	/**
	 * @param age
	 *            the age to set
	 */
	public void setAge(String age) {
		Age = age;
	}

	/**
	 * @return the height
	 */
	public String getHeight() {
		return Height;
	}

	/**
	 * @param height
	 *            the height to set
	 */
	public void setHeight(String height) {
		Height = height;
	}

	/**
	 * @return the weight
	 */
	public String getWeight() {
		return Weight;
	}

	/**
	 * @param weight
	 *            the weight to set
	 */
	public void setWeight(String weight) {
		Weight = weight;
	}

	/**
	 * @return the eyeColor
	 */
	public String getEyeColor() {
		return EyeColor;
	}

	/**
	 * @param eyeColor
	 *            the eyeColor to set
	 */
	public void setEyeColor(String eyeColor) {
		EyeColor = eyeColor;
	}

	/**
	 * @return the skinColor
	 */
	public String getSkinColor() {
		return SkinColor;
	}

	/**
	 * @param skinColor
	 *            the skinColor to set
	 */
	public void setSkinColor(String skinColor) {
		SkinColor = skinColor;
	}

	/**
	 * @return the hairColor
	 */
	public String getHairColor() {
		return HairColor;
	}

	/**
	 * @param hairColor
	 *            the hairColor to set
	 */
	public void setHairColor(String hairColor) {
		HairColor = hairColor;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
        @Override
	public String toString() {
		return "CharacterBean [Strength=" + Strength + ", Dexterity="
				+ Dexterity + ", Constitution=" + Constitution
				+ ", Intelligence=" + Intelligence + ", Wisdom=" + Wisdom
				+ ", Charisma=" + Charisma + ", ArmorClass=" + ArmorClass
				+ ", Inspiration=" + Inspiration + ", Proficieny=" + Proficieny
				+ ", Acrobatics=" + Acrobatics + ", AnimalHandling="
				+ AnimalHandling + ", Arcana=" + Arcana + ", Athletics="
				+ Athletics + ", Deception=" + Deception + ", History="
				+ History + ", Insight=" + Insight + ", Initimidation="
				+ Initimidation + ", Investigation=" + Investigation
				+ ", Medicine=" + Medicine + ", Nature=" + Nature
				+ ", Perception=" + Perception + ", Performance=" + Performance
				+ ", Persuasion=" + Persuasion + ", Religon=" + Religon
				+ ", SleightOfHand=" + SleightOfHand + ", Stealth=" + Stealth
				+ ", Survival=" + Survival + ", Initiative=" + Initiative
				+ ", Speed=" + Speed + ", Health=" + Health
				+ ", DeathSaveSuccess=" + DeathSaveSuccess + ", DeathSaveFail="
				+ DeathSaveFail + ", Attack=" + Attack + ", Level=" + Level
				+ ", Name=" + Name + ", Experience=" + Experience
				+ ", Alignment=" + Alignment + ", Class=" + CharacterClass + ", Age="
				+ Age + ", Height=" + Height + ", Weight=" + Weight
				+ ", EyeColor=" + EyeColor + ", SkinColor=" + SkinColor
				+ ", HairColor=" + HairColor + "]";
	}

}
