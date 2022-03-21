// NO CODE YET, JUST SETTING UP THE BASE OF THE PROJECT BEFORE DOING ANYTHING ELSE
// CODE WILL COME LATER, JUST NOT RIGHT NOW SINCE QUEST IS GETTING WORKED ON SINCE I 
// ACCIDENTALLY BROKE IT. 
#include "libusb.h"
#include <iostream>

void printdev(libusb_device *dev)
{
    libusb_device_descriptor desc;
    int r = libusb_get_device_descriptor(dev, &desc);
    if (r < 0)
    {
        printf("Failed to get device descriptor\n");
        return;
    }
    printf("Number of possible configuration: %d\n", desc.bNumConfigurations);
    printf("Device Class: %d\n", desc.bDeviceClass);
    printf("Vendor ID: %d\n", desc.idVendor);
    printf("Product ID: %d\n", desc.idProduct);
    libusb_config_descriptor *config;
    libusb_get_config_descriptor(dev, 0, &config);
    std::cout << "Number of interfaces: " << config->bNumInterfaces << "\n";
    const libusb_interface *inter;
    const libusb_interface_descriptor *interdesc;
    const libusb_endpoint_descriptor *epdesc;
    for (int i = 0; i < (int)config->bNumInterfaces; i++)
    {
        inter = &config->interface[i];
        std::cout<<"Number of alternate settings: %d\n", inter->num_altsetting;
        for(int j = 0; j < (int)inter->num_altsetting; j++)
        {
            interdesc = &inter->altsetting[j];
            printf("Interface Number: %d\n", interdesc->bInterfaceNumber);
            printf("Number of endpoints: %d\n", interdesc->bNumEndpoints);
            for(int k = 0; k < (int)interdesc->bNumEndpoints; k++)
            {
                epdesc = &interdesc->endpoint[k];
                printf("Endpoint Address: %d\n", epdesc->bEndpointAddress);
                printf("Endpoint Type: %d\n", epdesc->bmAttributes);
            }
        }
    }
    libusb_free_config_descriptor(config);
}
