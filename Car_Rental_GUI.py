from tkinter import *
from tkinter import ttk

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
	cPopup.geometry("350x210")

	# ---------------------- TEXT BOXES AND LABELS ----------------------
	# customer name
	custName = Entry(cPopup, width = 30) # creates text box
	custName.grid(row = 0, column = 1, pady = 20) # location of text box
	custName_label = Label(cPopup, text = 'Name: ') # label text box
	custName_label.grid(row = 0, column = 0) # location of label

	# phone number
	pNum = Entry(cPopup, width = 30)
	pNum.grid(row = 1, column = 1)
	pNum_label = Label(cPopup, text = 'Phone: ')
	pNum_label.grid(row = 1, column = 0)

	# -------------------------------------------------------------------

	# buttons
	submit_btn = Button(cPopup, text = 'Add Customer ', command = custSubmit)
	submit_btn.grid(row = 3, column = 0, columnspan = 2, pady = 20, padx = 30, ipadx = 100)

	output_btn = Button(cPopup, text = 'Output all Customers', command = custOutput)
	output_btn.grid(row = 4, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 80)


def custSubmit():
	custSubmit_conn = sqlite3.connect('car_rental.db') # connecting to database
	custSubmit_cur = custSubmit_conn.cursor() # cursor

    	# executing command to insert new customer
	custSubmit_cur.execute("INSERT INTO CUSTOMER VALUES (NULL, :Name, :Phone) ",
	{ 
		'Name': custName.get(), # grabs data from custName and inserts data into Name in database
		'Phone': pNum.get(), # grabs from pNum and inserts data into Phone in database
	})

	custSubmit_conn.commit() # commit changes
	custSubmit_conn.close() # close the DB connection


# outputing customers just to see if adding new customer worked
# REMOVE LATER
def custOutput():
	global cOut

	cOut = Toplevel(cPopup)
	cOut.title("Customer Output")
	cOut.geometry("400x600")

	custOutput_conn = sqlite3.connect('car_rental.db') # connecting to database
	custOutput_cur = custOutput_conn.cursor() # cursor


	# executing command to output all customers
	custOutput_cur.execute("SELECT * FROM CUSTOMER;",)

	output_records = custOutput_cur.fetchall()
	print_record = ''

	# integers need to be converted to strings before able to be output
	for output in output_records:
		print_record += str(output[0]) + "   " + output[1] + "   " + output[2] + "\n"

	custOutput_label = Label(cOut, text = print_record)
	custOutput_label.grid(row = 1, column = 1, ipadx = 75)

	custOutput_conn.commit() # commit changes
	custOutput_conn.close() # close the DB connection

# ------------------------------------------- ADD VEHICLE --------------------------------------------

def addVehicle():
	#global variables
	global vPopup 
	global vehicleID
	global carDesc
	global carYear
	global carType
	global category

	vPopup = Toplevel(root) # creating new window from root
	vPopup.title("New Vehicle")
	vPopup.geometry("315x360")

	# ---------------------- TEXT BOXES AND LABELS ----------------------

	# vehicle id
	vehicleID = Entry(vPopup, width = 30) # creates text box
	vehicleID.grid(row = 0, column = 1) # location of text box
	vehicleID_label = Label(vPopup, text = 'Vehicle ID: ') # label text box
	vehicleID_label.grid(row = 0, column = 0, pady = 10) # location of label

	# car description
	carDesc = Entry(vPopup, width = 30)
	carDesc.grid(row = 1, column = 1)
	carDesc_label = Label(vPopup, text = 'Description: ')
	carDesc_label.grid(row = 1, column = 0, pady = 10)

	# year of car
	carYear = Entry(vPopup, width = 30)
	carYear.grid(row = 2, column = 1)
	carYear_label = Label(vPopup, text = 'Year: ')
	carYear_label.grid(row = 2, column = 0, pady = 10)

	# car type
	carType = Entry(vPopup, width = 30)
	carType.grid(row = 3, column = 1)
	carType_label = Label(vPopup, text = 'Type: ')
	carType_label.grid(row = 3, column = 0, pady = 10)

	# category of car
	category = Entry(vPopup, width = 30)
	category.grid(row = 4, column = 1)
	category_label = Label(vPopup, text = 'Category: ')
	category_label.grid(row = 4, column = 0, pady = 10)
	
	# -------------------------------------------------------------------

	# buttons
	submit_btn = Button(vPopup, text = 'Add Vehicle ', command = vehicleSubmit)
	submit_btn.grid(row = 5, column = 0, columnspan = 2, pady = 30, padx = 18, ipadx = 100)

	output_btn = Button(vPopup, text = 'Output All Vehicles', command = vehicleOutput)
	output_btn.grid(row = 6, column = 0, columnspan = 2, pady = 10, padx = 18, ipadx = 80)


def vehicleSubmit():
	vehicleSubmit_conn = sqlite3.connect('car_rental.db') # connecting to database
	vehicleSubmit_cur = vehicleSubmit_conn.cursor() # cursor

    # executing command to insert new vehicle
	vehicleSubmit_cur.execute("INSERT INTO VEHICLE VALUES (:VehicleID, :Description, :Year, :Type, :Category) ",
	{ 
		'VehicleID': vehicleID.get(), 
		'Description': carDesc.get(),
		'Year': carYear.get(),
		'Type': carType.get(),
		'Category': category.get(),
	})

	vehicleSubmit_conn.commit() # commit changes
	vehicleSubmit_conn.close() # close the DB connection


# outputing vehicles just to see if adding new vehicle worked
# REMOVE LATER
def vehicleOutput():
	global vOut

	vOut = Toplevel(vPopup)
	vOut.title("Vehicle Output")
	vOut.geometry("500x500")

	# ---- implementing a scroll bar to be able to see all vehicles ----

	mainFrame = Frame(vOut) # creating a main frame
	mainFrame.pack(fill = BOTH, expand = 1) # similar to grid, just more flexible
	# creating a canvas, can't just place scroll onto a window
	canvas = Canvas(mainFrame)
	canvas.pack(side = LEFT, fill = BOTH, expand = 1)
	# adding a scroll bar to the canvas
	scroll = ttk.Scrollbar(mainFrame, orient = VERTICAL, command = canvas.yview)
	scroll.pack(side = RIGHT, fill = Y)
	# configuring canvas
	canvas.configure(yscrollcommand = scroll.set)
	canvas.bind('<Configure>', lambda e: canvas.configure(scrollregion = canvas.bbox('all')))
	# creating second frame inside canvas, this is where output goes
	secondFrame = Frame(canvas)
	# adding second frame to a window in the canvas
	canvas.create_window((0,0), window = secondFrame, anchor = "nw")

	# --------------------------------------------------------------------

	# connecting to database
	vOut_conn = sqlite3.connect('car_rental.db')
	vOut_cur = vOut_conn.cursor() # cursor

	# executing command to output all customers
	vOut_cur.execute("SELECT * FROM VEHICLE;",)

	output_records = vOut_cur.fetchall()
	print_record = ''

	# integers need to be converted to strings before able to be output
	for output in output_records:
		print_record += output[0]+ "   " + output[1] +  "   " + str(output[2]) + "   " + str(output[3]) + "   " + str(output[4]) +"\n"

	vOut_label = Label(secondFrame, text = print_record)
	vOut_label.grid(row = 1, column = 0, columnspan = 2, padx = 70)

	vOut_conn.commit() # commit changes
	vOut_conn.close() # close the DB connection

# ------------------------------------------- ADD RENTAL --------------------------------------------
def addRental():
    global rPopup
    global custID
    global vehicleID
    global startDate 
    global orderDate 
    global rentalType
    global quantity
    global returnDate 
    global totalAmount
    global paymentDate 
    global returned 

    rPopup = Toplevel(root) # creating new window from root
    rPopup.title("New Rental")
    rPopup.geometry("450x600")

    # ---------------------- TEXT BOXES AND LABELS ----------------------

    # customer ID
    custID = Entry(rPopup, width = 30) # creates text box
    custID.grid(row = 0, column = 1) # location of text box
    custID_label = Label(rPopup, text = 'Customer ID: ') # label text box
    custID_label.grid(row = 0, column = 0, pady = 10) # location of label

    # vehicle ID
    vehicleID = Entry(rPopup, width = 30) # creates text box
    vehicleID.grid(row = 1, column = 1) # location of text box
    vehicleID_label = Label(rPopup, text = 'Vehicle ID: ') # label text box
    vehicleID_label.grid(row = 1, column = 0, pady = 10) # location of label

    # start date
    startDate = Entry(rPopup, width = 30)
    startDate.grid(row = 2, column = 1)
    startDate_label = Label(rPopup, text = 'Start Date: ')
    startDate_label.grid(row = 2, column = 0, pady = 10)

    # order date
    orderDate = Entry(rPopup, width = 30)
    orderDate.grid(row = 3, column = 1)
    orderDate_label = Label(rPopup, text = 'Order Date: ')
    orderDate_label.grid(row = 3, column = 0, pady = 10)

    # rental type
    rentalType = Entry(rPopup, width = 30)
    rentalType.grid(row = 4, column = 1)
    rentalType_label = Label(rPopup, text = 'Rental Type: ')
    rentalType_label.grid(row = 4, column = 0, pady = 10)

    # quantity
    quantity = Entry(rPopup, width = 30)
    quantity.grid(row = 5, column = 1)
    quantity_label = Label(rPopup, text = 'Quantity: ')
    quantity_label.grid(row = 5, column = 0, pady = 10)

    # return date
    returnDate = Entry(rPopup, width = 30)
    returnDate.grid(row = 6, column = 1)
    returnDate_label = Label(rPopup, text = 'Return Date: ')
    returnDate_label.grid(row = 6, column = 0, pady = 10)

    # total amount
    totalAmount = Entry(rPopup, width = 30)
    totalAmount.grid(row = 7, column = 1)
    totalAmount_label = Label(rPopup, text = 'Total Amount: ')
    totalAmount_label.grid(row = 7, column = 0, pady = 10)

    # payment date
    paymentDate = Entry(rPopup, width = 30)
    paymentDate.grid(row = 8, column = 1)
    paymentDate_label = Label(rPopup, text = 'Payment Date: ')
    paymentDate_label.grid(row = 8, column = 0, pady = 10)

    # returned
    returned = Entry(rPopup, width = 30)
    returned.grid(row = 9, column = 1)
    returned_label = Label(rPopup, text = 'Returned: ')
    returned_label.grid(row = 9, column = 0, pady = 10)

  
    # -------------------------------------------------------------------

    # buttons
    submit_btn = Button(rPopup, text = 'Add Rental ', command = rentalSubmit)
    submit_btn.grid(row = 10, column = 0, columnspan = 2, pady = 30, padx = 10, ipadx = 140)
    
    output_btn = Button(rPopup, text = 'Output All Rentals', command = rentalOutput)
    output_btn.grid(row = 11, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 120)

def rentalSubmit():
    rentalSubmit_conn = sqlite3.connect('car_rental.db') # connecting to database
    rentalSubmit_cur = rentalSubmit_conn.cursor() # cursor

    # executing command to insert new rental
    rentalSubmit_cur.execute("INSERT INTO RENTAL VALUES (:CustID, :VehicleID, :startDate, :orderDate, :rentalType, :qty, :returnDate, :totalAmount, :paymentDate, :returned) ",
	{ 
		'CustID': custID.get(),
		'VehicleID': vehicleID.get(), 
		'startDate' : startDate.get(),
		'orderDate' : orderDate.get(),
		'rentalType' : rentalType.get(),
		'qty' : quantity.get(),
		'returnDate' : returnDate.get(),
		'totalAmount' : totalAmount.get(),
		'paymentDate' : paymentDate.get(),
		'returned' : returned.get(),
	})

    rentalSubmit_conn.commit() # commit changes
    rentalSubmit_conn.close() # close the DB connection

# outputing rentals just to see if adding new rental worked
# REMOVE LATER
def rentalOutput():
	global rOut

	rOut = Toplevel(rPopup)
	rOut.title("Rental Output")
	rOut.geometry("500x500")

	# ---- implementing a scroll bar to be able to see all rentals ----

	mainFrame = Frame(rOut) # creating a main frame
	mainFrame.pack(fill = BOTH, expand = 1) # similar to grid, just more flexible
	# creating a canvas, can't just place scroll onto a window
	canvas = Canvas(mainFrame)
	canvas.pack(side = LEFT, fill = BOTH, expand = 1)
	# adding a scroll bar to the canvas
	scroll = ttk.Scrollbar(mainFrame, orient = VERTICAL, command = canvas.yview)
	scroll.pack(side = RIGHT, fill = Y)
	# configuring canvas
	canvas.configure(yscrollcommand = scroll.set)
	canvas.bind('<Configure>', lambda e: canvas.configure(scrollregion = canvas.bbox('all')))
	# creating second frame inside canvas, this is where output goes
	secondFrame = Frame(canvas)
	# adding second frame to a window in the canvas
	canvas.create_window((0,0), window = secondFrame, anchor = "nw")
  # --------------------------------------------------------------------

	# connecting to database
	rOut_conn = sqlite3.connect('car_rental.db')
	rOut_cur = rOut_conn.cursor() # cursor
	
	# executing command to output all rentals
	# rOut_cur.execute("SELECT * FROM RENTAL;",)
	# executing command to output type, category, startDate, returnDate JUST TO SEE IF WE CAN CONNECT TO VEHICLES. CURRENTLY WORKS.
	rOut_cur.execute("SELECT V.Type, V.Category, startDate, returnDate FROM Vehicle as V, RENTAL as R WHERE V.VehicleID=R.VehicleID;",)

	output_records = rOut_cur.fetchall()
	print_record = ''
	
	
	# integers need to be converted to strings before able to be output /  UNCOMMENT TO GET ALL RENTALS AS OUTPUT
	# for output in output_records:
		# print_record += str(output[0])+ "   " + str(output[1]) +  "   " + str(output[2]) + "   " + str(output[3]) + "   " + str(output[4]) + "   " + str(output[5]) + "   " + str(output[6]) + "   " + str(output[7]) + "   " + str(output[8]) + "   " + str(output[9]) +  "\n"
	for output in output_records:
		print_record += str(output[0])+ "   " + str(output[1])  + "   " + str(output[2]) + "   " + str(output[3])+  "\n"

	rOut_label = Label(secondFrame, text = print_record)
	rOut_label.grid(row = 1, column = 0, columnspan = 2, padx = 140)

	rOut_conn.commit() # commit changes
	rOut_conn.close() # close the DB connection


# ------------------------------------------- RETURN CAR --------------------------------------------
def returnCar():
	global returnPopup
	global returnDate
	global custName
	global vehicleID
	global carDesc
	global carYear
	global carType
	global category

	returnPopup = Toplevel(root) # creating new window from root
	returnPopup.title("Return Car")
	returnPopup.geometry("350x445")

	# ---------------------- TEXT BOXES AND LABELS ----------------------

	returnDate = Entry(returnPopup, width = 30) 
	returnDate.grid(row = 0, column = 1) 
	returnDate_label = Label(returnPopup, text = 'Return Date: ') 
	returnDate_label.grid(row = 0, column = 0, pady = 10) 

	# customer name (find a way to link name with id)
	custName = Entry(returnPopup, width = 30) 
	custName.grid(row = 1, column = 1) 
	custName_label = Label(returnPopup, text = 'Name : ') 
	custName_label.grid(row = 1, column = 0, pady = 10) 

	# vehicle id
	vehicleID = Entry(returnPopup, width = 30) 
	vehicleID.grid(row = 2, column = 1) 
	vehicleID_label = Label(returnPopup, text = 'Vehicle ID: ') 
	vehicleID_label.grid(row = 2, column = 0, pady = 10) 

	# car description  
	carDesc = Entry(returnPopup, width = 30)
	carDesc.grid(row = 3, column = 1)
	carDesc_label = Label(returnPopup, text = 'Description: ')
	carDesc_label.grid(row = 3, column = 0, pady = 10)

	# year of car
	carYear = Entry(returnPopup, width = 30)
	carYear.grid(row = 4, column = 1)
	carYear_label = Label(returnPopup, text = 'Year: ')
	carYear_label.grid(row = 4, column = 0, pady = 10)

	# car type
	carType = Entry(returnPopup, width = 30)
	carType.grid(row = 5, column = 1)
	carType_label = Label(returnPopup, text = 'Type: ')
	carType_label.grid(row = 5, column = 0, pady = 10)

	# category of car
	category = Entry(returnPopup, width = 30)
	category.grid(row = 6, column = 1)
	category_label = Label(returnPopup, text = 'Category: ')
	category_label.grid(row = 6, column = 0, pady = 10)

	# -------------------------------------------------------------------

	# buttons
	get_btn = Button(returnPopup, text = 'Retrieve Rental', command = getRentals)
	get_btn.grid(row = 7, column = 0, columnspan = 2, pady = 10, padx = 40, ipadx = 89)

	pay_btn = Button(returnPopup, text = 'Pay Rental', command = payRentals)
	pay_btn.grid(row = 8, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 101)

	submit_btn = Button(returnPopup, text = 'Update Rental', command = UpdateRentals)
	submit_btn.grid(row = 9, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 95)


def getRentals():
	global getOut
	global paid

	getOut = Toplevel(returnPopup)
	getOut.title("Rental")
	getOut.geometry("500x500")

	getRentals_conn = sqlite3.connect('car_rental.db') # connecting to database
	getRentals_cur = getRentals_conn.cursor() # cursor

	getRentals_cur.execute("SELECT TotalAmount, PaymentDate FROM Vehicle as V, RENTAL as R, CUSTOMER as C WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID AND ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? AND Category = ?; ",
	(
		returnDate.get(),
		custName.get(),
		vehicleID.get(), 
		carDesc.get(),
		carYear.get(),
		carType.get(),
		category.get(),
	))

	output_records = getRentals_cur.fetchall()
	print_record = ''

	for output in output_records:
		print_record += "Amount due: $" + str(output[0]) + "\n"

	# ADD COMMAND SO IS PAYMENTDATE IS NULL, THEN DO THE FOLLOWING.. CURRENTLY DOES NOT WORK, TESTING

	# for output in output_records:
	# 	if(output[1] is not None):
	# 		print_record += "Amount due: $" + str(output[0]) + "\n"
	# 		paid = 0
	# 	else:
	# 		print_record += "Amount due: $0 \n"
	# 		paid = 1

	custOutput_label = Label(getOut, text = print_record)
	custOutput_label.grid(row = 1, column = 1, ipadx = 75)
	getRentals_conn.commit() # commit changes
	getRentals_conn.close() # close the DB connection

# DOESNT WORK YET UNTIL I CAN GET THE COMMAND WORKING TO CHANGE PAID = 1 OR = 0
def payRentals():
	global payOut

	payOut = Toplevel(returnPopup)
	payOut.title("Rental")
	payOut.geometry("500x500")

	payrental_conn = sqlite3.connect('car_rental.db') # connecting to database
	payrental_cur = payrental_conn.cursor() # cursor

	if paid == 0:
		payrental_cur.execute("SELECT TotalAmount FROM Vehicle as V, RENTAL as R, CUSTOMER as C WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID AND ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? And Category = ?; ",
		(
			returnDate.get(),
			custName.get(),
			vehicleID.get(), 
			carDesc.get(),
			carYear.get(),
			carType.get(),
			category.get(),
		))

		output_records = payrental_cur.fetchall()
		print_record = ''

		for output in output_records:
				print_record += "Payment of : $" + output[0] + " has been accepted!\n"

		payrental_cur.execute("UPDATE RENTAL SET PaymentDate = ReturnDate")

		paid = 1
	
	elif paid == 1:
		print("Rental has already been paid for.")
	
	else:
		print("Please retrieve car rental first!")

	payrental_conn.commit() # commit changes
	payrental_conn.close() # close the DB connection

# DOESNT WORK YET UNTIL I CAN GET THE COMMAND WORKING TO CHANGE PAID = 1 OR = 0
def UpdateRentals():
	global updateOut

	updateOut = Toplevel(returnPopup)
	updateOut.title("Rental")
	updateOut.geometry("500x500")

	Update_rental_conn = sqlite3.connect('car_rental.db') # connecting to database
	Update_rental_cur = Update_rental_conn.cursor() # cursor
	

	if paid == 1:
		Update_rental_cur.execute("UPDATE RENTAL SET Returned = 1FROM Vehicle as V, RENTAL as R, CUSTOMER as C WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID AND ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? And Category = ?;",
		(
			returnDate.get(),
			custName.get(),
			vehicleID.get(), 
			carDesc.get(),
			carYear.get(),
			carType.get(),
			category.get(),
		))

		Update_rental_cur.execute("SELECT V.VehicleID, Description, Year, Type, Category FROM Vehicle as V, RENTAL as R, CUSTOMER as C WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID AND ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? And Category = ?;",
		(
			returnDate.get(),
			custName.get(),
			vehicleID.get(), 
			carDesc.get(),
			carYear.get(),
			carType.get(),
			category.get(),
		))

		output_records = Update_rental_cur.fetchall()
		print_record = ''

		for output in output_records:
				print_record += "Car rental has been returned! \nVIN: " + output[1] + "\nDescription" + output[2] + "\nYear" + str(output[3]) + "\nType" + str(output[4]) + "\nCategory" + str(output[5])

	elif paid == 0:
		print("Please pay for the rental first.")
	
	else:
		print("Please retrieve car rental first!")

	Update_rental_conn.commit()
	Update_rental_conn.close() # close the DB connection

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
