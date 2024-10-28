def find_products(product: str, price: float) -> dict:
    """
    Finds products at or below a specified price.

    Args:
    product (str): The product being searched for.

    price (float): Desired price.

    Returns:
    dict: A dictionary containing products at or below the specified price.
    """
    

    item_list = {"hammer1": 5.00,
                   "hammer2": 6.00,
                   "wrench1": 3.00,
                   "wrench2": 7.00}

    result = {}

    for item in item_list:
        if product in item:
            if item_list[item] <= price:
                found = {item: item_list[item]}
                result.update(found)
        

    return result

def find_deal(product: str) -> str:
    """
    Finds product at lowest price.

    Args:
    product (str): The product being searched for.

    Returns:
    str: Returns a string with the name of the product with the lowest price.
    """
    item_list = {"hammer1": 5.00,
           "hammer2": 6.00,
           "wrench1": 3.00,
           "wrench2": 7.00}

    temp = {}
    

    for item in item_list:
        if product in item:
            found = {item: item_list[item]}
            temp.update(found)

    lowest = min(temp.values())
    result = []
    for key, value in temp.items():
        if(value == lowest):
            result.append(key)

    return str(result)


def find_car(pickup_place, pickup_date, dropoff_date, dropoff_place, size):
    """
    Finds rental cars for travelling.

    Args:
    pickup_place (str): The location the car will be picked up.

    pickup_date (date): The date the car will be picked up. YYYY-MM-DD

    dropoff_date (date): The date the car will be drop off. YYYY-MM-DD

    dropoff_place (str): The location the car will be dropped off.

    size (enum): Size of the vehicle. Options are economy, compact, sedan, SUV, van, and truck

    Returns:
    str: Returns a string with the make and model of the vehicle.
    float: Returns a float of the price of the car per day.
    """
    pass

def find_hotel(location, checkin_date, checkout_date, travelers, rooms):
    """
    Finds hotel accomodations.

    Args:
    location (str): The location the hotel.

    checkin_date (date): The date checking into hotel. YYYY-MM-DD

    checkout_date (date): The date checking out of hotel. YYYY-MM-DD

    travelers (integer): The number of travelers staying at the hotel.

    rooms (integer): How many rooms are needed

    Returns:
    str: Returns a string with the name of the hotel.
    float: Returns a float of the price of the hotel per day.
    """
    pass

def find_restaurant(location, date, guests, dietary):
    """
    Finds restaurant accomodations.

    Args:
    location (str): The location the restaurant.

    date (date): The date for dining in. YYYY-MM-DD

    guests (integer): The number of guests eating at the restaurant.

    dietary (str): A description of dietary accommodations

    Returns:
    str: Returns a string with the name of the restaurant.
    float: Returns a star rating for the restaurant.
    """
    pass

def get_course_prerequisites(course_id, subject):
    science_courses = {
        "101": "None",
        "201": "101",
        "301": "201"
    }
    math_courses = {
        "101": "None",
        "201": "101",
        "301": "201"
    }

    get_course = str(course_id)
    if subject == "Science":
        if get_course in science_courses:
            return science_courses[get_course]
    elif subject == "Math":
        if get_course in math_courses:
            return math_courses[get_course]

def assign_student_to_course(student_id, course_id, section_id, subject):
    science_courses = [101, 201, 301]
    math_courses = [101, 201, 301]
    science_intro = ["Fall1", "Fall2", "Spring1", "Spring2"]
    science_mid = ["Fall1", "Fall2", "Spring1", "Spring2"]
    science_high = ["Fall1", "Fall2", "Spring1", "Spring2"]
    math_intro = ["Fall1", "Fall2", "Spring1", "Spring2"]
    math_mid = ["Fall1", "Fall2", "Spring1", "Spring2"]
    math_high = ["Fall1", "Fall2", "Spring1", "Spring2"]

    if subject == "Science":
        for course in science_courses:
            if course_id == course:
                if course_id == 101:
                    for section in science_intro:
                        if section_id == section:
                            return True
                elif course == 201:
                    for section in science_mid:
                        if section_id == section:
                            return True
                elif course == 301:
                    for section in science_high:
                        if section_id == section:
                            return True
                else:
                    return False
            else:
                return False
    elif subject == "Math":
        for course in math_courses:
            if course_id == course:
                if course_id == 101:
                    for section in math_intro:
                        if section_id == section:
                            return True
                elif course == 201:
                    for section in math_mid:
                        if section_id == section:
                            return True
                elif course == 301:
                    for section in math_high:
                        if section_id == section:
                            return True
                else:
                    return False
            else:
                return False
    else:
        return False

assign_student_to_course(1, 101, "Fall1", "Science")
                        
    
    