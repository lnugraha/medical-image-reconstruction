# Display a single CT slice in DICOM patient coordinate
import matplotlib.pyplot as plt
import matplotlib.colors as colors
import numpy as np
import os, glob, sys, pydicom
CT_dir = '../raw_data/pinnacle3-8.2g-phantom-chest/CT'

class CTGROUP:
    def __init__(self, ct_data_dir):
        ct_data = pydicom.dcmread(ct_data_dir)
        self.x_pos = ct_data.ImagePositionPatient[0]
        self.y_pos = ct_data.ImagePositionPatient[1]
        self.z_pos = ct_data.ImagePositionPatient[2]
        self.rows  = ct_data.Rows
        self.cols  = ct_data.Columns
        self.row_spc = ct_data.PixelSpacing[0]
        self.col_spc = ct_data.PixelSpacing[1]
        self.sop_uid = ct_data.SOPInstanceUID
        self.pixel = ct_data.pixel_array

    def configuration(self):
        x_min = self.x_pos - 0.5*self.col_spc
        y_min = self.y_pos - 0.5*self.row_spc
        x_max = x_min + self.cols*self.col_spc
        y_max = y_min + self.rows*self.row_spc
        return x_min, y_min, x_max, y_max

### CT Slices Pairing between the z_pos and class
CT_Bundles = {}
count = 0
for filename in glob.iglob(CT_dir + '**/*.dcm', recursive=True):
    testing = CTGROUP(filename)
    count += 1
    CT_Bundles[testing.z_pos] = testing # Pair z_pos and CTGROUP class

testing.configuration() # Obtain the window display of CT slices
Sorted_CT_Bundles = sorted(CT_Bundles.items(), key=lambda s: s[0])
print("Total CT Slices: {} slices".format(count))

CT_x_min = testing.configuration()[0]
CT_y_min = testing.configuration()[1]
CT_x_max = testing.configuration()[2]
CT_y_max = testing.configuration()[3]

for x in range(count):
    plt.clf()
    CT_x_min = testing.configuration()[0]
    CT_y_min = testing.configuration()[1]
    CT_x_max = testing.configuration()[2]
    CT_y_max = testing.configuration()[3]
    plt.imshow(Sorted_CT_Bundles[x][1].pixel, extent=[CT_x_min, CT_x_max, CT_y_max, CT_y_min], cmap=plt.cm.bone)
    plt.xlabel("[mm]")
    plt.ylabel("[mm]")
    figure_name = "Contour Mask "+str(x+1)+" at z="+str(Sorted_CT_Bundles[x][0])+" mm"
    plt.title(figure_name)
    print("Saving Figure " + str(x+1) + "...")
    plt.savefig( figure_name + '.png')
