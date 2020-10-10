GAPPS_VARIANT := pico

# This first option does not seem to work, only the latter has effect
#GAPPS_PRODUCT_PACKAGES += \
#    CalculatorGoogle \
#    CalendarGoogle

PRODUCT_PACKAGES += \
#    CalculatorGoogle \
    CalendarGoogle \
    Chrome
    
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
