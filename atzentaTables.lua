-- atzenta TABLES

function Kataxwrish()
	repeat
		io.write('\nΌνομα: ')
		local Onoma = io.read()
		if Onoma == 'x' then
			ParousiasiMenu()
			EpilogiApoTable()
		else
			ArxeioOnoma(Onoma)
			io.write('Τηλ: ')
			local Thlefwno = io.read('*n','*l')
			-- local Thlefwno = io.read('*n') -- για να δέχεται μόνον αριθμούς
			ArxeioThl(Thlefwno)
		end
	until Onoma == 'x'
end

function ArxeioOnoma(Grapse)
	local h = io.open('atzentaTables.text', 'a')
	h:write(Grapse..': ')
	h:close()
end

function ArxeioThl(Grapse)
	local h = io.open('atzentaTables.text', 'a')
	h:write(Grapse..'\n')
	h:close()
end

function Anagnwsi()
	local h = io.open('atzentaTables.text')
	if not h then
		print('\nΔεν βρίσκω αρχείο! Καταχωρίστε κάτι για να δημιουργηθεί.')
		ParousiasiMenu()
		EpilogiApoTable()
	else
		local Periexomeno = h:read'*a'
		h.close() -- io.close(h) Είναι το ίδιο
		print('\n________\n')
		print(Periexomeno)
		print('________')
		ParousiasiMenu()
		EpilogiApoTable()
	end
end

function Evresi()
	repeat
		io.write('\nΠοιο όνομα ή αριθμό ν\' αναζητήσω; ')
		anazitisi = io.read()
		print()
		local h = io.open('atzentaTables.text')
		local Periexomeno = h:read'*a'

		for anaz in string.gmatch(Periexomeno, ''..anazitisi..': '..'%d+') do
			--Καρφωμένο for anaz in string.gmatch(Periexomeno, 'zzz.*') do
			print(anaz)
		end

		h:close()
	until anazitisi == 'x'
end

-- Oi epiloges einai pinakes mesa ston pinaka MenuTable
local MenuTable = {
	{ Titlos = 'Καταχώριση', Synartisi = Kataxwrish },
	{ Titlos = 'Ανάγνωση', Synartisi = Anagnwsi },
	{ Titlos = 'Εύρεση', Synartisi = Evresi },
	{ Titlos = 'Έξοδος', Synartisi = os.exit }
}

function ParousiasiMenu()
	print()
	for i = 1, #MenuTable do
		io.write(i,'. ',MenuTable[i].Titlos,'\n')
	end
	io.write('\nΕπίλεξε: ')
end

function EpilogiApoTable()
	-- SOS!!! https://stackoverflow.com/questions/30719687/io-read-is-skipped-lua
	local plhktro = io.read('*n','*l')
	-- io.write(plhktro,MenuTable[plhktro].Titlos)
	MenuTable[plhktro].Synartisi()
end

ParousiasiMenu()
EpilogiApoTable()
