
# -- PyQt5 pip install PyQt5

# -- Tkinter pip install tkinter 

# -- Kivy   pip install kivy


from tkinter import *

import sqlite3


# create tkinter window 
root = Tk()
root.title('New Customer')
root.geometry("800x800")


# connecting database
car_rental_connect = sqlite3.connect('carrental.db')
car_rental_cur = car_rental_connect.cursor()



def submit():
	submit_conn = sqlite3.connect('carrental.db')

	submit_cur = submit_conn.cursor()

	submit_cur.execute("INSERT INTO CUSTOMER VALUES (NULL, :Name, :Phone) ",
		{ 
			'Name': custName.get(),
			'Phone': pNum.get(),
		})

	#commit changes

	submit_conn.commit()
	#close the DB connection
	submit_conn.close()



def input_query():

	iq_conn = sqlite3.connect('carrental.db')

	iq_cur = iq_conn.cursor()

	iq_cur.execute("SELECT Name, Phone FROM CUSTOMER;",)

	output_records = iq_cur.fetchall()

	print_record = ''

	for output_record in output_records:
		print_record += str(output_record[0]+ "   " + output_record[1] + "\n")

	iq_label = Label(root, text = print_record)

	iq_label.grid(row = 9, column = 0, columnspan = 2)
	
	#commit changes

	iq_conn.commit()
	#close the DB connection
	iq_conn.close()


#building the gui components
	# pack place grid

	# create text boxes

custName = Entry(root, width = 30)
custName.grid(row = 0, column = 1, padx = 20)

pNum = Entry(root, width = 30)
pNum.grid(row = 1, column = 1)

	#create label

custName_label = Label(root, text = 'Name: ')
custName_label.grid(row =0, column = 0)

pNum_label = Label(root, text = 'Phone: ')
pNum_label.grid(row =1, column = 0)



submit_btn = Button(root, text ='Add Customer ', command = submit)
submit_btn.grid(row = 3, column =0, columnspan = 2, pady = 10, padx = 10, ipadx = 140)

input_qry_btn = Button(root, text = 'Output all Customers', command = input_query)
input_qry_btn.grid(row = 4, column =0, columnspan = 2, pady = 10, padx = 10, ipadx = 140)



#executes tinker components
root.mainloop()
