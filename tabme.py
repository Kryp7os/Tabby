import base64

def base64_to_binary(base64_string):
    # Decode base64 string to binary
    binary_data = base64.b64decode(base64_string)
    binary_str = ''.join(format(byte, '08b') for byte in binary_data)
    return binary_str

def binary_to_tabs_spaces(binary_str):
    # Convert binary string to tabs and spaces
    tab_space_str = ''
    for bit in binary_str:
        if bit == '1':
            tab_space_str += '\t'
        else:
            tab_space_str += ' '
    return tab_space_str

def save_to_file(data, filename):
    with open(filename, 'w') as f:
        f.write(data)

def main():
    base64_string = input("Enter the base64 encoded string: ").strip()
    output_file = input("Enter the name of the file to save the tabs and spaces output: ").strip()
    
    try:
        binary_str = base64_to_binary(base64_string)
        tab_space_str = binary_to_tabs_spaces(binary_str)
        print("Binary:", binary_str)
        print("Tabs and Spaces:", tab_space_str)
        
        save_to_file(tab_space_str, output_file)
        print("Tabs and Spaces output saved to", output_file)
    except Exception as e:
        print("Error:", e)

if __name__ == "__main__":
    main()
