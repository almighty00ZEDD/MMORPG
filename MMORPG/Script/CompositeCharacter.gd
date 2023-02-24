extends Node

const body_spritesheet = {
	0 : preload("res://Sprites/Characters/Body/body1.png"),
	1 : preload("res://Sprites/Characters/Body/body2.png"),
	2 : preload("res://Sprites/Characters/Body/body3.png"),
	3 : preload("res://Sprites/Characters/Body/body4.png"),
	4 : preload("res://Sprites/Characters/Body/body5.png"),
	5 : preload("res://Sprites/Characters/Body/body6.png"),
	6 : preload("res://Sprites/Characters/Body/body7.png"),
	7 : preload("res://Sprites/Characters/Body/body8.png")
}

const accessory_spritesheet = {
	0 : preload("res://Sprites/Characters/accessories/earring1.png"),
	1 : preload("res://Sprites/Characters/accessories/earring2.png"),
	2 : preload("res://Sprites/Characters/accessories/earring3.png"),
	3 : preload("res://Sprites/Characters/accessories/earring4.png"),
	4 : preload("res://Sprites/Characters/accessories/glasses1.png"),
	5 : preload("res://Sprites/Characters/accessories/glasses2.png"),
	6 : preload("res://Sprites/Characters/accessories/glasses3.png"),
	7 : preload("res://Sprites/Characters/accessories/glasses4.png"),
	8 : preload("res://Sprites/Characters/accessories/glasses5.png"),
	9 : preload("res://Sprites/Characters/accessories/glasses6.png"),
	10 : preload("res://Sprites/Characters/accessories/glasses7.png"),
	11 : preload("res://Sprites/Characters/accessories/glasses8.png"),
	12 : preload("res://Sprites/Characters/accessories/glasses9.png"),
	13 : preload("res://Sprites/Characters/accessories/glasses10.png"),
	14 : preload("res://Sprites/Characters/accessories/hat_cowboy.png"),
	15 : preload("res://Sprites/Characters/accessories/hat_cowboy.png"),
	16 : preload("res://Sprites/Characters/accessories/hat_lucky.png"),
	17 : preload("res://Sprites/Characters/accessories/hat_pumpkin1.png"),
	18 : preload("res://Sprites/Characters/accessories/hat_pumpkin2.png"),
	19 : preload("res://Sprites/Characters/accessories/hat_witch.png"),
	20 : preload("res://Sprites/Characters/accessories/mask_clown1.png"),
	21 : preload("res://Sprites/Characters/accessories/mask_clown2.png"),
	22 : preload("res://Sprites/Characters/accessories/mask_spooky.png"),
	23 : preload("res://Sprites/Characters/accessories/sun_glasses1.png"),
	24 : preload("res://Sprites/Characters/accessories/sun_glasses2.png"),
	25 : preload("res://Sprites/Characters/accessories/sun_glasses3.png"),
	26 : preload("res://Sprites/Characters/accessories/sun_glasses4.png"),
	27 : preload("res://Sprites/Characters/accessories/sun_glasses5.png"),
	28 : preload("res://Sprites/Characters/accessories/sun_glasses6.png"),
	29 : preload("res://Sprites/Characters/accessories/sun_glasses7.png"),
	30 : preload("res://Sprites/Characters/accessories/sun_glasses8.png"),
	31 : preload("res://Sprites/Characters/accessories/sun_glasses9.png"),
	32 : preload("res://Sprites/Characters/accessories/sun_glasses10.png"),
}

const hair_spritesheet = {
	0 : preload("res://Sprites/Characters/Hair/bob1.png"),
	1 : preload("res://Sprites/Characters/Hair/bob2.png"),
	2 : preload("res://Sprites/Characters/Hair/bob3.png"),
	3 : preload("res://Sprites/Characters/Hair/bob4.png"),
	4 : preload("res://Sprites/Characters/Hair/bob5.png"),
	5 : preload("res://Sprites/Characters/Hair/bob6.png"),
	6 : preload("res://Sprites/Characters/Hair/bob7.png"),
	7 : preload("res://Sprites/Characters/Hair/bob8.png"),
	8 : preload("res://Sprites/Characters/Hair/bob9.png"),
	9 : preload("res://Sprites/Characters/Hair/bob10.png"),
	10 : preload("res://Sprites/Characters/Hair/bob11.png"),
	11 : preload("res://Sprites/Characters/Hair/bob12.png"),
	12 : preload("res://Sprites/Characters/Hair/bob13.png"),
	13 : preload("res://Sprites/Characters/Hair/bob14.png"),
	14 : preload("res://Sprites/Characters/Hair/braids1.png"),
	15 : preload("res://Sprites/Characters/Hair/braids2.png"),
	16 : preload("res://Sprites/Characters/Hair/braids3.png"),
	17 : preload("res://Sprites/Characters/Hair/braids4.png"),
	18 : preload("res://Sprites/Characters/Hair/braids5.png"),
	19 : preload("res://Sprites/Characters/Hair/braids6.png"),
	20 : preload("res://Sprites/Characters/Hair/braids7.png"),
	21 : preload("res://Sprites/Characters/Hair/braids8.png"),
	22 : preload("res://Sprites/Characters/Hair/braids9.png"),
	23 : preload("res://Sprites/Characters/Hair/braids10.png"),
	24 : preload("res://Sprites/Characters/Hair/braids11.png"),
	25 : preload("res://Sprites/Characters/Hair/braids12.png"),
	26 : preload("res://Sprites/Characters/Hair/braids13.png"),
	27 : preload("res://Sprites/Characters/Hair/braids14.png"),
	28 : preload("res://Sprites/Characters/Hair/buzzcut1.png"),
	29 : preload("res://Sprites/Characters/Hair/buzzcut2.png"),
	30 : preload("res://Sprites/Characters/Hair/buzzcut3.png"),
	31 : preload("res://Sprites/Characters/Hair/buzzcut4.png"),
	32 : preload("res://Sprites/Characters/Hair/buzzcut5.png"),
	33 : preload("res://Sprites/Characters/Hair/buzzcut6.png"),
	34 : preload("res://Sprites/Characters/Hair/buzzcut7.png"),
	35 : preload("res://Sprites/Characters/Hair/buzzcut8.png"),
	36 : preload("res://Sprites/Characters/Hair/buzzcut9.png"),
	37 : preload("res://Sprites/Characters/Hair/buzzcut10.png"),
	38 : preload("res://Sprites/Characters/Hair/buzzcut11.png"),
	39 : preload("res://Sprites/Characters/Hair/buzzcut12.png"),
	40 : preload("res://Sprites/Characters/Hair/buzzcut13.png"),
	41 : preload("res://Sprites/Characters/Hair/buzzcut14.png"),
	42 : preload('res://Sprites/Characters/Hair/curly1.png'),
	43 : preload('res://Sprites/Characters/Hair/curly2.png'),
	44 : preload('res://Sprites/Characters/Hair/curly3.png'),
	45 : preload('res://Sprites/Characters/Hair/curly4.png'),
	46 : preload('res://Sprites/Characters/Hair/curly5.png'),
	47 : preload('res://Sprites/Characters/Hair/curly6.png'),
	48 : preload('res://Sprites/Characters/Hair/curly7.png'),
	49 : preload('res://Sprites/Characters/Hair/curly8.png'),
	50 : preload('res://Sprites/Characters/Hair/curly9.png'),
	51 : preload('res://Sprites/Characters/Hair/curly10.png'),
	52 : preload('res://Sprites/Characters/Hair/curly11.png'),
	53 : preload('res://Sprites/Characters/Hair/curly12.png'),
	54 : preload('res://Sprites/Characters/Hair/curly13.png'),
	55 : preload('res://Sprites/Characters/Hair/curly14.png'),
	56 : preload('res://Sprites/Characters/Hair/emo1.png'),
	57 : preload('res://Sprites/Characters/Hair/emo2.png'),
	58 : preload('res://Sprites/Characters/Hair/emo3.png'),
	59 : preload('res://Sprites/Characters/Hair/emo4.png'),
	60 : preload('res://Sprites/Characters/Hair/emo5.png'),
	61 : preload('res://Sprites/Characters/Hair/emo6.png'),
	62 : preload('res://Sprites/Characters/Hair/emo7.png'),
	63 : preload('res://Sprites/Characters/Hair/emo8.png'),
	64 : preload('res://Sprites/Characters/Hair/emo9.png'),
	65 : preload('res://Sprites/Characters/Hair/emo10.png'),
	66 : preload('res://Sprites/Characters/Hair/emo11.png'),
	67 : preload('res://Sprites/Characters/Hair/emo12.png'),
	68 : preload('res://Sprites/Characters/Hair/emo13.png'),
	69 : preload('res://Sprites/Characters/Hair/emo14.png'),
	70 : preload('res://Sprites/Characters/Hair/extra_long1.png'),
	71 : preload('res://Sprites/Characters/Hair/extra_long2.png'),
	72 : preload('res://Sprites/Characters/Hair/extra_long3.png'),
	73 : preload('res://Sprites/Characters/Hair/extra_long4.png'),
	74 : preload('res://Sprites/Characters/Hair/extra_long5.png'),
	75 : preload('res://Sprites/Characters/Hair/extra_long6.png'),
	76 : preload('res://Sprites/Characters/Hair/extra_long7.png'),
	77 : preload('res://Sprites/Characters/Hair/extra_long8.png'),
	78 : preload('res://Sprites/Characters/Hair/extra_long9.png'),
	79 : preload('res://Sprites/Characters/Hair/extra_long10.png'),
	80 : preload('res://Sprites/Characters/Hair/extra_long11.png'),
	81 : preload('res://Sprites/Characters/Hair/extra_long12.png'),
	82 : preload('res://Sprites/Characters/Hair/extra_long13.png'),
	83 : preload('res://Sprites/Characters/Hair/extra_long14.png'),
	84 : preload('res://Sprites/Characters/Hair/extra_long_skirt1.png'),
	85 : preload('res://Sprites/Characters/Hair/extra_long_skirt2.png'),
	86 : preload('res://Sprites/Characters/Hair/extra_long_skirt3.png'),
	87 : preload('res://Sprites/Characters/Hair/extra_long_skirt4.png'),
	88 : preload('res://Sprites/Characters/Hair/extra_long_skirt5.png'),
	89 : preload('res://Sprites/Characters/Hair/extra_long_skirt6.png'),
	90 : preload('res://Sprites/Characters/Hair/extra_long_skirt7.png'),
	91 : preload('res://Sprites/Characters/Hair/extra_long_skirt8.png'),
	92 : preload('res://Sprites/Characters/Hair/extra_long_skirt9.png'),
	93 : preload('res://Sprites/Characters/Hair/extra_long_skirt10.png'),
	94 : preload('res://Sprites/Characters/Hair/extra_long_skirt11.png'),
	95 : preload('res://Sprites/Characters/Hair/extra_long_skirt12.png'),
	96 : preload('res://Sprites/Characters/Hair/extra_long_skirt13.png'),
	97 : preload('res://Sprites/Characters/Hair/extra_long_skirt14.png'),
	98 : preload('res://Sprites/Characters/Hair/french_curl1.png'),
	99 : preload('res://Sprites/Characters/Hair/french_curl2.png'),
	100 : preload('res://Sprites/Characters/Hair/french_curl3.png'),
	101 : preload('res://Sprites/Characters/Hair/french_curl4.png'),
	102 : preload('res://Sprites/Characters/Hair/french_curl5.png'),
	103 : preload('res://Sprites/Characters/Hair/french_curl6.png'),
	104 : preload('res://Sprites/Characters/Hair/french_curl7.png'),
	105 : preload('res://Sprites/Characters/Hair/french_curl8.png'),
	106 : preload('res://Sprites/Characters/Hair/french_curl9.png'),
	107 : preload('res://Sprites/Characters/Hair/french_curl10.png'),
	108 : preload('res://Sprites/Characters/Hair/french_curl11.png'),
	109 : preload('res://Sprites/Characters/Hair/french_curl12.png'),
	110 : preload('res://Sprites/Characters/Hair/french_curl13.png'),
	111 : preload('res://Sprites/Characters/Hair/french_curl14.png'),
	112 : preload('res://Sprites/Characters/Hair/gentleman1.png'),
	113 : preload('res://Sprites/Characters/Hair/gentleman2.png'),
	114 : preload('res://Sprites/Characters/Hair/gentleman3.png'),
	115 : preload('res://Sprites/Characters/Hair/gentleman4.png'),
	116 : preload('res://Sprites/Characters/Hair/gentleman5.png'),
	117 : preload('res://Sprites/Characters/Hair/gentleman6.png'),
	118 : preload('res://Sprites/Characters/Hair/gentleman7.png'),
	119 : preload('res://Sprites/Characters/Hair/gentleman8.png'),
	120 : preload('res://Sprites/Characters/Hair/gentleman9.png'),
	121 : preload('res://Sprites/Characters/Hair/gentleman10.png'),
	122 : preload('res://Sprites/Characters/Hair/gentleman11.png'),
	123 : preload('res://Sprites/Characters/Hair/gentleman12.png'),
	124 : preload('res://Sprites/Characters/Hair/gentleman13.png'),
	125 : preload('res://Sprites/Characters/Hair/gentleman14.png'),
	126 : preload('res://Sprites/Characters/Hair/long_straight1.png'),
	127 : preload('res://Sprites/Characters/Hair/long_straight2.png'),
	128 : preload('res://Sprites/Characters/Hair/long_straight3.png'),
	129 : preload('res://Sprites/Characters/Hair/long_straight4.png'),
	130 : preload('res://Sprites/Characters/Hair/long_straight5.png'),
	131 : preload('res://Sprites/Characters/Hair/long_straight6.png'),
	132 : preload('res://Sprites/Characters/Hair/long_straight7.png'),
	133 : preload('res://Sprites/Characters/Hair/long_straight8.png'),
	134 : preload('res://Sprites/Characters/Hair/long_straight9.png'),
	135 : preload('res://Sprites/Characters/Hair/long_straight10.png'),
	136 : preload('res://Sprites/Characters/Hair/long_straight11.png'),
	137 : preload('res://Sprites/Characters/Hair/long_straight12.png'),
	138 : preload('res://Sprites/Characters/Hair/long_straight13.png'),
	139 : preload('res://Sprites/Characters/Hair/long_straight14.png'),
	140 : preload('res://Sprites/Characters/Hair/midiwave1.png'),
	141 : preload('res://Sprites/Characters/Hair/midiwave2.png'),
	142 : preload('res://Sprites/Characters/Hair/midiwave3.png'),
	143 : preload('res://Sprites/Characters/Hair/midiwave4.png'),
	144 : preload('res://Sprites/Characters/Hair/midiwave5.png'),
	145 : preload('res://Sprites/Characters/Hair/midiwave6.png'),
	146 : preload('res://Sprites/Characters/Hair/midiwave7.png'),
	147 : preload('res://Sprites/Characters/Hair/midiwave8.png'),
	148 : preload('res://Sprites/Characters/Hair/midiwave9.png'),
	149 : preload('res://Sprites/Characters/Hair/midiwave10.png'),
	150 : preload('res://Sprites/Characters/Hair/midiwave11.png'),
	151 : preload('res://Sprites/Characters/Hair/midiwave12.png'),
	152 : preload('res://Sprites/Characters/Hair/midiwave13.png'),
	153 : preload('res://Sprites/Characters/Hair/midiwave14.png'),
	154 : preload('res://Sprites/Characters/Hair/ponytail1.png'),
	155 : preload('res://Sprites/Characters/Hair/ponytail2.png'),
	156 : preload('res://Sprites/Characters/Hair/ponytail3.png'),
	157 : preload('res://Sprites/Characters/Hair/ponytail4.png'),
	158 : preload('res://Sprites/Characters/Hair/ponytail5.png'),
	159 : preload('res://Sprites/Characters/Hair/ponytail6.png'),
	160 : preload('res://Sprites/Characters/Hair/ponytail7.png'),
	161 : preload('res://Sprites/Characters/Hair/ponytail8.png'),
	162 : preload('res://Sprites/Characters/Hair/ponytail9.png'),
	163 : preload('res://Sprites/Characters/Hair/ponytail10.png'),
	164 : preload('res://Sprites/Characters/Hair/ponytail11.png'),
	165 : preload('res://Sprites/Characters/Hair/ponytail12.png'),
	166 : preload('res://Sprites/Characters/Hair/ponytail13.png'),
	167 : preload('res://Sprites/Characters/Hair/ponytail14.png'),
	168 : preload('res://Sprites/Characters/Hair/spacebuns1.png'),
	169 : preload('res://Sprites/Characters/Hair/spacebuns2.png'),
	170 : preload('res://Sprites/Characters/Hair/spacebuns3.png'),
	171 : preload('res://Sprites/Characters/Hair/spacebuns4.png'),
	172 : preload('res://Sprites/Characters/Hair/spacebuns5.png'),
	173 : preload('res://Sprites/Characters/Hair/spacebuns6.png'),
	174 : preload('res://Sprites/Characters/Hair/spacebuns7.png'),
	175 : preload('res://Sprites/Characters/Hair/spacebuns8.png'),
	176 : preload('res://Sprites/Characters/Hair/spacebuns9.png'),
	177 : preload('res://Sprites/Characters/Hair/spacebuns10.png'),
	178 : preload('res://Sprites/Characters/Hair/spacebuns11.png'),
	179 : preload('res://Sprites/Characters/Hair/spacebuns12.png'),
	180 : preload('res://Sprites/Characters/Hair/spacebuns13.png'),
	181 : preload('res://Sprites/Characters/Hair/spacebuns14.png'),
}

const pants_spritesheet = {
	0 : preload('res://Sprites/Characters/clothes/pants/pants1.png'),
	1 : preload('res://Sprites/Characters/clothes/pants/pants2.png'),
	2 : preload('res://Sprites/Characters/clothes/pants/pants3.png'),
	3 : preload('res://Sprites/Characters/clothes/pants/pants4.png'),
	4 : preload('res://Sprites/Characters/clothes/pants/pants5.png'),
	5 : preload('res://Sprites/Characters/clothes/pants/pants6.png'),
	6 : preload('res://Sprites/Characters/clothes/pants/pants7.png'),
	7 : preload('res://Sprites/Characters/clothes/pants/pants8.png'),
	8 : preload('res://Sprites/Characters/clothes/pants/pants9.png'),
	9 : preload('res://Sprites/Characters/clothes/pants/pants10.png'),
	10 : preload('res://Sprites/Characters/clothes/pants/pants_suit1.png'),
	11 : preload('res://Sprites/Characters/clothes/pants/pants_suit2.png'),
	12 : preload('res://Sprites/Characters/clothes/pants/pants_suit3.png'),
	13 : preload('res://Sprites/Characters/clothes/pants/pants_suit4.png'),
	14 : preload('res://Sprites/Characters/clothes/pants/pants_suit5.png'),
	15 : preload('res://Sprites/Characters/clothes/pants/pants_suit6.png'),
	16 : preload('res://Sprites/Characters/clothes/pants/pants_suit7.png'),
	17 : preload('res://Sprites/Characters/clothes/pants/pants_suit8.png'),
	18 : preload('res://Sprites/Characters/clothes/pants/pants_suit9.png'),
	19 : preload('res://Sprites/Characters/clothes/pants/pants_suit10.png'),
	20 : preload('res://Sprites/Characters/clothes/pants/skirt1.png'),
	21 : preload('res://Sprites/Characters/clothes/pants/skirt2.png'),
	22 : preload('res://Sprites/Characters/clothes/pants/skirt3.png'),
	23 : preload('res://Sprites/Characters/clothes/pants/skirt4.png'),
	24 : preload('res://Sprites/Characters/clothes/pants/skirt5.png'),
	25 : preload('res://Sprites/Characters/clothes/pants/skirt6.png'),
	26 : preload('res://Sprites/Characters/clothes/pants/skirt7.png'),
	27 : preload('res://Sprites/Characters/clothes/pants/skirt8.png'),
	28 : preload('res://Sprites/Characters/clothes/pants/skirt9.png'),
	29 : preload('res://Sprites/Characters/clothes/pants/skirt10.png'),
}

const shirt_spritesheet = {
	0 : preload('res://Sprites/Characters/clothes/shirts/basic1.png'),
	1 : preload('res://Sprites/Characters/clothes/shirts/basic2.png'),
	2 : preload('res://Sprites/Characters/clothes/shirts/basic3.png'),
	3 : preload('res://Sprites/Characters/clothes/shirts/basic4.png'),
	4 : preload('res://Sprites/Characters/clothes/shirts/basic5.png'),
	5 : preload('res://Sprites/Characters/clothes/shirts/basic6.png'),
	6 : preload('res://Sprites/Characters/clothes/shirts/basic7.png'),
	7 : preload('res://Sprites/Characters/clothes/shirts/basic8.png'),
	8 : preload('res://Sprites/Characters/clothes/shirts/basic9.png'),
	9 : preload('res://Sprites/Characters/clothes/shirts/basic10.png'),
	10 : preload('res://Sprites/Characters/clothes/shirts/clown1.png'),
	11 : preload('res://Sprites/Characters/clothes/shirts/clown2.png'),
	12 : preload('res://Sprites/Characters/clothes/shirts/dress1.png'),
	13 : preload('res://Sprites/Characters/clothes/shirts/dress2.png'),
	14 : preload('res://Sprites/Characters/clothes/shirts/dress3.png'),
	15 : preload('res://Sprites/Characters/clothes/shirts/dress4.png'),
	16 : preload('res://Sprites/Characters/clothes/shirts/dress5.png'),
	17 : preload('res://Sprites/Characters/clothes/shirts/dress6.png'),
	18 : preload('res://Sprites/Characters/clothes/shirts/dress7.png'),
	19 : preload('res://Sprites/Characters/clothes/shirts/dress8.png'),
	20 : preload('res://Sprites/Characters/clothes/shirts/dress9.png'),
	21 : preload('res://Sprites/Characters/clothes/shirts/dress10.png'),
	22 : preload('res://Sprites/Characters/clothes/shirts/floral1.png'),
	23 : preload('res://Sprites/Characters/clothes/shirts/floral2.png'),
	24 : preload('res://Sprites/Characters/clothes/shirts/floral3.png'),
	25 : preload('res://Sprites/Characters/clothes/shirts/floral4.png'),
	26 : preload('res://Sprites/Characters/clothes/shirts/floral5.png'),
	27 : preload('res://Sprites/Characters/clothes/shirts/floral6.png'),
	28 : preload('res://Sprites/Characters/clothes/shirts/floral7.png'),
	29 : preload('res://Sprites/Characters/clothes/shirts/floral8.png'),
	30 : preload('res://Sprites/Characters/clothes/shirts/floral9.png'),
	31 : preload('res://Sprites/Characters/clothes/shirts/floral10.png'),
	32 : preload('res://Sprites/Characters/clothes/shirts/sailor1.png'),
	33 : preload('res://Sprites/Characters/clothes/shirts/sailor2.png'),
	34 : preload('res://Sprites/Characters/clothes/shirts/sailor3.png'),
	35 : preload('res://Sprites/Characters/clothes/shirts/sailor4.png'),
	36 : preload('res://Sprites/Characters/clothes/shirts/sailor5.png'),
	37 : preload('res://Sprites/Characters/clothes/shirts/sailor6.png'),
	38 : preload('res://Sprites/Characters/clothes/shirts/sailor7.png'),
	39 : preload('res://Sprites/Characters/clothes/shirts/sailor8.png'),
	40 : preload('res://Sprites/Characters/clothes/shirts/sailor9.png'),
	41 : preload('res://Sprites/Characters/clothes/shirts/sailor10.png'),
	42 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow1.png'),
	43 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow2.png'),
	44 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow3.png'),
	45 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow4.png'),
	46 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow5.png'),
	47 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow6.png'),
	48 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow7.png'),
	49 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow8.png'),
	50 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow9.png'),
	51 : preload('res://Sprites/Characters/clothes/shirts/sailor_bow10.png'),
	52 : preload('res://Sprites/Characters/clothes/shirts/skull1.png'),
	53 : preload('res://Sprites/Characters/clothes/shirts/skull2.png'),
	54 : preload('res://Sprites/Characters/clothes/shirts/skull3.png'),
	55 : preload('res://Sprites/Characters/clothes/shirts/skull4.png'),
	56 : preload('res://Sprites/Characters/clothes/shirts/skull5.png'),
	57 : preload('res://Sprites/Characters/clothes/shirts/skull6.png'),
	58 : preload('res://Sprites/Characters/clothes/shirts/skull7.png'),
	59 : preload('res://Sprites/Characters/clothes/shirts/skull8.png'),
	60 : preload('res://Sprites/Characters/clothes/shirts/skull9.png'),
	61 : preload('res://Sprites/Characters/clothes/shirts/skull10.png'),
	62 : preload('res://Sprites/Characters/clothes/shirts/spaghetti1.png'),
	63 : preload('res://Sprites/Characters/clothes/shirts/spaghetti2.png'),
	64 : preload('res://Sprites/Characters/clothes/shirts/spaghetti3.png'),
	65 : preload('res://Sprites/Characters/clothes/shirts/spaghetti4.png'),
	66 : preload('res://Sprites/Characters/clothes/shirts/spaghetti5.png'),
	67 : preload('res://Sprites/Characters/clothes/shirts/spaghetti6.png'),
	68 : preload('res://Sprites/Characters/clothes/shirts/spaghetti7.png'),
	69 : preload('res://Sprites/Characters/clothes/shirts/spaghetti8.png'),
	70 : preload('res://Sprites/Characters/clothes/shirts/spaghetti9.png'),
	71 : preload('res://Sprites/Characters/clothes/shirts/spaghetti10.png'),
	72 : preload("res://Sprites/Characters/clothes/shirts/spooky.png"),
	73 : preload('res://Sprites/Characters/clothes/shirts/sporty1.png'),
	74 : preload('res://Sprites/Characters/clothes/shirts/sporty2.png'),
	75 : preload('res://Sprites/Characters/clothes/shirts/sporty3.png'),
	76 : preload('res://Sprites/Characters/clothes/shirts/sporty4.png'),
	77 : preload('res://Sprites/Characters/clothes/shirts/sporty5.png'),
	78 : preload('res://Sprites/Characters/clothes/shirts/sporty6.png'),
	79 : preload('res://Sprites/Characters/clothes/shirts/sporty7.png'),
	80 : preload('res://Sprites/Characters/clothes/shirts/sporty8.png'),
	81 : preload('res://Sprites/Characters/clothes/shirts/sporty9.png'),
	82 : preload('res://Sprites/Characters/clothes/shirts/sporty10.png'),
	83 : preload('res://Sprites/Characters/clothes/shirts/stripes1.png'),
	84 : preload('res://Sprites/Characters/clothes/shirts/stripes2.png'),
	85 : preload('res://Sprites/Characters/clothes/shirts/stripes3.png'),
	86 : preload('res://Sprites/Characters/clothes/shirts/stripes4.png'),
	87 : preload('res://Sprites/Characters/clothes/shirts/stripes5.png'),
	88 : preload('res://Sprites/Characters/clothes/shirts/stripes6.png'),
	89 : preload('res://Sprites/Characters/clothes/shirts/stripes7.png'),
	90 : preload('res://Sprites/Characters/clothes/shirts/stripes8.png'),
	91 : preload('res://Sprites/Characters/clothes/shirts/stripes9.png'),
	92 : preload('res://Sprites/Characters/clothes/shirts/stripes10.png'),
	93 : preload('res://Sprites/Characters/clothes/shirts/suit1.png'),
	94 : preload('res://Sprites/Characters/clothes/shirts/suit2.png'),
	95 : preload('res://Sprites/Characters/clothes/shirts/suit3.png'),
	96 : preload('res://Sprites/Characters/clothes/shirts/suit4.png'),
	97 : preload('res://Sprites/Characters/clothes/shirts/suit5.png'),
	98 : preload('res://Sprites/Characters/clothes/shirts/suit6.png'),
	99 : preload('res://Sprites/Characters/clothes/shirts/suit7.png'),
	100 : preload('res://Sprites/Characters/clothes/shirts/suit8.png'),
	101 : preload('res://Sprites/Characters/clothes/shirts/suit9.png'),
	102 : preload('res://Sprites/Characters/clothes/shirts/suit10.png'),
	103 : preload('res://Sprites/Characters/clothes/shirts/witch.png'),
}
