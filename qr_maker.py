import qrcode

print('enter url')
url = input()

qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)

qr.add_data(url)
qr.make(fit=True)
img = qr.make_image(fill='black', back_color='white')

img.show()
url += '.png'
filename = 'flutter-application/assets/qrcodes/'
filename += url
img.save(filename)