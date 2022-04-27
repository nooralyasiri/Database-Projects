from tkinter import *

import sqlite3


# create window
root = Tk() # initiallizing creation of window
root.title('CAR RENTAL DATABASE') # window title
root.geometry("400x250") # size of window

# connecting database
car_rental_connect = sqlite3.connect('car_rental.db')
car_rental_cur = car_rental_connect.cursor()

# --------------------------------------------- FUNCTIONS ---------------------------------------------

# ------------------------------------------- ADD CUSTOMER --------------------------------------------
def addCustomer():
    # global variables
    global cPopup
    global custName
    global pNum

    cPopup = Toplevel(root) # creating new window from root
    cPopup.title("New Customer")
    cPopup.geometry("800x800")

    # customer name
    custName = Entry(cPopup, width = 30) # creates text box
    custName.grid(row = 0, column = 1, padx = 20) # location of text box
    custName_label = Label(cPopup, text = 'Name: ') # label text box
    custName_label.grid(row = 0, column = 0) # location of label

    pNum = Entry(cPopup, width = 30) # creates text box
    pNum.grid(row = 1, column = 1) # location of text box
    pNum_label = Label(cPopup, text = 'Phone: ') # label text box
    pNum_label.grid(row = 1, column = 0) # location of label

    # buttons
    submit_btn = Button(cPopup, text ='Add Customer ', command = custSubmit)
    submit_btn.grid(row = 3, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 140)

    output_btn = Button(cPopup, text = 'Output all Customers', command = custOutput)
    output_btn.grid(row = 4, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 140)

def custSubmit():
    # connecting to database
	custSubmit_conn = sqlite3.connect('car_rental.db')
	custSubmit_cur = custSubmit_conn.cursor()

    # executing command to insert new customer
	custSubmit_cur.execute("INSERT INTO CUSTOMER VALUES (NULL, :Name, :Phone) ",
		{ 
			'Name': custName.get(), # grabs data from custName and inserts data into Name in database
			'Phone': pNum.get(), # grabs from pNum and inserts data into Phone in database
		})

	custSubmit_conn.commit() # commit changes
	custSubmit_conn.close() # close the DB connection

# outputing customers just to see if adding new customer worked
def custOutput():
    # connecting to database
	custOutput_conn = sqlite3.connect('car_rental.db')
	custOutput_cur = custOutput_conn.cursor()

    # executing command to output all customers
	custOutput_cur.execute("SELECT Name, Phone FROM CUSTOMER;",)

	output_records = custOutput_cur.fetchall() #
	print_record = ''

	for output in output_records:
		print_record += str(output[0]+ "   " + output[1] + "\n")

	custOutput_label = Label(cPopup, text = print_record)
	custOutput_label.grid(row = 9, column = 0, columnspan = 2)

	custOutput_conn.commit() # commit changes
	custOutput_conn.close() # close the DB connection

# ------------------------------------------- ADD VEHICLE --------------------------------------------

def addVehicle():
    global vPopup
    vPopup = Toplevel(root) # creating new window from root
    vPopup.title("New Vehicle")
    vPopup.geometry("800x800")

# ------------------------------------------- ADD RENTAL --------------------------------------------
def addRental():
    global rPopup
    rPopup = Toplevel(root) # creating new window from root
    rPopup.title("New Rental")
    rPopup.geometry("800x800")

# ------------------------------------------- RETURN CAR --------------------------------------------

def returnCar():
    global returnPopup
    returnPopup = Toplevel(root) # creating new window from root
    returnPopup.title("Return Car")
    returnPopup.geometry("800x800")

# ------------------------------------------- VIEW DATA ---------------------------------------------

def viewData():
    global viewPopup
    viewPopup = Toplevel(root) # creating new window from root
    viewPopup.title("Data") # rename this
    viewPopup.geometry("800x800")

# ----------------------------------------- END OF FUNCTIONS -----------------------------------------

# ------------------------------------------- ROOT BUTTONS -------------------------------------------

custButton = Button(root, text = "Add Customer", command = addCustomer)
custButton.pack(pady = 15)

vehicleButton = Button(root, text = "Add Vehicle", command = addVehicle)
vehicleButton.pack(pady = 10)

rentalButton = Button(root, text = "Add Car Rental Reservation", command = addRental)
rentalButton.pack(pady = 10)

returnButton = Button(root, text = "Return Car Rental", command = returnCar)
returnButton.pack(pady = 10)

returnButton = Button(root, text = "View Data", command = viewData)
returnButton.pack(pady = 10)




# opens window
root.mainloop()
