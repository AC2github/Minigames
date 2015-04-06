Chatbox = {}
Chatbox.Sounds = {}
Chatbox.SoundsCache = {}
Chatbox.Help = {}

Chatbox.Help[1] = { text = "Notification", icon = "gui/silkicons/world" }
Chatbox.Help[2] = { text = "Admin action", icon = "gui/silkicons/exclamation" }
Chatbox.Help[3] = { text = "Player join", icon = "gui/silkicons/check_on" }
Chatbox.Help[4] = { text = "Player leave", icon = "gui/silkicons/check_off" }
Chatbox.Help[5] = { text = "Owner icon", icon = "gui/silkicons/star" }
Chatbox.Help[6] = { text = "Admin icon", icon = "gui/silkicons/shield" }
Chatbox.Help[7] = { text = "Moderator icon", icon = "gui/silkicons/emoticon_smile" }
Chatbox.Help[8] = { text = "Donator icon", icon = "gui/silkicons/heart" }

function Chatbox.AddSound( name, tbl )
	table.insert( Chatbox.SoundsCache, { text = name, sound = { tbl } } )
end

Chatbox.AddSound("enough of your mumbo jumbo", "vo/npc/male01/vanswer01.wav", true)
Chatbox.AddSound("bullshit", "vo/npc/male01/question26.wav")
Chatbox.AddSound("yay", "vo/npc/Barney/ba_yell.wav")
Chatbox.AddSound("shit", "vo/npc/Barney/ba_ohshit03.wav")
Chatbox.AddSound("hax", "vo/npc/male01/hacks01.wav", true)
Chatbox.AddSound("hacks", "vo/npc/male01/hacks02.wav", true)
Chatbox.AddSound("h4x", "vo/npc/male01/thehacks01.wav", true)
Chatbox.AddSound("h4cks", "vo/npc/male01/thehacks02.wav", true)
Chatbox.AddSound("okay", "vo/npc/male01/ok01.wav", "vo/npc/male01/ok02.wav")
Chatbox.AddSound("derka", "vo/npc/vortigaunt/vortigese12.wav", "vo/npc/vortigaunt/vortigese11.wav", true)
Chatbox.AddSound("noes", "vo/npc/Alyx/ohno_startle01.wav", true)
Chatbox.AddSound("get down", "vo/npc/Barney/ba_getdown.wav", "vo/npc/male01/getdown02.wav")
Chatbox.AddSound("gtfo", "vo/npc/male01/gethellout.wav")
Chatbox.AddSound("gtho", "vo/npc/male01/gethellout.wav")
Chatbox.AddSound("yeah", "vo/npc/male01/yeah02.wav")
Chatbox.AddSound("rofl", "vo/Citadel/br_laugh01.wav")
Chatbox.AddSound("lmao", "vo/Citadel/br_laugh01.wav")
Chatbox.AddSound("run", "vo/npc/male01/strider_run.wav")
Chatbox.AddSound("run for your life", "vo/npc/male01/runforyourlife01.wav", "vo/npc/male01/runforyourlife02.wav", "vo/npc/male01/runforyourlife03.wav")
Chatbox.AddSound("fantastic", "vo/npc/male01/fantastic01.wav", "vo/npc/male01/fantastic02.wav")
Chatbox.AddSound("headcrabs", "vo/npc/male01/headcrabs01.wav", "vo/npc/male01/headcrabs02.wav")
Chatbox.AddSound("headhumpers", "vo/npc/Barney/ba_headhumpers.wav", true)
Chatbox.AddSound("hello", "vo/coast/odessa/nlo_cub_hello.wav")
Chatbox.AddSound("eek", "ambient/voices/f_scream1.wav", true)
Chatbox.AddSound("uh oh", "vo/npc/male01/uhoh.wav")
Chatbox.AddSound("sodomy!", "vo/ravenholm/madlaugh01.wav", "vo/ravenholm/madlaugh02.wav", "vo/ravenholm/madlaugh03.wav", "vo/ravenholm/madlaugh04.wav", true)
Chatbox.AddSound("oops", "vo/npc/male01/whoops01.wav", true)
Chatbox.AddSound("shut up", "vo/npc/male01/answer17.wav")
Chatbox.AddSound("shutup", "vo/npc/male01/answer17.wav")
Chatbox.AddSound("right on", "vo/npc/male01/answer32.wav", true)
Chatbox.AddSound("freeman", "vo/npc/male01/gordead_ques03a.wav", true)
Chatbox.AddSound("help", "vo/npc/male01/help01.wav")
Chatbox.AddSound("haxz", "vo/npc/male01/herecomehacks01.wav", true)
Chatbox.AddSound("hi", "vo/npc/male01/hi01.wav", "vo/npc/male01/hi02.wav")
Chatbox.AddSound("let's go", "vo/npc/male01/letsgo01.wav", "vo/npc/male01/letsgo02.wav")
Chatbox.AddSound("lets go", "vo/npc/male01/letsgo01.wav", "vo/npc/male01/letsgo02.wav")
Chatbox.AddSound("moan", "vo/npc/male01/moan01.wav", "vo/npc/male01/moan02.wav", "vo/npc/male01/moan03.wav", "vo/npc/male01/moan04.wav", "vo/npc/male01/moan05.wav", true)
Chatbox.AddSound("nice", "vo/npc/male01/nice.wav")
Chatbox.AddSound("noo", "vo/npc/Barney/ba_no01.wav", "vo/npc/Barney/ba_no02.wav", true)
Chatbox.AddSound("nooo", "vo/npc/male01/no02.wav", true)
Chatbox.AddSound("oh no", "vo/npc/male01/ohno.wav")
Chatbox.AddSound("joygasm", "vo/npc/female01/pain06.wav", true)
Chatbox.AddSound("zombies", "vo/npc/male01/zombies01.wav", "vo/npc/male01/zombies02.wav")
Chatbox.AddSound("da man", "bot/whos_the_man.wav", true)
Chatbox.AddSound("my house", "bot/this_is_my_house.wav", true)
Chatbox.AddSound("party", "bot/its_a_party.wav", true)
Chatbox.AddSound("watch out", "vo/npc/male01/watchout.wav")
Chatbox.AddSound("excuse me", "vo/npc/male01/excuseme01.wav", "vo/npc/male01/excuseme02.wav")
Chatbox.AddSound("you sure?", "vo/npc/male01/answer37.wav")
Chatbox.AddSound("groan", "vo/npc/male01/moan04.wav", true)
Chatbox.AddSound("gasp", "vo/npc/male01/startle01.wav", "vo/npc/male01/startle02.wav", true)
Chatbox.AddSound("sorry", "vo/npc/male01/sorry01.wav", "vo/npc/male01/sorry02.wav", "vo/npc/male01/sorry03.wav")
Chatbox.AddSound("welcome to city 17", "vo/Breencast/br_welcome01.wav", "vo/Breencast/br_welcome06.wav", true)
Chatbox.AddSound("it's safer here", "vo/Breencast/br_welcome07.wav", true)
Chatbox.AddSound("i'm talking to you", "vo/Breencast/br_tofreeman02.wav", true)
Chatbox.AddSound("serve mankind", "vo/Breencast/br_tofreeman12.wav", true)
Chatbox.AddSound("get going", "vo/canals/shanty_go_nag03.wav")
Chatbox.AddSound("go on out", "vo/canals/gunboat_goonout.wav", true)
Chatbox.AddSound("get outta here", "vo/canals/shanty_go_nag01.wav", "vo/canals/boxcar_go_nag03.wav")
Chatbox.AddSound("go on", "vo/canals/shanty_go_nag02.wav")
Chatbox.AddSound("hey", "vo/canals/shanty_hey.wav")
Chatbox.AddSound("get in here hurry", "vo/canals/matt_getin.wav", true)
Chatbox.AddSound("hit the road jack", "vo/canals/boxcar_go_nag04.wav", true)
Chatbox.AddSound("no", "vo/Citadel/eli_notobreen.wav")
Chatbox.AddSound("no!", "vo/Citadel/br_failing11.wav", true)
Chatbox.AddSound("never", "vo/Citadel/eli_nonever.wav")
Chatbox.AddSound("you fool", "vo/Citadel/br_youfool.wav", true)
Chatbox.AddSound("good god", "vo/Citadel/eli_goodgod.wav")
Chatbox.AddSound("cheer", "vo/coast/odessa/male01/nlo_cheer01.wav", "vo/coast/odessa/male01/nlo_cheer02.wav", "vo/coast/odessa/male01/nlo_cheer03.wav", "vo/coast/odessa/male01/nlo_cheer04.wav", true)
Chatbox.AddSound("drive safely", "vo/coast/odessa/male01/nlo_citizen_drivesafe.wav", true)
Chatbox.AddSound("whoops", "vo/k_lab/ba_whoops.wav", true)
Chatbox.AddSound("gee thanks", "vo/k_lab/ba_geethanks.wav")
Chatbox.AddSound("what the hell", "vo/k_lab/ba_whatthehell.wav")
Chatbox.AddSound("it's your pet the freakin headhumper", "vo/k_lab/ba_headhumper01.wav", true)
Chatbox.AddSound("i'll stay here", "vo/npc/male01/illstayhere01.wav", "vo/npc/male01/imstickinghere01.wav")
Chatbox.AddSound("up there", "vo/npc/male01/upthere01.wav", "vo/npc/male01/upthere02.wav")
Chatbox.AddSound("he's dead", "vo/npc/male01/gordead_ques01.wav", "vo/npc/male01/gordead_ques07.wav", true)
Chatbox.AddSound("lead the way", "vo/npc/male01/leadtheway02.wav", "vo/npc/male01/leadtheway01.wav", true)
Chatbox.AddSound("we're done for", "vo/npc/male01/gordead_ans14.wav", true)
Chatbox.AddSound("over there", "vo/npc/male01/overthere01.wav", "vo/npc/male01/overthere02.wav")
Chatbox.AddSound("ok i'm ready", "vo/npc/male01/okimready01.wav", "vo/npc/male01/okimready02.wav", "vo/npc/male01/okimready03.wav")
Chatbox.AddSound("i'm with you", "vo/npc/male01/answer13.wav", true)
Chatbox.AddSound("hey over here", "vo/npc/male01/overhere01.wav", true)
Chatbox.AddSound("behind you", "vo/npc/male01/behindyou01.wav", "vo/npc/male01/behindyou02.wav")
Chatbox.AddSound("follow me", "vo/npc/male01/squad_away03.wav")
Chatbox.AddSound("pardon me", "vo/npc/male01/pardonme01.wav", "vo/npc/male01/pardonme02.wav")
Chatbox.AddSound("got one", "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav")
Chatbox.AddSound("finally", "vo/npc/male01/finally.wav")
Chatbox.AddSound("wait for me", "vo/npc/male01/squad_reinforce_single04.wav")
Chatbox.AddSound("i'm hurt", "vo/npc/male01/imhurt01.wav", true)
Chatbox.AddSound("take cover", "vo/npc/male01/takecover02.wav")
Chatbox.AddSound("it's a manhack", "vo/npc/male01/itsamanhack02.wav", true)
Chatbox.AddSound("incoming", "vo/npc/male01/incoming02.wav")
Chatbox.AddSound("ready when you are", {"vo/npc/male01/readywhenyouare01.wav", "vo/npc/male01/readywhenyouare02.wav"}, true)
Chatbox.AddSound("don't forget hawaii", "vo/npc/male01/answer34.wav", true)
Chatbox.AddSound("that's enough outta you", "vo/npc/male01/answer39.wav", true)
Chatbox.AddSound("wait for us", "vo/npc/male01/squad_reinforce_group04.wav")
Chatbox.AddSound("now what?", "vo/npc/male01/gordead_ans01.wav")
Chatbox.AddSound("we trusted you", {"vo/npc/male01/wetrustedyou01.wav", "vo/npc/male01/wetrustedyou02.wav"}, true)
Chatbox.AddSound("god i'm hungry", "vo/npc/male01/question28.wav", true)
Chatbox.AddSound("i'm ganna be sick", "vo/npc/male01/gordead_ans19.wav", true)
Chatbox.AddSound("you're talking to yourself again", "vo/npc/male01/answer09.wav", true)
Chatbox.AddSound("come on everybody", "vo/npc/male01/squad_follow02.wav", true)
Chatbox.AddSound("watch what you're doing", "vo/npc/male01/watchwhat.wav", true)
Chatbox.AddSound("your mind is in the gutter", "vo/npc/male01/answer20.wav", true)
Chatbox.AddSound("here they come!", "vo/npc/male01/heretheycome01.wav", true)
Chatbox.AddSound("same here", "vo/npc/male01/answer07.wav")
Chatbox.AddSound("i wouldn't say that too loud", "vo/npc/male01/answer10.wav", true)
Chatbox.AddSound("i'll put it on your tombstone", "vo/npc/male01/answer11.wav", true)
Chatbox.AddSound("have you ever had an original thought?", "vo/npc/male01/answer16.wav", true)
Chatbox.AddSound("let's concentrate on the task at hand", "vo/npc/male01/answer18.wav", true)
Chatbox.AddSound("keep your mind on your work", "vo/npc/male01/answer19.wav", true)
Chatbox.AddSound("you never know", "vo/npc/male01/answer22.wav", true)
Chatbox.AddSound("you never can tell", "vo/npc/male01/answer23.wav", true)
Chatbox.AddSound("why are you telling me?", "vo/npc/male01/answer24.wav", true)
Chatbox.AddSound("how about that", "vo/npc/male01/answer25.wav", true)
Chatbox.AddSound("want a bet?", "vo/npc/male01/answer27.wav")
Chatbox.AddSound("what am i supposed to do about it?", "vo/npc/male01/answer29.wav")
Chatbox.AddSound("you talking to me?", "vo/npc/male01/answer30.wav")
Chatbox.AddSound("leave it alone", "vo/npc/male01/answer38.wav", true)
Chatbox.AddSound("can't you see i'm busy?", "vo/npc/male01/busy02.wav", true)
Chatbox.AddSound("look out below", "vo/npc/male01/cit_dropper04.wav", true)
Chatbox.AddSound("shouldn't we be doing something?", "vo/npc/male01/doingsomething.wav", true)
Chatbox.AddSound("let's even the odds a little", "vo/npc/male01/evenodds.wav", true)
Chatbox.AddSound("oh god", "vo/npc/male01/gordead_ans04.wav")
Chatbox.AddSound("should we bury him here?", "vo/npc/male01/gordead_ans08.wav", true)
Chatbox.AddSound("what's the use?", "vo/npc/male01/gordead_ans11.wav", true)
Chatbox.AddSound("what's the point?", "vo/npc/male01/gordead_ans12.wav", true)
Chatbox.AddSound("this is bad", "vo/npc/male01/gordead_ques10.wav", true)
Chatbox.AddSound("hold down this spot", "vo/npc/male01/holddownspot01.wav", "vo/npc/male01/holddownspot02.wav", true)
Chatbox.AddSound("i'm hurt", "vo/npc/male01/imhurt01.wav", "vo/npc/male01/imhurt02.wav", true)
Chatbox.AddSound("im hurt", "vo/npc/male01/imhurt01.wav", "vo/npc/male01/imhurt02.wav", true)
Chatbox.AddSound("sometimes i dream about cheese", "vo/npc/male01/question06.wav", true)
Chatbox.AddSound("i can't remember the last time i had a shower", "vo/npc/male01/question19.wav", true)
Chatbox.AddSound("watch what you're doing", "vo/npc/male01/watchwhat.wav", true)
Chatbox.AddSound("you got it", "vo/npc/male01/yougotit02.wav")
Chatbox.AddSound("we thought you were here to help", "vo/npc/male01/heretohelp01.wav", "vo/npc/male01/heretohelp02.wav", true)
Chatbox.AddSound("hey doc", "vo/npc/male01/heydoc01.wav", "vo/npc/male01/heydoc02.wav", true)
Chatbox.AddSound("hit in the gut", "vo/npc/male01/hitingut01.wav", "vo/npc/male01/hitingut02.wav", true)
Chatbox.AddSound("like that?", "vo/npc/male01/likethat.wav", true)
Chatbox.AddSound("my leg", "vo/npc/male01/myleg01.wav", "vo/npc/male01/myleg02.wav", true)
Chatbox.AddSound("my gut", "vo/npc/male01/mygut02.wav", true)
Chatbox.AddSound("my arm", "vo/npc/male01/myarm01.wav", "vo/npc/male01/myarm02.wav", true)
Chatbox.AddSound("no no", "vo/npc/male01/no01.wav")
Chatbox.AddSound("you're not the man i thought you were", "vo/npc/male01/notthemanithought01.wav", true)
Chatbox.AddSound("one for me and one for me", "vo/npc/male01/oneforme.wav", true)
Chatbox.AddSound("let me get out of your way", "vo/npc/male01/outofyourway02.wav", true)
Chatbox.AddSound("i don't think this war is ever going to end", "vo/npc/male01/question01.wav", true)
Chatbox.AddSound("to think all i used to want to do is sell insurance", "vo/npc/male01/question02.wav", true)
Chatbox.AddSound("i don't dream anymore", "vo/npc/male01/question03.wav", true)
Chatbox.AddSound("when this is all over ah who am i kidding", "vo/npc/male01/question04.wav", true)
Chatbox.AddSound("woah deja vu", "vo/npc/male01/question05.wav", true)
Chatbox.AddSound("you smell that? it's freedom", "vo/npc/male01/question07.wav", true)
Chatbox.AddSound("if i ever get my hands on dr. breen", "vo/npc/male01/question08.wav", true)
Chatbox.AddSound("i could eat a horse hooves and all", "vo/npc/male01/question09.wav", true)
Chatbox.AddSound("i can't believe this day has finally come", "vo/npc/male01/question10.wav", true)
Chatbox.AddSound("i'm pretty sure this isn't part of the plan", "vo/npc/male01/question11.wav", true)
Chatbox.AddSound("looks to me like things are getting worse not better", "vo/npc/male01/question12.wav", true)
Chatbox.AddSound("if i could live my life over again", "vo/npc/male01/question13.wav", true)
Chatbox.AddSound("i'm not even gonna tell you what that reminds me of", "vo/npc/male01/question14.wav", true)
Chatbox.AddSound("they're never gonna make a stalker outta me", "vo/npc/male01/question15.wav", true)
Chatbox.AddSound("finally change is in the air", "vo/npc/male01/question16.wav", true)
Chatbox.AddSound("you feel it? i feel it", "vo/npc/male01/question17.wav", true)
Chatbox.AddSound("i don't feel anything anymore", "vo/npc/male01/question18.wav", true)
Chatbox.AddSound("some day this will all be a bad memory", "vo/npc/male01/question20.wav", true)
Chatbox.AddSound("i'm not a betting man but the odds are not good", "vo/npc/male01/question21.wav", true)
Chatbox.AddSound("doesn't anyone care what i think?", "vo/npc/male01/question22.wav", true)
Chatbox.AddSound("i can't get this tune outta my head", "vo/npc/male01/question23.wav", true)
Chatbox.AddSound("i just knew it was gonna be one of those days", "vo/npc/male01/question25.wav", true)
Chatbox.AddSound("i think i ate something bad", "vo/npc/male01/question27.wav", true)
Chatbox.AddSound("when this is all over i'm gonna mate", "vo/npc/male01/question29.wav", true)
Chatbox.AddSound("i'm glad there's no kids around to see this", "vo/npc/male01/question30.wav", true)
Chatbox.AddSound("scanners", "vo/npc/male01/scanners01.wav", true)
Chatbox.AddSound("whatever you say", "vo/npc/male01/squad_affirm03.wav")
Chatbox.AddSound("ok i'm going", "vo/npc/male01/squad_affirm04.wav", true)
Chatbox.AddSound("here it goes", "vo/npc/male01/squad_affirm05.wav", true)
Chatbox.AddSound("here goes nothing", "vo/npc/male01/squad_affirm06.wav", true)
Chatbox.AddSound("here we come", "vo/npc/male01/squad_approach02.wav", true)
Chatbox.AddSound("on our way", "vo/npc/male01/squad_approach03.wav", true)
Chatbox.AddSound("coming", "vo/npc/male01/squad_approach04.wav")
Chatbox.AddSound("this way gang", "vo/npc/male01/squad_away01.wav", true)
Chatbox.AddSound("over here", "vo/npc/male01/squad_away02.wav")
Chatbox.AddSound("let's get moving", "npc/male01/squad_follow03.wav")
Chatbox.AddSound("gordon freeman, you're here", "vo/npc/male01/squad_greet01.wav", true)
Chatbox.AddSound("stop it freeman", "vo/npc/male01/stopitfm.wav", true)
Chatbox.AddSound("strider", "vo/npc/male01/strider.wav", true)
Chatbox.AddSound("this'll do nicely", "vo/npc/male01/thislldonicely01.wav", true)
Chatbox.AddSound("damn vorts", "vo/npc/male01/vanswer02.wav", true)
Chatbox.AddSound("i'm not sure how to take that", "vo/npc/male01/vanswer03.wav", true)
Chatbox.AddSound("should i take that personally?", "vo/npc/male01/vanswer04.wav", true)
Chatbox.AddSound("speak english", "vo/npc/male01/vanswer05.wav", true)
Chatbox.AddSound("you got that from me", "vo/npc/male01/vanswer06.wav", true)
Chatbox.AddSound("that's why we put up with you", "vo/npc/male01/vanswer07.wav", true)
Chatbox.AddSound("couldn't have put it better myself", "vo/npc/male01/vanswer08.wav", true)
Chatbox.AddSound("that almost made sense", "vo/npc/male01/vanswer09.wav", true)
Chatbox.AddSound("something must be wrong with me i almost understood that", "vo/npc/male01/vanswer10.wav", true)
Chatbox.AddSound("i guess i'm getting used to you vorts", "vo/npc/male01/vanswer11.wav", true)
Chatbox.AddSound("none of your vort philosophy", "vo/npc/male01/vanswer12.wav", true)
Chatbox.AddSound("stop you're killing me", "vo/npc/male01/vanswer13.wav", true)
Chatbox.AddSound("what did i do to deserve this?", "vo/npc/male01/vanswer14.wav", true)
Chatbox.AddSound("stop looking at me like that", "vo/npc/male01/vquestion01.wav", true)
Chatbox.AddSound("some things i just never get used to", "vo/npc/male01/vquestion02.wav", true)
Chatbox.AddSound("i don't know how you things survived as long as you have", "vo/npc/male01/vquestion03.wav", true)
Chatbox.AddSound("sometimes i wonder how i ended up with you", "vo/npc/male01/vquestion04.wav", true)
Chatbox.AddSound("you're alright vorty", "vo/npc/male01/vquestion05.wav", true)
Chatbox.AddSound("you vorts aren't half bad", "vo/npc/male01/vquestion06.wav", true)
Chatbox.AddSound("if anyone ever told me i'd be pals with a vortigaunt", "vo/npc/male01/vquestion07.wav", true)
Chatbox.AddSound("you waiting for somebody?", "vo/npc/male01/waitingsomebody.wav", true)
Chatbox.AddSound("woops", "vo/npc/male01/whoops01.wav", true)
Chatbox.AddSound("you'd better reload", "vo/npc/male01/youdbetterreload01.wav", true)
Chatbox.AddSound("bring it on", "vo/npc/Barney/ba_bringiton.wav", true)
Chatbox.AddSound("damnit", "vo/npc/Barney/ba_damnit.wav")
Chatbox.AddSound("i don't like the looks of this", "vo/npc/Barney/ba_danger02.wav", true)
Chatbox.AddSound("down you go", "vo/npc/Barney/ba_downyougo.wav", true)
Chatbox.AddSound("duck", "vo/npc/Barney/ba_duck.wav")
Chatbox.AddSound("come on", "vo/npc/Barney/ba_followme02.wav")
Chatbox.AddSound("get away from there", "vo/npc/Barney/ba_getaway.wav")
Chatbox.AddSound("get outta the way", "vo/npc/Barney/ba_getoutofway.wav")
Chatbox.AddSound("you're going down", "vo/npc/Barney/ba_goingdown.wav", true)
Chatbox.AddSound("grenade", "vo/npc/Barney/ba_grenade01.wav")
Chatbox.AddSound("here it comes!", "vo/npc/Barney/ba_hereitcomes.wav", true)
Chatbox.AddSound("hurry up", "vo/npc/Barney/ba_hurryup.wav")
Chatbox.AddSound("i'm with you buddy", "vo/npc/Barney/ba_imwithyou.wav", true)
Chatbox.AddSound("maniacal!", "vo/npc/Barney/ba_laugh01.wav", true)
Chatbox.AddSound("yeaheheah", "vo/npc/Barney/ba_laugh03.wav", true)
Chatbox.AddSound("let's do it", "vo/npc/Barney/ba_letsdoit.wav", true)
Chatbox.AddSound("look out!", "vo/npc/Barney/ba_lookout.wav", true)
Chatbox.AddSound("i haven't lost my touch", "vo/npc/Barney/ba_losttouch.wav", true)
Chatbox.AddSound("ohoh yeah", "vo/npc/Barney/ba_ohyeah.wav", true)
Chatbox.AddSound("soldiers!", "vo/npc/Barney/ba_soldiers.wav", true)
Chatbox.AddSound("turret!", "vo/npc/Barney/ba_turret.wav", true)
Chatbox.AddSound("uh oh here they come", "vo/npc/Barney/ba_uhohheretheycome.wav", true)
Chatbox.AddSound("i need to get patched up", "vo/npc/Barney/ba_wounded02.wav", true)
Chatbox.AddSound("i'm hurt pretty bad", "vo/npc/Barney/ba_wounded03.wav", true)
Chatbox.AddSound("i know you will", "vo/NovaProspekt/eli_iknow.wav")
Chatbox.AddSound("nevermind me save yourselves", "vo/NovaProspekt/eli_nevermindme01.wav", true)
Chatbox.AddSound("i'll see you there baby", "vo/NovaProspekt/eli_notime01.wav", true)
Chatbox.AddSound("so this is the combine portal it's smaller than i imagined", "vo/NovaProspekt/eli_thisisportal.wav", true)
Chatbox.AddSound("but where will you go?", "vo/NovaProspekt/eli_wherewillyougo01.wav", true)
Chatbox.AddSound("instinct1", "vo/Breencast/br_instinct01.wav", true)
Chatbox.AddSound("instinct2", "vo/Breencast/br_instinct03.wav", true)
Chatbox.AddSound("instinct3", "vo/Breencast/br_instinct08.wav", true)
Chatbox.AddSound("instinct4", "vo/Breencast/br_instinct09.wav", true)
Chatbox.AddSound("instinct5", "vo/Breencast/br_instinct12.wav", true)
Chatbox.AddSound("instinct6", "vo/Breencast/br_instinct14.wav", true)
Chatbox.AddSound("instinct7", "vo/Breencast/br_instinct15.wav", true)
Chatbox.AddSound("instinct8", "vo/Breencast/br_instinct16.wav", true)
Chatbox.AddSound("instinct9", "vo/Breencast/br_instinct17.wav", true)
Chatbox.AddSound("instinct10", "vo/Breencast/br_instinct18.wav", true)
Chatbox.AddSound("instinct11", "vo/Breencast/br_instinct19.wav", true)
Chatbox.AddSound("instinct12", "vo/Breencast/br_instinct20.wav", true)
Chatbox.AddSound("instinct13", "vo/Breencast/br_instinct21.wav", true)
Chatbox.AddSound("instinct14", "vo/Breencast/br_instinct22.wav", true)
Chatbox.AddSound("instinct15", "vo/Breencast/br_instinct23.wav", true)
Chatbox.AddSound("instinct16", "vo/Breencast/br_instinct25.wav", true)
Chatbox.AddSound("you have plunged humanity in to free fall", "vo/Breencast/br_tofreeman06.wav", true)
Chatbox.AddSound("even if you offered your surrunder now", "vo/Breencast/br_tofreeman07.wav", true)
Chatbox.AddSound("help ensure that humanity's trust in you is not misguided", "vo/Breencast/br_tofreeman10.wav", true)
Chatbox.AddSound("they're shelling us", "vo/canals/male01/stn6_shellingus.wav", true)
Chatbox.AddSound("incoming!", "vo/canals/male01/stn6_incoming.wav", true)
Chatbox.AddSound("you can park the boat it'll be safe here", "vo/canals/male01/gunboat_parkboat.wav", true)
Chatbox.AddSound("let's get a move on we gotta move out before they target us", "vo/canals/male01/gunboat_moveon.wav", true)
Chatbox.AddSound("you made it just in time we gotta clear outta here before we're discovered", "vo/canals/male01/gunboat_justintime.wav", true)
Chatbox.AddSound("we'd better hurry we gotta tear down this camp and get outta here", "vo/canals/male01/gunboat_hurry.wav", true)
Chatbox.AddSound("be careful now", "vo/canals/boxcar_becareful.wav", true)
Chatbox.AddSound("we really can't afford to get noticed", "vo/canals/boxcar_becareful_b.wav", true)
Chatbox.AddSound("better get going", "vo/canals/boxcar_go_nag02.wav", true)
Chatbox.AddSound("he'll help you if you let him", "vo/canals/boxcar_lethimhelp.wav", true)
Chatbox.AddSound("we're just a lookout for the underground railroad", "vo/canals/boxcar_lookout.wav", true)
Chatbox.AddSound("main station's right around the corner", "vo/canals/boxcar_lookout_b.wav", true)
Chatbox.AddSound("they'll get you started on the right foot", "vo/canals/boxcar_lookout_d.wav", true)
Chatbox.AddSound("guess those sirens are for you", "vo/canals/boxcar_sirens.wav", true)
Chatbox.AddSound("come on in i'll show you what you're up against", "vo/canals/gunboat_comein.wav", true)
Chatbox.AddSound("i think he's just finishing up now", "vo/canals/gunboat_finishingup.wav", true)
Chatbox.AddSound("come on get in here", "vo/canals/gunboat_getin.wav", true)
Chatbox.AddSound("here take a look at this", "vo/canals/gunboat_herelook.wav", true)
Chatbox.AddSound("be glad you're not the guy they're looking for", "vo/canals/matt_beglad.wav", true)
Chatbox.AddSound("poor bastard doesn't stand a chance", "vo/canals/matt_beglad_b.wav", true)
Chatbox.AddSound("sounds like they're calling in every cp unit in city 17", "vo/canals/matt_beglad_c.wav", true)
Chatbox.AddSound("that was a close call thanks for your help", "vo/canals/matt_closecall.wav", true)
Chatbox.AddSound("now they're flooding the areas up ahead with manhacks", "vo/canals/matt_flood.wav", true)
Chatbox.AddSound("you'd better get going before they sweep through here", "vo/canals/matt_flood_b.wav", true)
Chatbox.AddSound("you'd better get going now", "vo/canals/matt_go_nag01.wav", true)
Chatbox.AddSound("thanks but i'll be ok", "vo/canals/matt_go_nag02.wav", true)
Chatbox.AddSound("i've got to stay and help any stragglers", "vo/canals/matt_go_nag03.wav", true)
Chatbox.AddSound("you go on", "vo/canals/matt_go_nag05.wav", true)
Chatbox.AddSound("good luck out there", "vo/canals/matt_goodluck.wav", true)
Chatbox.AddSound("civil protection is on to us", "vo/canals/matt_tearinguprr.wav", true)
Chatbox.AddSound("we're tearing up the railroad covering our tracks", "vo/canals/matt_tearinguprr_a.wav", true)
Chatbox.AddSound("looks like you're gonna be the last one through", "vo/canals/matt_tearinguprr_b.wav", true)
Chatbox.AddSound("thanks for the help but you better get outta here", "vo/canals/matt_thanksbut.wav", true)
Chatbox.AddSound("oh shit too late", "vo/canals/matt_toolate.wav", true)
Chatbox.AddSound("you got here at a bad time", "vo/canals/shanty_badtime.wav", true)
Chatbox.AddSound("we got some ammo in those crates over there", "vo/canals/shanty_gotsomeammo.wav", true)
Chatbox.AddSound("we got word you were coming", "vo/canals/shanty_gotword.wav", true)
Chatbox.AddSound("help yourself to supplies and keep moving", "vo/canals/shanty_helpyourself.wav", true)
Chatbox.AddSound("did you realize your contract was open to the highest bidder?", "vo/Citadel/br_bidder_b.wav", true)
Chatbox.AddSound("that's all up to you my old friend", "vo/Citadel/br_gift_a.wav", true)
Chatbox.AddSound("will you give your child a chance her mother never had?", "vo/Citadel/br_gift_c.wav", true)
Chatbox.AddSound("what's this oh put it over there", "vo/Citadel/br_gravgun.wav", true)
Chatbox.AddSound("guards get in here", "vo/Citadel/br_guards.wav", true)
Chatbox.AddSound("you have my gratitude doctor", "vo/Citadel/br_guest_b.wav", true)
Chatbox.AddSound("and then you deliver yourself?", "vo/Citadel/br_guest_d.wav", true)
Chatbox.AddSound("i don't know what you can possibly hope to achieve", "vo/Citadel/br_mock05.wav", true)
Chatbox.AddSound("i warned you this was futile", "vo/Citadel/br_mock06.wav", true)
Chatbox.AddSound("i hope you said your farewells", "vo/Citadel/br_mock09.wav", true)
Chatbox.AddSound("if only you had harnessed your boundless energy for a useful purpose", "vo/Citadel/br_mock13.wav", true)
Chatbox.AddSound("i agree it's a total waste", "vo/Citadel/br_newleader_a.wav", true)
Chatbox.AddSound("this one has proven to be a fine pawn", "vo/Citadel/br_newleader_c.wav", true)
Chatbox.AddSound("i understand if you don't wish to discuss this in front of your friends", "vo/Citadel/br_nothingtosay_a.wav", true)
Chatbox.AddSound("i'll send them on their way and then we can talk openly", "vo/Citadel/br_nothingtosay_b.wav", true)
Chatbox.AddSound("impossible to describe with our limited vocabulary", "vo/Citadel/br_oheli09.wav", true)
Chatbox.AddSound("oh shit", "vo/Citadel/br_ohshit.wav", true)
Chatbox.AddSound("if you won't do the right thing for the good of all people", "vo/Citadel/br_playgame_b.wav", true)
Chatbox.AddSound("maybe you'll do it for one of them", "vo/Citadel/br_playgame_c.wav", true)
Chatbox.AddSound("thanks to you we have everything we need in that regard", "vo/Citadel/br_rabble_a.wav", true)
Chatbox.AddSound("you're more than qualified to finish his research yourself", "vo/Citadel/br_rabble_b.wav", true)
Chatbox.AddSound("if that's what it takes", "vo/Citadel/br_whatittakes.wav", true)
Chatbox.AddSound("you need me", "vo/Citadel/br_youneedme.wav", true)
Chatbox.AddSound("don't struggle honey", "vo/Citadel/eli_dontstruggle.wav", true)
Chatbox.AddSound("don't worry about me", "vo/Citadel/eli_dontworryboutme.wav", true)
Chatbox.AddSound("that's my girl", "vo/Citadel/eli_mygirl.wav", true)
Chatbox.AddSound("save them for what", "vo/Citadel/eli_save.wav", true)
Chatbox.AddSound("is it really that time again?", "vo/Citadel/gman_exit02.wav", true)
Chatbox.AddSound("i'm really not at liberty to say", "vo/Citadel/gman_exit08.wav", true)
Chatbox.AddSound("in the meantime", "vo/Citadel/gman_exit09.wav", true)
Chatbox.AddSound("this is where i get off", "vo/Citadel/gman_exit10.wav", true)
Chatbox.AddSound("they're looking for your car", "vo/coast/barn/male01/chatter.wav", true)
Chatbox.AddSound("here come the dropships", "vo/coast/barn/male01/crapships.wav", true)
Chatbox.AddSound("right along there and watch your step", "vo/coast/barn/male01/exit_watchstep.wav", true)
Chatbox.AddSound("get your car in the barn", "vo/coast/barn/male01/getcarinbarn.wav", true)
Chatbox.AddSound("get your car in the garage", "vo/coast/barn/male01/getcaringarage.wav", true)
Chatbox.AddSound("get off the road", "vo/coast/barn/male01/getoffroad01.wav", true)
Chatbox.AddSound("incoming dropship", "vo/coast/barn/male01/incomingdropship.wav", true)
Chatbox.AddSound("it's a gunship", "vo/coast/barn/male01/lite_gunship01.wav", true)
Chatbox.AddSound("gunship", "vo/coast/barn/male01/lite_gunship02.wav", true)
Chatbox.AddSound("park it there", "vo/coast/barn/male01/parkit.wav", true)
Chatbox.AddSound("you made it", "vo/coast/barn/male01/youmadeit.wav", true)
Chatbox.AddSound("you idiot walking on the sand brings antlions after you", "vo/coast/bugbait/sandy_youidiot.wav", true)
Chatbox.AddSound("you there", "vo/coast/bugbait/sandy_youthere.wav", true)
Chatbox.AddSound("stop where you are stay on the rocks", "vo/coast/bugbait/sandy_stop.wav", true)
Chatbox.AddSound("no! help!", "vo/coast/bugbait/sandy_help.wav", true)
Chatbox.AddSound("yeah good idea hold on a sec", "vo/coast/cardock/le_goodidea.wav", true)
Chatbox.AddSound("patch him up and get him to the back as soon as he's stable", "vo/coast/cardock/le_patchhim.wav", true)
Chatbox.AddSound("i'll radio ahead to let the next base know you're coming", "vo/coast/cardock/le_radio.wav", true)
Chatbox.AddSound("who's hurt?", "vo/coast/cardock/le_whohurt.wav", true)
Chatbox.AddSound("well that's that", "vo/coast/odessa/nlo_cub_thatsthat.wav", true)
Chatbox.AddSound("i couldn't have asked for a finer volunteer", "vo/coast/odessa/nlo_cub_volunteer.wav", true)
Chatbox.AddSound("you'll make it through if anyone can", "vo/coast/odessa/nlo_cub_youllmakeit.wav", true)
Chatbox.AddSound("good to know you", "vo/eli_lab/airlock_cit01.wav", true)
Chatbox.AddSound("you'd better get going", "vo/eli_lab/airlock_cit02.wav", true)
Chatbox.AddSound("awesome!", "vo/eli_lab/al_awesome.wav", true)
Chatbox.AddSound("alright good you keep right on it", "vo/eli_lab/eli_goodvort.wav", true)
Chatbox.AddSound("ughghgh", "vo/eli_lab/eli_handle_b.wav", true)
Chatbox.AddSound("ughhh", "vo/k_lab/ba_thingaway02.wav", true)
Chatbox.AddSound("feel free to look around", "vo/eli_lab/eli_lookaround.wav", true)
Chatbox.AddSound("dr. breen", "vo/eli_lab/eli_vilebiz01.wav", true)
Chatbox.AddSound("i can't look", "vo/k_lab/ba_cantlook.wav", true)
Chatbox.AddSound("careful", "vo/k_lab/ba_careful01.wav")
Chatbox.AddSound("be careful!", "vo/k_lab/ba_careful01.wav", true)
Chatbox.AddSound("forget about that thing", "vo/k_lab/ba_forgetthatthing.wav", true)
Chatbox.AddSound("get it off me", "vo/k_lab/ba_getitoff02.wav", true)
Chatbox.AddSound("get down outta sight", "vo/k_lab/ba_getoutofsight01.wav", true)
Chatbox.AddSound("i'll come find you", "vo/k_lab/ba_getoutofsight02.wav", true)
Chatbox.AddSound("guh", "vo/k_lab/ba_guh.wav", true)
Chatbox.AddSound("hey hey he's back", "vo/k_lab/ba_hesback01.wav", true)
Chatbox.AddSound("i'm getting him outta there", "vo/k_lab/ba_hesback02.wav", true)
Chatbox.AddSound("well is he here?", "vo/k_lab/ba_ishehere.wav", true)
Chatbox.AddSound("you mean it's working?", "vo/k_lab/ba_itsworking01.wav", true)
Chatbox.AddSound("for real this time?", "vo/k_lab/ba_itsworking02.wav", true)
Chatbox.AddSound("i still have nightmares about that cat", "vo/k_lab/ba_itsworking04.wav", true)
Chatbox.AddSound("i've gotta get back on my shift", "vo/k_lab/ba_myshift01.wav", true)
Chatbox.AddSound("but ok", "vo/k_lab/ba_myshift02.wav")
Chatbox.AddSound("yeah longer if we're lucky", "vo/k_lab/ba_longer.wav", true)
Chatbox.AddSound("and not a moment too soon", "vo/k_lab/ba_nottoosoon01.wav", true)
Chatbox.AddSound("that's what you said last time", "vo/k_lab/ba_saidlasttime.wav", true)
Chatbox.AddSound("i can tell your mit education really pays for itself", "vo/k_lab/ba_sarcastic03.wav", true)
Chatbox.AddSound("i thought you got rid of that pest", "vo/k_lab/ba_thatpest.wav", true)
Chatbox.AddSound("there he is", "vo/k_lab/ba_thereheis.wav", true)
Chatbox.AddSound("there you are", "vo/k_lab/ba_thereyouare.wav", true)
Chatbox.AddSound("here we go", "vo/k_lab/ba_thingaway01.wav", true)
Chatbox.AddSound("get that thing away from me", "vo/k_lab/ba_thingaway03.wav", true)
Chatbox.AddSound("what's the meaning of this?", "vo/k_lab/br_tele_02.wav", true)
Chatbox.AddSound("who are you?", "vo/k_lab/br_tele_03.wav")
Chatbox.AddSound("how did you get in here?", "vo/k_lab/br_tele_05.wav", true)
Chatbox.AddSound("see for yourself", "vo/k_lab/eli_seeforyourself.wav", true)
Chatbox.AddSound("shut it down shut it down", "vo/k_lab/eli_shutdown.wav", true)
Chatbox.AddSound("ahhhh", "vo/k_lab/kl_ahhhh.wav", true)
Chatbox.AddSound("there's a charger on the wall", "vo/k_lab/kl_charger01.wav", true)
Chatbox.AddSound("dear me", "vo/k_lab/kl_dearme.wav", true)
Chatbox.AddSound("well did it work?", "vo/k_lab/kl_diditwork.wav", true)
Chatbox.AddSound("excellent!", "vo/k_lab/kl_excellent.wav", true)
Chatbox.AddSound("right you are", "vo/k_lab/kl_fewmoments01.wav", true)
Chatbox.AddSound("speak to you again in a few moments", "vo/k_lab/kl_fewmoments02.wav", true)
Chatbox.AddSound("oh fiddlesticks what now", "vo/k_lab/kl_fiddlesticks.wav", true)
Chatbox.AddSound("final sequence", "vo/k_lab/kl_finalsequence02.wav", true)
Chatbox.AddSound("you must get out of here", "vo/k_lab/kl_getoutrun02.wav", true)
Chatbox.AddSound("run!", "vo/k_lab/kl_getoutrun03.wav", true)
Chatbox.AddSound("here my pet", "vo/k_lab/kl_heremypet01.wav", true)
Chatbox.AddSound("no not up there", "vo/k_lab/kl_heremypet02.wav", true)
Chatbox.AddSound("interference!", "vo/k_lab/kl_interference.wav", true)
Chatbox.AddSound("lamarr", "vo/k_lab/kl_hedyno01.wav", true)
Chatbox.AddSound("heady", "vo/k_lab/kl_hedyno02.wav", true)
Chatbox.AddSound("is lamarr with him?", "vo/k_lab/kl_islamarr.wav", true)
Chatbox.AddSound("lamarr there you are", "vo/k_lab/kl_lamarr.wav", true)
Chatbox.AddSound("careful lamarr those are quite fragile", "vo/k_lab/kl_nocareful.wav", true)
Chatbox.AddSound("conditions could hardly be more ideal", "vo/k_lab/kl_moduli02.wav", true)
Chatbox.AddSound("my goodness", "vo/k_lab/kl_mygoodness01.wav", true)
Chatbox.AddSound("it really is you isn't it?", "vo/k_lab/kl_mygoodness03.wav", true)
Chatbox.AddSound("your talents surpass your loveliness", "vo/k_lab/kl_nonsense.wav", true)
Chatbox.AddSound("oh dear", "vo/k_lab/kl_ohdear.wav", true)
Chatbox.AddSound("indeed it is", "vo/k_lab/kl_packing01.wav", true)
Chatbox.AddSound("slip in to your suit now", "vo/k_lab/kl_slipin02.wav", true)
Chatbox.AddSound("i'm eager to see if your old suit still fits", "vo/k_lab/kl_suitfits02.wav", true)
Chatbox.AddSound("then where is he?", "vo/k_lab/kl_thenwhere.wav", true)
Chatbox.AddSound("what is it?", "vo/k_lab/kl_whatisit.wav")
Chatbox.AddSound("i wish i knew!", "vo/k_lab/kl_wishiknew.wav", true)
Chatbox.AddSound("go on get going", "vo/k_lab2/ba_getgoing.wav", true)
Chatbox.AddSound("well man that's good news", "vo/k_lab2/ba_goodnews.wav", true)
Chatbox.AddSound("i almost gave you guys up for lost", "vo/k_lab2/ba_goodnews_b.wav", true)
Chatbox.AddSound("i'll take all the help i can get", "vo/k_lab2/ba_goodnews_c.wav", true)
Chatbox.AddSound("aw crap incoming!", "vo/k_lab2/ba_incoming.wav", true)
Chatbox.AddSound("so there you see?", "vo/k_lab2/kl_notallhopeless.wav", true)
Chatbox.AddSound("it's not all hopeless", "vo/k_lab2/kl_notallhopeless_b.wav", true)
Chatbox.AddSound("there's only one heady", "vo/k_lab2/kl_onehedy.wav", true)
Chatbox.AddSound("fascinating!", "vo/k_lab2/kl_slowteleport01.wav", true)
Chatbox.AddSound("aim for the head", "vo/ravenholm/aimforthehead.wav", true)
Chatbox.AddSound("guard yourself well", "vo/ravenholm/bucket_guardwell.wav", true)
Chatbox.AddSound("there you are at last", "vo/ravenholm/bucket_thereyouare.wav", true)
Chatbox.AddSound("better than better", "vo/ravenholm/cartrap_better.wav", true)
Chatbox.AddSound("yes come to me come", "vo/ravenholm/engage01.wav", true)
Chatbox.AddSound("come!", {"vo/ravenholm/engage02.wav", "vo/ravenholm/engage03.wav"}, true)
Chatbox.AddSound("i will end your torment", "vo/ravenholm/engage04.wav", true)
Chatbox.AddSound("let me end your torment", "vo/ravenholm/engage05.wav", true)
Chatbox.AddSound("yes my children it is i", "vo/ravenholm/engage06.wav", true)
Chatbox.AddSound("come to the light i carry come", "vo/ravenholm/engage07.wav", true)
Chatbox.AddSound("it is not me you want but the light that shines through me", "vo/ravenholm/engage08.wav", true)
Chatbox.AddSound("come to the light", "vo/ravenholm/engage09.wav", true)
Chatbox.AddSound("go quickly", "vo/ravenholm/exit_goquickly.wav", true)
Chatbox.AddSound("hurry while i hold the gate", "vo/ravenholm/exit_hurry.wav", true)
Chatbox.AddSound("flee brother", "vo/ravenholm/exit_nag01.wav", true)
Chatbox.AddSound("onward to the mines", "vo/ravenholm/exit_nag02.wav", true)
Chatbox.AddSound("look out brother behind you", "vo/ravenholm/firetrap_lookout.wav", true)
Chatbox.AddSound("well done brother", "vo/ravenholm/firetrap_welldone.wav", true)
Chatbox.AddSound("stay close to me brother", "vo/ravenholm/grave_stayclose.wav", true)
Chatbox.AddSound("out of my way", "vo/ravenholm/monk_blocked01.wav", true)
Chatbox.AddSound("look out", "vo/ravenholm/monk_blocked02.wav")
Chatbox.AddSound("stand aside brother", "vo/ravenholm/monk_blocked03.wav", true)
Chatbox.AddSound("cover me brother", "vo/ravenholm/monk_coverme01.wav", true)
Chatbox.AddSound("your assistance brother", "vo/ravenholm/monk_coverme02.wav", true)
Chatbox.AddSound("over here brother", "vo/ravenholm/monk_coverme03.wav", true)
Chatbox.AddSound("to me brother", "vo/ravenholm/monk_coverme04.wav", true)
Chatbox.AddSound("i require your assistance brother", "vo/ravenholm/monk_coverme05.wav", true)
Chatbox.AddSound("where art thou brother", "vo/ravenholm/monk_coverme07.wav", true)
Chatbox.AddSound("beware!", "vo/ravenholm/monk_danger02.wav", true)
Chatbox.AddSound("careful brother", "vo/ravenholm/monk_danger03.wav", true)
Chatbox.AddSound("i am outnumbered", "vo/ravenholm/monk_helpme01.wav", true)
Chatbox.AddSound("help me brother", "vo/ravenholm/monk_helpme02.wav", true)
Chatbox.AddSound("i cannot fight them all alone", "vo/ravenholm/monk_helpme03.wav", true)
Chatbox.AddSound("lend a hand brother", "vo/ravenholm/monk_helpme04.wav", true)
Chatbox.AddSound("i need help brother", "vo/ravenholm/monk_helpme05.wav", true)
Chatbox.AddSound("rest my child", "vo/ravenholm/monk_kill03.wav", true)
Chatbox.AddSound("i think no worse of thee", "vo/ravenholm/monk_kill04.wav", true)
Chatbox.AddSound("may the light of lights be with you", "vo/ravenholm/monk_kill05.wav", true)
Chatbox.AddSound("you meant no harm", "vo/ravenholm/monk_kill06.wav", true)
Chatbox.AddSound("be free my child", "vo/ravenholm/monk_kill09.wav", true)
Chatbox.AddSound("the grave holds nothing worse for you", "vo/ravenholm/monk_kill10.wav", true)
Chatbox.AddSound("i remember your true face", "vo/ravenholm/monk_kill11.wav", true)
Chatbox.AddSound("so again i am alone", "vo/ravenholm/monk_mourn03.wav", true)
Chatbox.AddSound("my advice to you is aim for the head", "vo/ravenholm/shotgun_advice.wav", true)
Chatbox.AddSound("here i have a more suitable gun for you", "vo/ravenholm/shotgun_bettergun.wav", true)
Chatbox.AddSound("catch!", "vo/ravenholm/shotgun_catch.wav", true)
Chatbox.AddSound("come closer", "vo/ravenholm/shotgun_closer.wav", true)
Chatbox.AddSound("hush", "vo/ravenholm/shotgun_hush.wav")
Chatbox.AddSound("good now keep it close", "vo/ravenholm/shotgun_keepitclose.wav", true)
Chatbox.AddSound("they come", "vo/ravenholm/shotgun_theycome.wav", true)
Chatbox.AddSound("if you can hold them off i'm almost done here", "vo/Streetwar/tunnel/male01/c17_06_det02.wav", true)
Chatbox.AddSound("stand back it's gonna blow", "vo/Streetwar/tunnel/male01/c17_06_det04.wav", true)
Chatbox.AddSound("hey it's me open the door", "vo/Streetwar/tunnel/male01/c17_06_password01.wav", true)
Chatbox.AddSound("what's the password?", "vo/Streetwar/tunnel/male01/c17_06_password02.wav", true)
Chatbox.AddSound("password!", "vo/Streetwar/tunnel/male01/c17_06_password03.wav", true)
Chatbox.AddSound("come on in", "vo/Streetwar/tunnel/male01/c17_06_password04.wav", true)
Chatbox.AddSound("ok come across", "vo/Streetwar/tunnel/male01/c17_06_plank01.wav", true)
Chatbox.AddSound("that damn thing haunts me", "vo/Streetwar/sniper/ba_hauntsme.wav", true)
Chatbox.AddSound("did you hear a cat just now?", "vo/Streetwar/sniper/ba_hearcat.wav", true)
Chatbox.AddSound("hey come on", "vo/Streetwar/sniper/ba_heycomeon.wav", true)
Chatbox.AddSound("let's get going", "vo/Streetwar/sniper/ba_letsgetgoing.wav", true)
Chatbox.AddSound("heeelp", "vo/Streetwar/sniper/male01/c17_09_help01.wav", true)
Chatbox.AddSound("help me!", "vo/Streetwar/sniper/male01/c17_09_help02.wav", true)
Chatbox.AddSound("is somebody up there?", "vo/Streetwar/sniper/male01/c17_09_help03.wav", true)
Chatbox.AddSound("damnit all", "vo/Streetwar/rubble/ba_damnitall.wav", true)
Chatbox.AddSound("hey help me out here", "vo/Streetwar/rubble/ba_helpmeout.wav", true)
Chatbox.AddSound("well i'll be damned", "vo/Streetwar/rubble/ba_illbedamned.wav", true)
Chatbox.AddSound("and if you see dr. breen tell him i said fuck you", "vo/Streetwar/rubble/ba_tellbreen.wav", true)
Chatbox.AddSound("done!", "vo/Streetwar/nexus/ba_done.wav", true)
Chatbox.AddSound("great i'll open this up", "vo/Streetwar/nexus/ba_illopenthis.wav", true)
Chatbox.AddSound("so much for stealth we've been spotted", "vo/Streetwar/nexus/ba_spotted.wav", true)
Chatbox.AddSound("we're surrounded", "vo/Streetwar/nexus/ba_surrounded.wav", true)
Chatbox.AddSound("then let's go", "vo/Streetwar/nexus/ba_thenletsgo.wav", true)
Chatbox.AddSound("uh oh dropships", "vo/Streetwar/nexus/ba_uhohdropships.wav", true)
Chatbox.AddSound("hey let us outta here", "vo/Streetwar/nexus/male01/c17_10_letusout.wav", true)
Chatbox.AddSound("let us thru!", "vo/Streetwar/barricade/male01/c17_05_letusthru.wav", true)
Chatbox.AddSound("let us through!", "vo/Streetwar/barricade/male01/c17_05_letusthru.wav", true)
Chatbox.AddSound("open the gate!", "vo/Streetwar/barricade/male01/c17_05_opengate.wav", true)
Chatbox.AddSound("how dare you even mention her", "vo/Citadel/al_dienow_b.wav", true)
Chatbox.AddSound("alyx my dear you have your mother's eyes but your father's stubborn nature", "vo/Citadel/br_stubborn.wav", true)
Chatbox.AddSound("it isn't necessary", "vo/Citadel/mo_necessary.wav", true)

for i = 1, #Chatbox.SoundsCache do
	Chatbox.Sounds[i] = { Chatbox.SoundsCache[i].text, Chatbox.SoundsCache[i].sound[1] } 
end

if( CLIENT ) then
	Chatbox.Lines = {}
	Chatbox.Font = "ChatFont";
	Chatbox.AddedLines = {}
	Chatbox.Tag = {}
	
	local PANEL = {}

	function PANEL:Init()
		self.Str = "";
		self.MaxWidth = 0;
		self.Alpha = 255;
		self.texture = surface.GetTextureID( "gui/silkicons/world" )
		self.playertexture = surface.GetTextureID( "gui/silkicons/world" )
		self.Emoticon = surface.GetTextureID( "gui/silkicons/world" )
		local x, y = 0, 0 
	end

	function PANEL:SetWidth(w)
		self.MaxWidth = tonumber(w) or self.MaxWidth;
	end

	function PANEL:SetString(s)
		self.Str = markup.Parse(tostring(s), self.MaxWidth);
		local x, y = self.Str:Size( )
	end
	
	function PANEL:Size( )
		if self.Str then return self.Str:Size( ) end
	end

	function PANEL:ColorEnhance(alpha)
		self.Alpha = tonumber(alpha)
	end
	
	function PANEL:SetTag(tag)
		if not tag then return end
		self.Tag = tag
		self.texture = surface.GetTextureID( tag )
	end
	
	function PANEL:SetPlayerTag( tag )
		if not tag then return end
		self.PlayerTag = tag
		self.playertexture = surface.GetTextureID( tag )
	end
	
	function PANEL:Paint()
		if self.Tag and self.PlayerTag then
			surface.SetDrawColor( 255, 255, 255, self.Alpha ) 
			surface.SetTexture( self.playertexture )
			surface.DrawTexturedRect( 22, 0, 25, 16 )
			
			surface.SetDrawColor( 255, 255, 255, self.Alpha ) 
			surface.SetTexture( self.texture )
			surface.DrawTexturedRect( 2, 0, 16, 16 )
			self.Str:Draw(50, 0, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, self.Alpha)
		elseif self.PlayerTag then
			surface.SetDrawColor( 255, 255, 255, self.Alpha ) 
			surface.SetTexture( self.playertexture )
			surface.DrawTexturedRect( 2, 0, 25, 16 )
			self.Str:Draw(30, 0, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, self.Alpha)
		elseif self.Tag then
			surface.SetDrawColor( 255, 255, 255, self.Alpha ) 
			surface.SetTexture( self.texture )
			surface.DrawTexturedRect( 2, 0, 16, 16 )
			self.Str:Draw(22, 0, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, self.Alpha)
		else
			self.Str:Draw(2, 0, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, self.Alpha)
		end
	end
	vgui.Register("ChatboxLine", PANEL, "Panel")
	-- End panel.
	
	local ALPHA_CHAT = 0; -- This will fade he chatbox.
	
	-- Create the chatbox.
	function Chatbox.createChatBox()
		bCol = Color(255,255,255,255);
		iCol = Color(0,0,0,255);
		LocalPlayer().LastTime = 1;
		
		Chatbox.Icons = vgui.Create( "DPanelList" )
		Chatbox.Icons:SetSize( 400, 20 )
		Chatbox.Icons:SetPos( 10, ScrH( ) - 410 )
		
		Chatbox.Icons:EnableHorizontal( true ) 
		Chatbox.Icons:SetPadding( 2 )
		Chatbox.Icons:SetSpacing( 5 )
		
		Chatbox.Icons.Paint = function( self )
		--	surface.SetDrawColor(Color(0, 0, 0,ALPHA_CHAT));
			--surface.DrawRect(0, 0, self:GetWide(), self:GetTall());
		end
		
		Chatbox.Icons:SetVisible( false )
		
		local help = {}
		for k, v in pairs( Chatbox.Help ) do
			help[k] = vgui.Create( "DButton" )
			help[k]:SetSize( 16, 16 )
			help[k]:SetText( "" )
			help[k].icon = surface.GetTextureID( Chatbox.Help[k].icon ) 
			
			help[k].OnCursorEntered = function( )
				Chatbox.HelpTip = vgui.Create( "Shop_Tip" )
				Chatbox.HelpTip:SetText( Chatbox.Help[k].text )
				Chatbox.HelpTip:GetPos( help[k] )
			end
			
			help[k].OnCursorExited = function( )
				if Chatbox.HelpTip then
					Chatbox.HelpTip:Remove( )
				end
			end
			
			help[k].Paint = function( )
				surface.SetDrawColor( 255, 255, 255, 255 )
				surface.SetTexture( help[k].icon )
				surface.DrawTexturedRect( 0, 0, 16, 16 )
			end
	
			Chatbox.Icons:AddItem( help[k] ) 
		end
	
		-- Border and main frame.
		Chatbox.ChatBox = vgui.Create("DPanel");
		Chatbox.ChatBox:SetSize(405,200);
		Chatbox.ChatBox:SetPos(10, ScrH() - 400);
		Chatbox.ChatBox:SetVisible(true);
		Chatbox.ChatBox.Paint = function(self)
			if not( LocalPlayer().Chatbox ) then
				ALPHA_CHAT = 0
			else
				ALPHA_CHAT = 200
			end
		--	surface.SetDrawColor(Color(0, 0, 0, ALPHA_CHAT));
		--	surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall());
		end
		
		-- Inside and scrollbar.
		Chatbox.Inner = vgui.Create("DPanelList", Chatbox.ChatBox);
		Chatbox.Inner:SetSize(Chatbox.ChatBox:GetWide()-4, Chatbox.ChatBox:GetTall()-22);
		Chatbox.Inner:SetPos(2,17);
		Chatbox.Inner:EnableVerticalScrollbar(true)
		Chatbox.Inner:SetSpacing( 3 )
		Chatbox.Inner.Paint = function(self)
			surface.SetDrawColor(Color(iCol.r, iCol.g, iCol.b, ALPHA_CHAT))
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall());
		end
			Chatbox.Inner.VBar.btnDown.Paint = function(self)
				draw.RoundedBox(4, 1, 1, self:GetWide()-2, self:GetTall()-2, Color(bCol.r,bCol.g,bCol.b,ALPHA_CHAT))
				draw.RoundedBox(4, 2, 2, self:GetWide()-4, self:GetTall()-4, Color(iCol.r,iCol.g,iCol.b,ALPHA_CHAT))
				if( ALPHA_CHAT == 0 ) then
					self:SetText("");
				else
					self:SetType("down");
				end
			end
			Chatbox.Inner.VBar.btnUp.Paint = function(self)
				draw.RoundedBox(4, 1, 1, self:GetWide()-2, self:GetTall()-2, Color(bCol.r,bCol.g,bCol.b,ALPHA_CHAT))
				draw.RoundedBox(4, 2, 2, self:GetWide()-4, self:GetTall()-4, Color(iCol.r,iCol.g,iCol.b,ALPHA_CHAT))
				if( ALPHA_CHAT == 0 ) then
					self:SetText("");
				else
					self:SetType("up");
				end
			end
			Chatbox.Inner.VBar.btnGrip.Paint = function(self)
				draw.RoundedBox(4, 1, 1, self:GetWide()-2, self:GetTall()-2, Color(bCol.r,bCol.g,bCol.b,ALPHA_CHAT))
				draw.RoundedBox(4, 2, 2, self:GetWide()-4, self:GetTall()-4, Color(iCol.r,iCol.g,iCol.b,ALPHA_CHAT))
			end
			Chatbox.Inner.VBar.Paint = function(self)
				surface.SetDrawColor( Color( 0, 0, 0, ALPHA_CHAT) )
				surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			end
		
		-- Text entry box.
		Chatbox.Entry = vgui.Create("DPanel")
		Chatbox.Entry:SetSize(405, 24);
		Chatbox.Entry:SetPos(10, ScrH() - 200);
		Chatbox.Entry:SetVisible(false);
		Chatbox.Entry.Paint = function(self)
			surface.SetDrawColor(Color(0, 0, 0,ALPHA_CHAT));
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall());
		end
		
		Chatbox.eText = vgui.Create("DTextEntry", Chatbox.Entry)
		Chatbox.eText:SetSize(401,20)
		Chatbox.eText:SetPos(2,2)
		
		Chatbox.updateChatBox()
		
	end
	hook.Add("Initialize", "ChatboxStartUp", Chatbox.createChatBox)
	
	-- Add our chat lines.
	function Chatbox.updateChatBox()
		bCol = Color(255,255,255,255);
		iCol = Color(0,0,0,255);
		if( Chatbox.AddedLines ) then
			local k,v
			for k,v in pairs(Chatbox.AddedLines) do
				v:Remove()
			end
		end
		
		local k,v
		for k,v in pairs(Chatbox.Lines) do
			Chatbox.AddedLines[k] = vgui.Create("ChatboxLine");
			Chatbox.AddedLines[k]:SetWidth(363);
			Chatbox.AddedLines[k]:SetString(tostring(v.Text));
			Chatbox.AddedLines[k]:SetTag( v.Tag )
			Chatbox.AddedLines[k]:SetPlayerTag( v.PlayerTag )
			Chatbox.AddedLines[k]:SetSize(363, Chatbox.AddedLines[k].Str:GetHeight()+2);
			Chatbox.AddedLines[k].Alpha = 255;
			Chatbox.AddedLines[k].Think = function(self)
				if( LocalPlayer().LastTime && LocalPlayer().LastTime < CurTime() && !LocalPlayer().Chatbox ) then
					self.Alpha = 0
				else
					self.Alpha = 255;
				end
				self:ColorEnhance(self.Alpha)
			end
			Chatbox.Inner:AddItem(Chatbox.AddedLines[k]);
		end
		
		local function MoveScrollBarGrip()
			if( Chatbox.Inner.VBar ) then
				Chatbox.Inner.VBar:SetScroll(20000);
			end
		end
		timer.Simple(0.1, MoveScrollBarGrip);
		
	end
	
	function Chatbox.StartChat()
		LocalPlayer().Chatbox = true;
		Chatbox.Entry:SetVisible(true);
		Chatbox.Icons:SetVisible(true);
		Chatbox.updateChatBox()
			return true;
	end
	hook.Add("StartChat", "ChatboxStartChat", Chatbox.StartChat)
	
	function Chatbox.FinishChat()
		LocalPlayer().Chatbox = false;
		LocalPlayer().LastTime = CurTime()+10;
		Chatbox.Icons:SetVisible(false);
		Chatbox.Entry:SetVisible(false);
	end
	hook.Add("FinishChat", "ChatboxFinishChat", Chatbox.FinishChat)
	
	function Chatbox.OnPlayerChat(p, t, teams, dead)
		local nick
		local col
		local line
		local icon = nil
		local CurrentTag = nil
		
		if( IsValid(p) ) then
			nick = string.gsub(tostring(p:Nick()), "[\\/:%*%?<>|]", "");
			col = team.GetColor(p:Team());
		else
			nick = "Console";
			col = Color(255,255,255,255);
			icon = "gui/silkicons/star" 
			Chatbox.AddChatLine( "CONSOLE", "<font=ChatFont><color=red>CONSOLE</color>: "..t.."</font>", "gui/silkicons/star", nil)
			return
		end
		
		if not p.PlayerData then
			icon = nil
			CurrentTag = nil
		else
			CurrentTag = p.PlayerData["tag"] or nil
			
			if p:IsSuperAdmin( ) then
				icon = "gui/silkicons/star" 
			elseif p:IsAdmin( ) then
				icon = "gui/silkicons/shield" 
			elseif p:IsModerator( ) then
				icon = "gui/silkicons/emoticon_smile"
			elseif p:IsDonator( ) then
				icon = "gui/silkicons/heart" 
			else
				icon =  nil
			end
		end
			
		if( IsValid(p) && dead && !teams ) then
			nick = nick;
		end

		local used = tostring(t);

		line = "<font=ChatFont><color="..col.r..","..col.g..","..col.b..",255>"..nick..": </color><color=255,255,255,255>"..string.sub(tostring(used),1,70).."</color></font>";
		
		Chatbox.AddChatLine( p, line, icon or nil, CurrentTag or nil)
		
		for k, v in pairs( Chatbox.Sounds ) do
			if string.lower( t ) == Chatbox.Sounds[k][1] then
				p:EmitSound( tostring(Chatbox.Sounds[k][2]), 100, 100 )
			end
		end
	
		return ""
	end
	hook.Add("OnPlayerChat", "ChatboxOnPlayerChat", Chatbox.OnPlayerChat)
	
	usermessage.Hook( "chatbox_print", function( um )
		Chatbox.AddChatLine( LocalPlayer( ), "<font=ChatFont>"..um:ReadString( ).."</font>", um:ReadString( ) or "gui/silkicons/world", nil )
	end)
	
	function Chatbox.AddChatLine( pl, t, tag, currenttag)
		if not t then return end;
		local text = tostring(t)
		
		if not tag then
			tag = nil
		end
		
		table.insert(Chatbox.Lines, { Text = text, Tag = tag, PlayerTag = currenttag });
		Chatbox.AddSingleLine(pl, t, tag, currenttag)
	end
	
	function Chatbox.AddSingleLine( pl, t, tag, currenttag)
		if not t then return end;
		local text = tostring(t)
		local time = CurTime() + 10;
		local num = #Chatbox.AddedLines + 1;
		
		Chatbox.AddedLines[num] = vgui.Create("ChatboxLine")
		Chatbox.AddedLines[num]:SetWidth(363);
		Chatbox.AddedLines[num]:SetString(tostring(text));
		Chatbox.AddedLines[num]:SetSize(363, Chatbox.AddedLines[num].Str:GetHeight()+2);
		Chatbox.AddedLines[num].Alpha = 255;
		
		Chatbox.AddedLines[num]:SetTag( tag )
		Chatbox.AddedLines[num]:SetPlayerTag( currenttag )
		
		Chatbox.AddedLines[num].Think = function(self)
			if( time < CurTime() ) then
				self.Alpha = math.Clamp(self.Alpha-1, 0, 255);
			else
				self.Alpha = 255;
			end
			self:ColorEnhance(self.Alpha)
		end
		--Chatbox.Inner:AddItem(Chatbox.Tag[num])
		Chatbox.Inner:AddItem(Chatbox.AddedLines[num])
		local function MoveScrollBarGrip()
			if( Chatbox.Inner.VBar ) then
				Chatbox.Inner.VBar:SetScroll(20000);
			end
		end
		timer.Simple(0.1, MoveScrollBarGrip);
		
	end
	
	function Chatbox.ChatTextChanged(t)
		if( string.len(tostring(t)) > 70 ) then
			surface.PlaySound("ui/buttonclickrelease.wav");
			return ""
		end
		Chatbox.eText:SetText(tostring(t))
	end
	hook.Add("ChatTextChanged", "ChatboxTextChanged", Chatbox.ChatTextChanged)
	
	function Chatbox.ChatText( playerindex, playername, text, messagetype )
		if messagetype == "joinleave" then
			return true
		end
	end
	hook.Add( "ChatText", "ChatboxChatText", Chatbox.ChatText )
	
	local oldAddText = chat.AddText
	function chat.AddText(...)
	end
end
		

