from selenium.webdriver.common.action_chains import ActionChains
import time

bool = True
while(bool):
    actions = ActionChains(driver)
    actions.send_keys(":snowman:")
    actions.perform()
    time.sleep(3)
