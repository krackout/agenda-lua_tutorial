-- atzenta

function Menu()
	print('\n1. Καταχώριση')
	print('2. Ανάγνωση')
	print('3. Εύρεση')
	print('4. Έξοδος')
	print()
	io.write('Επίλεξε: ')
	local Epilogi = io.read()

	if Epilogi == '1' then
		print()
		print('Πατώντας x επιστρέφετε στο αρχικό μενού')
		Kataxwrish()
	elseif Epilogi == '2' then
		print()
		Anagnwsi()
	elseif Epilogi == '3' then
		Evresi()
	elseif Epilogi == '4' then
		io.write('\nΓεια σου!\n\n')
		os.exit()
	end
end

function Kataxwrish()
	repeat
		io.write('\nΌνομα: ')
		local Onoma = io.read()
		if Onoma == 'x' then
			Menu()
		else
			Arxeio(Onoma)
			io.write('Τηλ: ')
			local Thlefwno = io.read()
			-- local Thlefwno = io.read('*n') -- για να δέχεται μόνον αριθμούς
			Arxeio(Thlefwno)
		end
	until Onoma =='x'
end

--[[
function Arxeio(Grapse) -- φλύαρη εκδοχή
	-- h is a handle. A file handle allows access to a file. A file handle is a table; the functions within the table are accessed with the dot operator
	local h = io.open('AtzentaPlain.text', 'a')
	io.output(h) -- το γαμημένο δεν χρειάζεται;
	io.write(Grapse..'\n')
	h.close()
	io.output(io.stdout) -- για να επανέλθεις στην κονσόλα, αν κάνεις io.output(file-handler)
end
--]]

function Arxeio(Grapse)
	-- h is a handle. A file handle allows access to a file. A file handle is a table; the functions within the table are accessed with the dot operator
	local h = io.open('AtzentaPlain.text', 'a')
	h:write(Grapse..'\n')
	h:close()
end

function Anagnwsi()
	local h = io.open('AtzentaPlain.text')
	if not h then return nil end
	local Periexomeno = h:read'*a'
	h.close() -- io.close(h) / h.close(h) Είναι το ίδιο
	print('________')
	print(Periexomeno)
	print('________')
	Menu()
end

function Evresi()
	repeat
		print('Ποιο όνομα ή αριθμό ν\' αναζητήσω; ')
		anazitisi = io.read()
		print()
		local h = io.open('AtzentaPlain.text')
		local Periexomeno = h:read'*a'

		---[[
		for anaz in string.gmatch(Periexomeno, anazitisi) do
			print(anaz)
		end
		--]]
		h.close()
	until anazitisi == 'x'
end

Menu()
