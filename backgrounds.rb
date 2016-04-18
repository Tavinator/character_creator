require "./step"
require "./display_item"

class Backgrounds < Step
  def initialize()
    @options = [NOBLE, SOLDIER, ACOLYTE]
    @section = "background"
    super
  end

  def enter()
    print "The second major step is selecting a background for your character.\nThe background helps describe your character on how he/she grew up.\n"
    continue
    selector_rules
  end

private

NOBLE = DisplayItem.new(
"Noble",
"Nobles",
"Skill Prof: History & Persuasion. Tool Prof: Yes. Additional Languages: One of your choice.\n And the Noble specific feature: Retainers.",
"As a Noble, you understand wealth, power, and privilege. You carry a noble title\n, and your family owns land, collects taxes,\n and wields a significant political influence.\n Your Skill Proficencies are in History and Persuasion.\n Your Tool Proficencies are one type of gaming set.\n You are Proficent in 1 additional language of your choice.\n Your Extra equipment is: A set of fine clothers, a signet ring, a scroll of pedigree,\n and a purse containing 25gp.\n You also have the service of three retainers loyal to your family. These retainers can be attendents or messengers, and one might be majordomo. Your retainers are commoners who can perform mundane tasks for you, but they do not fight for you, will not follow you into obviously dangerous areas (such as dungeons), and will leave if they are frequently endangered or abused.",
'class_step'
)
SOLDIER = DisplayItem.new(
"Soldier",
"Soldiers",
"Skill Prof: Athletics & Intimidation. Tool Prof: Yes. Additional Languages: No.\n And the Soldier specific feature: Military Rank.",
"SOLIDER BLURB",
'class_step'
)
ACOLYTE = DisplayItem.new(
"Acolyte",
"Acolytes",
"Skill Prof: Insight & Religion. Tool Prof: No. Additional Languages: Two of your choice.\n And the Acolyte specific feature: Shelter of the Faithful.",
"ACOLYTE BLURB",
'class_step'
)


end
