import os

def main():
    working_directory = os.path.expanduser("/root")
    file_path = os.path.join(working_directory, "input.txt")

    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as file:
            content = file.read()
            print(content)
    else:
        print("Ошибка: файл input.txt не найден в директории /root.")

if __name__ == "__main__":
    main()
