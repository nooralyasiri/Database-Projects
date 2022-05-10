from tkinter import *
from tkinter import ttk

import sqlite3



# create window
root = Tk() # initiallizing creation of window
root.title('CAR RENTAL DATABASE') # window title
root.geometry("400x290") # size of window

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
    # -- 
    global carType 
    global category

    rPopup = Toplevel(root) # creating new window from root
    rPopup.title("New Rental")
    rPopup.geometry("450x800")

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

    # -------------------------------------------------------------------

    carType = Entry(rPopup, width = 30)
    carType.grid(row = 12, column = 1)
    carType_label = Label(rPopup, text = 'Car Type: ')
    carType_label.grid(row = 12, column = 0, pady = 10)

    category = Entry(rPopup, width = 30)
    category.grid(row = 13, column = 1)
    category_label = Label(rPopup, text = 'Category: ')
    category_label.grid(row = 13, column = 0, pady = 10)

    # -------------------------------------------------------------------
    # output selected rentals 

    check_btn = Button(rPopup, text = 'Output Selected Rentals', command = getRental)
    check_btn.grid(row = 14, column = 0, columnspan = 2, pady = 10, padx = 10, ipadx = 120)

    # -------------------------------------------------------------------

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

# --------------------------------------------------------------------

def getRental():
  global rOut

  rOut = Toplevel(rPopup)
  rOut.title("Rental Availability")
  rOut.geometry("400x400")

  getRental_conn = sqlite3.connect('car_rental.db') # connecting to database
  getRental_cur = getRental_conn.cursor() # cursor

  getRental_cur.execute("""SELECT V.VehicleID, V.Type, V.Category, startDate, returnDate 
							FROM Vehicle as V, RENTAL as R 
							WHERE V.VehicleID = R.VehicleID  
							AND R.Returned=1 AND (R.startDate NOT BETWEEN ? AND ?) AND (R.returnDate NOT BETWEEN ? AND ?)
              						AND V.Type = ? AND V.Category = ?; """,
	(
    returned.get(),
    vehicleID.get(),
    startDate.get(),
    returnDate.get(), 
    carType.get(),
    category.get(),
	))

  output_records = getRental_cur.fetchall()
  print_record = ''

  for output in output_records:
    print_record += str(output[0])+ "   " + str(output[1]) +  "   " + str(output[2]) + "   " + str(output[3]) + "   " + str(output[4]) + "\n"

  getRental_label = Label(rOut, text = print_record)
  getRental_label.grid(row = 1, column = 1, ipadx = 50, ipady = 35)
  getRental_conn.commit() # commit changes
  getRental_conn.close() # close the DB connection



# --------------------------------------------------------------------

def rentalOutput():
  global rOut
  rOut = Toplevel(rPopup)
  rOut.title("Rental Output")
  rOut.geometry("900x600")

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
  rOut_cur.execute("SELECT * FROM RENTAL;",)

  output_records = rOut_cur.fetchall()
  print_record = ''
	
	
	# integers need to be converted to strings before able to be output /  UNCOMMENT TO GET ALL RENTALS AS OUTPUT
  for output in output_records:
    print_record += str(output[0])+ "   " + str(output[1]) +  "   " + str(output[2]) + "   " + str(output[3]) + "   " + str(output[4]) + "   " + str(output[5]) + "   " + str(output[6]) + "   " + str(output[7]) + "   " + str(output[8]) + "   " + str(output[9]) +  "\n"
  rOut_label=Label(secondFrame, text=print_record)
  rOut_label.grid(row = 1, column = 0, columnspan = 2, padx = 140)
  rOut_conn.commit()
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
	custName_label = Label(returnPopup, text = 'Name: ') 
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

	getOut = Toplevel(returnPopup)
	getOut.title("Rental")
	getOut.geometry("200x100")

	getRentals_conn = sqlite3.connect('car_rental.db') # connecting to database
	getRentals_cur = getRentals_conn.cursor() # cursor

	getRentals_cur.execute("""SELECT SUM(TotalAmount), PaymentDate 
							FROM Vehicle as V, RENTAL as R, CUSTOMER as C 
							WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID 
							AND ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? AND Category = ?; """,
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
		# if customer has not paid yet
		if(output[1] is None):
			print_record += "Amount due: $" + str(output[0]) + "\n"
		# if customer has already paid
		elif(output[1] is not None):
			print_record += "Amount due: $0.00 \n"

	getRentals_label = Label(getOut, text = print_record)
	getRentals_label.grid(row = 1, column = 1, ipadx = 50, ipady = 35)

	getRentals_conn.commit() # commit changes
	getRentals_conn.close() # close the DB connection


def payRentals():
	global payOut

	payOut = Toplevel(returnPopup)
	payOut.title("Rental")
	payOut.geometry("300x100")

	payrental_conn = sqlite3.connect('car_rental.db') # connecting to database
	payrental_cur = payrental_conn.cursor() # cursor

	payrental_cur.execute("""SELECT TotalAmount, PaymentDate
							FROM Vehicle as V, RENTAL as R, CUSTOMER as C 
							WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID 
							AND ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? AND Category = ?; """,
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
		# if customer has not paid yet
		if(output[1] is None):
			print_record += "Payment of $" + str(output[0]) + " has been accepted!\n"
			payrental_cur.execute("""UPDATE RENTAL as R
									SET PaymentDate = :rdate
									FROM CUSTOMER as C, VEHICLE as V
									WHERE R.custID = C.custID
										AND R.VehicleID = V.VehicleID
										AND C.Name = :Name
										AND V.VehicleID = :VehicleID
										AND ReturnDate = :rdate; """,
			{
				'rdate': returnDate.get(),
				'Name':custName.get(),
				'VehicleID': vehicleID.get(), 
			})

		# if customer has already paid
		elif(output[1] is not None):
			print_record += "Rental has already been paid for."

	payRental_label = Label(payOut, text = print_record)
	payRental_label.grid(row = 1, column = 1, ipadx = 60, ipady = 35)

	payrental_conn.commit() # commit changes
	payrental_conn.close() # close the DB connection


def UpdateRentals():
	global updateOut

	updateOut = Toplevel(returnPopup)
	updateOut.title("Rental")
	updateOut.geometry("300x200")

	Update_rental_conn = sqlite3.connect('car_rental.db') # connecting to database
	Update_rental_cur = Update_rental_conn.cursor() # cursor
	

	Update_rental_cur.execute("""SELECT PaymentDate, Returned, V.VehicleID, Description, Year, Type, Category 
		FROM Vehicle as V, RENTAL as R, CUSTOMER as C 
		WHERE V.VehicleID = R.VehicleID AND C.CustID = R.CustID 
		AND R.ReturnDate = ? AND Name = ? AND V.VehicleID = ? AND Description = ? AND Year = ? AND Type = ? And Category = ?;""",
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
		# if rental has been paid for
		if(output[0] is not None):
			# if rental has not been returned yet
			if(output[1] == 0):
				print_record += "Car rental has been returned! \n\nRENTAL CAR INFO\n\nVIN: " + output[2] + "\nDescription: " + output[3] + "\nYear: " + str(output[4]) + "\nType: " + str(output[5]) + "\nCategory: " + str(output[6])
				Update_rental_cur.execute("""UPDATE RENTAL as R
												SET Returned = 1 
												FROM CUSTOMER as C, VEHICLE as V
												WHERE R.custID = C.custID
													AND R.VehicleID = V.VehicleID
													AND C.Name = :Name
													AND V.VehicleID = :VehicleID
													AND ReturnDate = :rdate; """,
				{
					'rdate': returnDate.get(),
					'Name':custName.get(),
					'VehicleID': vehicleID.get(), 
				})

			# if rental has already been returned
			elif(output[1] == 1):
				print_record += "Car has already been returned."
		# if rental has not been paid for
		elif(output[0] is None):
			print_record += "Please pay for the rental first."


	Update_rental_label = Label(updateOut, text = print_record)
	Update_rental_label.grid(row = 1, column = 1, ipadx = 70, ipady = 35)

	Update_rental_conn.commit()
	Update_rental_conn.close() # close the DB connection

# ------------------------------------------- CUSTOMER SEARCH ---------------------------------------------

def custData():
	global csPopup
	global custTree
	csPopup = Toplevel(root) # creating new window from root
	csPopup.title("Customer Database")
	csPopup.geometry("400x400")

	# -------------------------------- creating treeview --------------------------------
	# adding colors and style to view
	style = ttk.Style()
	style.theme_use("default")
	style.configure("Treeview",
		background = "white",
		rowheight = 25,
		fieldbackground = "#e0e0e0")
	# selection color
	style.map('Treeview',
		background=[('selected', 'lightblue')])

	# treeview frame
	treeframe = Frame(csPopup)
	treeframe.pack(pady = 20)

	# treeview scrollbar
	treescroll = Scrollbar(treeframe)
	treescroll.pack(side = RIGHT, fill = Y)

	# creating treeview in frame
	custTree = ttk.Treeview(treeframe, yscrollcommand = treescroll.set, selectmode = 'browse')
	custTree.pack()

	# scrollbar configuration
	treescroll.config(command = custTree.yview)

	# defining columns
	custTree['columns'] = ("ID", "Name", "Remaining Balance")

	# formatting columns
	custTree.column("#0", width = 0, stretch = NO)
	custTree.column("ID", anchor = CENTER, width = 100)
	custTree.column("Name", anchor = CENTER, width = 100)
	custTree.column("Remaining Balance", anchor = CENTER, width = 150)

	# headings
	custTree.heading("#0", text = "", anchor = W)
	custTree.heading("ID", text = "Customer ID", anchor = CENTER)
	custTree.heading("Name", text = "Name", anchor = CENTER)
	custTree.heading("Remaining Balance", text = "Remaining Balance", anchor = CENTER)
	# -------------------------------------------------------------------------------------

	#connect to database
	custSearch_conn = sqlite3.connect('car_rental.db') # connecting to database
	custSearch_cur = custSearch_conn.cursor() # cursor

	# Adding data to view
	custSearch_cur.execute("""SELECT custID, Name,
								CASE 
									WHEN RentalBalance IS NULL THEN '0'
									ELSE SUM(RentalBalance)
								END AS RemainingBalance
								FROM CUSTOMER
								LEFT JOIN VRENTALINFO
								ON CustomerID = custID
								GROUP BY custID;""")
	output_records = custSearch_cur.fetchall()
	
	custTree.tag_configure('odd', background = "white")
	custTree.tag_configure('even', background = "lightblue")

	count = 0
	for output in output_records:
		if count % 2 == 0:
			custTree.insert(parent = '', index = 'end', iid = count, text = "", values = (str(output[0]), output[1], '$' + str(output[2]) + '.00'), tags = ('even',))
		else:
			custTree.insert(parent = '', index = 'end', iid = count, text = "", values = (str(output[0]), output[1], '$' + str(output[2]) + '.00'), tags = ('odd',))
		count += 1

	
	# button
	search_btn = Button(csPopup, text = 'Search', command = custSearchInput)
	search_btn.pack(pady = 20, padx = 30, ipadx = 100)
		
		
def custSearchInput():
	global cSearch
	global sentryID
	global sentryName
	cSearch = Toplevel(root)
	cSearch.title("Search Customer Database")
	cSearch.geometry("400x300")

	# create label frame
	sframeID = LabelFrame(cSearch, text = "Customer ID")
	sframeID.pack(padx = 10, pady = 10)
	# text box
	sentryID = Entry(sframeID)
	sentryID.pack(pady = 20, padx = 20)

	# create label frame
	sframeName = LabelFrame(cSearch, text = "Customer Name")
	sframeName.pack(padx = 10, pady = 10)
	# text box
	sentryName = Entry(sframeName)
	sentryName.pack(pady = 20, padx = 20)

	# button
	sbtn = Button(cSearch, text = 'Search Database', command = custSearch)
	sbtn.pack(pady = 20, padx = 20)


def custSearch():
	
	if sentryID.get() and sentryName.get():
		record1 = sentryID.get()
		record2 = sentryName.get()
		cSearch.destroy() # closes search box

		# clear treeview
		for r in custTree.get_children():
			custTree.delete(r)

		conn = sqlite3.connect('car_rental.db')
		cur = conn.cursor()

		cur.execute("""SELECT custID, Name,
						CASE 
							WHEN RentalBalance IS NULL THEN 0
							ELSE SUM(RentalBalance)
						END AS RemainingBalance
						FROM CUSTOMER
						LEFT JOIN VRENTALINFO
						ON CustomerID = custID
						WHERE custID = ?
						AND Name like ?
						GROUP BY custID; """, (record1, '%' + record2 + '%',))
		
		output_records = cur.fetchall()

	elif sentryID.get():
		record = sentryID.get()
		cSearch.destroy() # closes search box

		# clear treeview
		for r in custTree.get_children():
			custTree.delete(r)

		conn = sqlite3.connect('car_rental.db')
		cur = conn.cursor()

		cur.execute("""SELECT custID, Name,
						CASE 
							WHEN RentalBalance IS NULL THEN 0
							ELSE SUM(RentalBalance)
						END AS RemainingBalance
						FROM CUSTOMER
						LEFT JOIN VRENTALINFO
						ON CustomerID = custID
						WHERE custID = ?
						GROUP BY custID; """, (record,))
		
		output_records = cur.fetchall()

	elif sentryName.get():
		record = sentryName.get()
		cSearch.destroy() # closes search box

		# clear treeview
		for r in custTree.get_children():
			custTree.delete(r)

		conn = sqlite3.connect('car_rental.db')
		cur = conn.cursor()

		cur.execute("""SELECT custID, Name,
						CASE 
							WHEN RentalBalance IS NULL THEN 0
							ELSE SUM(RentalBalance)
						END AS RemainingBalance
						FROM CUSTOMER
						LEFT JOIN VRENTALINFO
						ON CustomerID = custID
						WHERE Name like ?
						GROUP BY custID; """, ('%' + record + '%',))
		
		output_records = cur.fetchall()

	elif not sentryName.get() and not sentryID.get():

		cSearch.destroy() # closes search box

		# clear treeview
		for r in custTree.get_children():
			custTree.delete(r)

		conn = sqlite3.connect('car_rental.db')
		cur = conn.cursor()

		cur.execute("""SELECT custID, Name,
						CASE 
							WHEN RentalBalance IS NULL THEN 0
							ELSE SUM(RentalBalance)
						END AS RemainingBalance
						FROM CUSTOMER
						LEFT JOIN VRENTALINFO
						ON CustomerID = custID
						GROUP BY custID
						ORDER BY RemainingBalance DESC; """,)
		
		output_records = cur.fetchall()
		


	count = 0
	for output in output_records:
		if count % 2 == 0:
			custTree.insert(parent = '', index = 'end', iid = count, text = "", values = (str(output[0]), output[1], '$' + str(output[2]) + '.00'), tags = ('even',))
		else:
			custTree.insert(parent = '', index = 'end', iid = count, text = "", values = (str(output[0]), output[1], '$' + str(output[2]) + '.00'), tags = ('odd',))
		count += 1

	conn.commit()
	conn.close()

# ------------------------------------------- Vehicle SEARCH ---------------------------------------------

def vData():
	global vsPopup
	global vtree
	vsPopup = Toplevel(root)
	vsPopup.title("Vehicle Database")
	vsPopup.geometry("500x400")
	
	style = ttk.Style()
	style.theme_use("default")
	style.configure("Treeview",
		background = "white",
		rowheight = 25,
		fieldbackground = "#e0e0e0")
	# selection color
	style.map('Treeview',
		background=[('selected', 'lightblue')])

	# treeview frame
	treeframe = Frame(vsPopup)
	treeframe.pack(pady = 20)

	# treeview scrollbar
	treescroll = Scrollbar(treeframe)
	treescroll.pack(side = RIGHT, fill = Y)

	# creating treeview in frame
	vtree = ttk.Treeview(treeframe, yscrollcommand = treescroll.set, selectmode = 'browse')
	vtree.pack()

	# scrollbar configuration
	treescroll.config(command = vtree.yview)

	# defining columns
	vtree['columns'] = ("VID", "Desc", "Avg")

	# formatting columns
	vtree.column("#0", width = 0, stretch = NO)
	vtree.column("VID", anchor = CENTER, width = 140)
	vtree.column("Desc", anchor = CENTER, width = 140)
	vtree.column("Avg", anchor = CENTER, width = 130)

	# headings
	vtree.heading("#0", text = "", anchor = W)
	vtree.heading("VID", text = "VIN", anchor = CENTER)
	vtree.heading("Desc", text = "Description", anchor = CENTER)
	vtree.heading("Avg", text = "Avg Daily Price", anchor = CENTER)
	# -------------------------------------------------------------------------------------

	#connect to database
	vSearch_conn = sqlite3.connect('car_rental.db') # connecting to database
	vSearch_cur = vSearch_conn.cursor() # cursor

	# Adding data to view
	vSearch_cur.execute("""SELECT VehicleID as VIN, Description,
								CASE 
									WHEN OrderAmount IS NULL THEN 'Non-Applicable'
									ELSE OrderAmount/TotalDays
								END AS 'Daily Rate'
							FROM VEHICLE as V
							LEFT JOIN VRENTALINFO as VI
							ON V.VehicleID = VI.VIN
							GROUP BY VehicleID;""")

	output_records = vSearch_cur.fetchall()

	vtree.tag_configure('odd', background = "white")
	vtree.tag_configure('even', background = "lightblue")

	count = 0
	for output in output_records:
		if count % 2 == 0:
			if type(output[2]) == float:
				out2 = format(float(output[2]),'.2f')
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], '$' + str(out2)), tags = ('even',))
			else:
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], str(output[2])), tags = ('even',))
		else:
			if type(output[2]) == float:
				out2 = format(float(output[2]),'.2f')
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], '$' + str(out2)), tags = ('odd',))
			else:
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], str(output[2])), tags = ('odd',))
		count += 1

	
	# button
	search_btn = Button(vsPopup, text = 'Search', command = vSearchInput)
	search_btn.pack(pady = 20, padx = 30, ipadx = 100)


def vSearchInput():
	global vSearch
	global ventryVIN
	global ventryDesc
	vSearch = Toplevel(root)
	vSearch.title("Search Vehicle Database")
	vSearch.geometry("400x275")

	# create label frame
	vframeVIN = LabelFrame(vSearch, text = "VIN")
	vframeVIN.pack(padx = 10, pady = 10)
	# text box
	ventryVIN = Entry(vframeVIN)
	ventryVIN.pack(pady = 20, padx = 20)

	# create label frame
	vframeDesc = LabelFrame(vSearch, text = "Description")
	vframeDesc.pack(padx = 10, pady = 10)
	# text box
	ventryDesc = Entry(vframeDesc)
	ventryDesc.pack(pady = 20, padx = 20)

	# button
	sbtn = Button(vSearch, text = 'Search Database', command = vehicleSearch)
	sbtn.pack(pady = 20, padx = 20)


def vehicleSearch():

	if ventryVIN.get() and ventryDesc.get():
		record1 = ventryVIN.get()
		record2 = ventryDesc.get()
		vSearch.destroy() # closes search box

		# clear treeview
		for r in vtree.get_children():
			vtree.delete(r)

		vconn = sqlite3.connect('car_rental.db')
		vcur = vconn.cursor()

		vcur.execute("""SELECT VehicleID as VIN, Description,
							CASE 
								WHEN OrderAmount IS NULL THEN 'Non-Applicable'
								ELSE OrderAmount/TotalDays
							END AS DailyRate
						FROM VEHICLE as V
						LEFT JOIN VRENTALINFO as VI
						ON V.VehicleID = VI.VIN
						WHERE V.VehicleID = ?
						AND Description like ?
						GROUP BY VehicleID; """, (record1, '%' + record2 + '%',))
		
		output_records = vcur.fetchall()

	elif ventryVIN.get():
		record = ventryVIN.get()
		vSearch.destroy() # closes search box

		# clear treeview
		for r in vtree.get_children():
			vtree.delete(r)

		vconn = sqlite3.connect('car_rental.db')
		vcur = vconn.cursor()

		vcur.execute("""SELECT VehicleID as VIN, Description,
							CASE 
								WHEN OrderAmount IS NULL THEN 'Non-Applicable'
								ELSE OrderAmount/TotalDays
							END AS DailyRate
						FROM VEHICLE as V
						LEFT JOIN VRENTALINFO as VI
						ON V.VehicleID = VI.VIN
						WHERE V.VehicleID = ?
						GROUP BY VehicleID;""", (record,))
		
		output_records = vcur.fetchall()
	
	elif ventryDesc.get():
		record = ventryDesc.get()
		vSearch.destroy() # closes search box

		# clear treeview
		for r in vtree.get_children():
			vtree.delete(r)

		vconn = sqlite3.connect('car_rental.db')
		vcur = vconn.cursor()

		vcur.execute("""SELECT VehicleID as VIN, Description,
							CASE 
								WHEN OrderAmount IS NULL THEN 'Non-Applicable'
								ELSE OrderAmount/TotalDays
							END AS DailyRate
						FROM VEHICLE as V
						LEFT JOIN VRENTALINFO as VI
						ON V.VehicleID = VI.VIN
						WHERE Description like ?
						GROUP BY VehicleID """, ('%' + record + '%',))
		
		output_records = vcur.fetchall()

	elif not ventryVIN.get() and not ventryDesc.get():

		vSearch.destroy() # closes search box

		# clear treeview
		for r in vtree.get_children():
			vtree.delete(r)

		vconn = sqlite3.connect('car_rental.db')
		vcur = vconn.cursor()

		vcur.execute("""SELECT VehicleID as VIN, Description,
							CASE 
								WHEN OrderAmount IS NULL THEN 'Non-Applicable'
								ELSE OrderAmount/TotalDays
							END AS DailyRate
						FROM VEHICLE as V
						LEFT JOIN VRENTALINFO as VI
						ON V.VehicleID = VI.VIN
						GROUP BY VehicleID
						ORDER BY 
								CASE
									WHEN DailyRate like '[a-z]%' THEN 1
									ELSE 0
								END, DailyRate ASC;""",)
		
		output_records = vcur.fetchall()
		

	count = 0
	for output in output_records:
		if count % 2 == 0:
			if type(output[2]) == float:
				out2 = format(float(output[2]),'.2f')
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], '$' + str(out2)), tags = ('even',))
			else:
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], str(output[2])), tags = ('even',))
		else:
			if type(output[2]) == float:
				out2 = format(float(output[2]),'.2f')
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], '$' + str(out2)), tags = ('odd',))
			else:
				vtree.insert(parent = '', index = 'end', iid = count, text = "", values = (output[0], output[1], str(output[2])), tags = ('odd',))
		count += 1

	vconn.commit()
	vconn.close()

# ----------------------------------------- END OF FUNCTIONS -----------------------------------------

# ------------------------------------------- ROOT BUTTONS -------------------------------------------

custButton = Button(root, text = "Add Customer", command = addCustomer)
custButton.pack(pady = 10)

vehicleButton = Button(root, text = "Add Vehicle", command = addVehicle)
vehicleButton.pack(pady = 10)

rentalButton = Button(root, text = "Add/Search Car Rental Reservation", command = addRental)
rentalButton.pack(pady = 10)

returnButton = Button(root, text = "Return Car Rental", command = returnCar)
returnButton.pack(pady = 10)

returnButton = Button(root, text = "Customer Search", command = custData)
returnButton.pack(pady = 10)

returnButton = Button(root, text = "Vehicle Search", command = vData)
returnButton.pack(pady = 10)




# opens window
root.mainloop()
