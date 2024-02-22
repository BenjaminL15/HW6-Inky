INCLUDE choices.ink

-> chapter_1

==chapter_1== 

{~Monday | Tuesday | Wednesday | Thursday | Friday} 6:00 in the morning, someone shakes you awake.

They stand beside you and stare at you.
    -> okay 

==okay==
"Are you doing okay?"
    + Yes, leave me alone
        -> explain
    + Who are you?
        -> character_response.who
    + Where am I?
        -> character_response.where  

==explain==
I can't do that, we need you to come help us traverse through the Otherworld. Or did your memories get wiped again? 
Man, everyday it gets even more difficult.
    -> choice_explain
==explain_more==
So... can you help us?
    -> choice_explain
    ==choice_explain==
    + Otherworld?
        -> character_response.otherworld
    + Why would I do that?
        -> character_response.help
    + I will get up okay?
        -> chapter_2
        
==chapter_2==

Great! Now I need you to follow me and choose your energon you wish to traverse through the otherworld with.
    -> energon_info
    
== choices_energon ==
Want more information or are you ready to choose?
    -> energon_info
    ==energon_info==
    + What is energon? 
        -> character_response.energon
    + What are the different energon's?
        -> character_response.energon_diff
    + I am ready to choose
        -> choose_powers

== choose_powers ==
Okay, before you choose I should tell you a little bit about each power. 
Do you want to know more about them?
    
    -> energon_option
    
    = wait_energon
    {&Okay take your time! | We don't have all day here... | There are a lot of good choices!}
    -> energon_option
    
    = energon_option 
    + Yes
        -> power_info  
    + Let me think about it...
        -> wait_energon
        
    = power_info
        + Light
            -> light_info
        + {light_info} Darkness 
            -> darkness_info
        + {light_info} {darkness_info} Reality
            -> reality_info
        
    = light_info
    Light is the first power that is introduced. This is the most common and reliable energon as it will guide us through the otherworld easily and defeat the cursed monsters with ease. Light also supports and helps those around them by healing and shielding allies. However, it struggles the most when a large cursed monster is present.
    {~Do you choose Light as your energon of choice? | Light might suit you! | Light seems lame...}
        + Yes 
            -> chapter_3
        + No
            -> power_info
            
    = darkness_info
    Darkness is not very common as it touches more into negative energons. Most darkness users tend to plow through monsters easily and can withstand high amounts of damage. Darkness can also summon cursed monsters once they are defeated. While darkness is able to hold off on its own, darkness heavily relies on a light energon teammate to help stay healed and shielded.
    {~Do you choose Darkness as your energon of choice? | Join the dark side... | I would avoid darkness if I were you ... }
        + Yes 
            -> chapter_3
        + No
            -> power_info
    = reality_info
    Reality is the hardest of the three to master and utlize when traversing through the Otherworld. Without mastery of the energyon, you might lose yourself to the cursed monsters, however, once mastered, you are able to be the best of both light and darkness and can be beneficial to not only yourself but your teammates as well/
    {Do you choose Reality as your energy of choice? | Reality seems hard... | We need more Reality energons!}
    
        + Yes 
            -> chapter_3
        + No
            -> power_info
    

== chapter_3 ==

Now that you have chosen your energon, it's time we traverse through the Otherworld quickly, today it will just be you and me. 

I forgot to mention! If you die in the Otherworld, don't worry about me. I will be sent back to our world and will probably be explaining the entire process to you again as your memories will most likely be wiped out from traversing.

Are you ready to enter the Otherworld?
    -> enter

    = enter_wait
        {&Okay take your time! | We don't have all day here... | The world depends on us}
        -> enter

    = enter
    + Yea, lets do it!
        -> otherworld_mission
    + I need more time to process and get ready...
        -> enter_wait
        
==otherworld_mission== 
    Since we are groundzero in new territory I need you to stay alert and keep your eyes peeled at all times. 
    Because you are the only one that can traverse in and out of the Otherworld, you are going to lead the way. 
    Lead us to victory! (Sorry, I am very enthuasiastic about this)
    -> traversal
    
    == traversal == 
        + {traversal_left < 1} Left 
            -> traversal_left
        + {traversal_left} {traversal_right < 1} Right 
            -> traversal_right
        + {traversal_left} {traversal_right}{traversal_forward < 1} Go Forward
            -> traversal_forward
        + {traversal_left} {traversal_right}{traversal_forward}{traversal_jump < 1} Jump 
            -> traversal_jump
        + {traversal_left} {traversal_right}{traversal_forward}{traversal_jump}{traversal_run < 1}Run Forward
            -> traversal_run
        + {traversal_left} {traversal_right}{traversal_forward}{traversal_jump}{traversal_run}{traversal_halt< 1}Halt
            -> traversal_halt
        -> fallback_one 
        
    
    = traversal_left
        Wow, this place is insane, the sky is distorted along with the broken ground 
        -> traversal
    = traversal_right
        oh no... there are curse monsters going through that portal leading to our world in front of us. We should get a closer look.
        -> traversal
    = traversal_forward 
        There are so many of them... Each cursed monster represents the hatred and anger that feeds off of mortals. We need to stop that portal from leaking anymore cursed monsters. We need to jump over a few floating rocks and we can find the main source of the portal. 
        -> traversal
    = traversal_jump
        There it is... the main reason the portal is open, the cursed wizard... I forgot to mention the different subclasses of wizards. Would you like me to go over them right now?
        -> cursed_info
            ==cursed_info==
            Would you like to know more?
            + Yes 
                -> character_response.cursed
            * No, lets just keep going towards the cursed wizard.  
                -> traversal
    == traversal_run ==
        We need to come up with a plan and before we continue over to the Wizard. You are going to test your new energon abilities while I find a way to stop the negative emotions from fueling him.
        -> traversal
    == traversal_halt ==
        THIS IS IT! LETS GO 
        -> chapter_4 
    == fallback_one ==
    oops you fell off from the Otherworld! 
    -> DONE
    
    
==chapter_4==

Okay, maybe I forgot to mention your different energon abilities. All energon have the same abilities as there are no difference, besides their special and ultimate attacks.
    Would you like to know more? 
    + Yes
        -> abilities 
    + No, lets defeat the cursed wizard. 
        -> battle 
    
    
    ==abilities==
    Which energon would you like to know more about?
    + Light
        -> character_response.light_abilities
    + Darkness
       -> character_response.darkness_abilities 
    + Reality
        -> character_response.reality_abilities
    + Lets get to battle!
        -> battle 


== battle ==

You are in the midst of battle and you use your special attacks on the cursed wizard. The wizard seems weakened but you have no other choice to unleash your special attack on the wizard. However, it will cost you your life...

    + Use the ultimate attack
        -> final 
    + Don't use the ultimate attack
        -> restart 
        

==restart==
Oh no... you have to do this all over again...
    -> chapter_1


==final==

WOAH! YOU DID IT! YOU REALLY DID IT! This is the first time you managed to do it, what changed? 

Actually, I don't want to ask that. I am just glad we managed to finish one mission phew. 

What did you think?

    * It was boring
        -> answer_character
    * Easy-peasy 
        -> answer_character
    * That was extremely difficult... I don't want to do that again
        -> answer_character

    
    = answer_character
    Well, whether you liked it or not you got the job done and thats all that matters. However, there is a lot more missions to embark on and to challenge ourselves with. Hopefully, we never have to do this process all over again...
    
    * Intentionally jump off in the otherworld to repeat the process
        -> chapter_1
    * Traverse out of the Otherworld safely.
        -> ending 
        
        
    = ending 
    You have finally learned what the Otherworld and Energon are in order to survive and save the world. You, Shin, and many others will continue to embark on your mission through the Otherworld to stop cursed monsters from feeding off of humans.
    Good luck!
    -> END 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        



