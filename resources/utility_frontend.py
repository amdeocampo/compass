import logging

def get_dropdown_xpath(dropdown_name):
    dropdown = dropdown_name
    global icon_class_name
    if dropdown == 'Date Range':
        icon_class_name = 'fa fa-calendar'
    elif dropdown == 'Linked Pages':
        icon_class_name = 'fa fa-user'
    else:
        logging.error("Inputted dropdown name '" + dropdown + "' does not exist!")

    xpath = "*//div[@id='dashboard-page']//ul[@class='nav navbar-nav']/li[@class='dropdown']/" \
            "a[i/@class = '" + icon_class_name + "']"
    return xpath
