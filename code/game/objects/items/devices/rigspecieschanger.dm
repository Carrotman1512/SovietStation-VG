/obj/item/device/rigspecieschanger
	name = "hardsuit species modification kit"
	desc = "��������� � ����������, �������������������� ��&#255; ������������� �����."
	icon_state = "modkit"
	var/species = "Human"

	afterattack(obj/O, mob/user as mob)
		if(istype(O,/obj/item/clothing))
			var/obj/item/clothing/C = O
			if(!C.can_change_species)
				usr << "<span class='warning'>�������� � ���� �� ��������.</span>"
				return 0
			else
				usr.visible_message("<span class='notice'>�������� ������ �������������.</span>")
				playsound(user.loc, 'sound/items/Screwdriver.ogg', 100, 1)
				spawn(50)
					C.change_for_species(species)
					usr.visible_message("<span class='notice'>������������&#255; ���������.</span>")
	attack_self(mob/user)
		if(!ishuman(user))
			return 0
		species = input("�������� ����, ��� ������� ����� ��������������� ���") in list("Human","Tajaran","Skrell","Unathi")