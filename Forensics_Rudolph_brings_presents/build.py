from pathlib import Path
import random
import shutil
import yaml

class challenge:
    #Create images and containers
    def run_docker_compose():
        print("Running docker compose up...")
        print("Containers are up and running...")


    def append_to_docker_compose(user_id,user_flag):
        print("Creating docker file..."+str(user_id))

        #Get base docker compose elements
        src = r"./challenge_files/dc_base.yml"
        dest = r"./challenge_files/dc_base_tmp.yml"
        shutil.copyfile(src,dest,follow_symlinks=True)

        #create temp file and update the elements with right user id and flag
        file = Path(dest)
        data = file.read_text().replace('{id}','0'+str(user_id)).replace('{flag}',str(user_flag)+'}')  
        file.write_text(data)

        #append temp to docker compose
        dc = open("./challenge_files/docker-compose.yml", 'a+')
        dc_temp = open(dest, 'r')
        dc.write(dc_temp.read())

        #close files
        dc.close()
        dc_temp.close()
        challenge.run_docker_compose()

    # Replicate the user files and update the flags
    def create_user_files(user_id,user_flag):
        print("Creating user files...")
        directory_path = "./challenge_files/user0" + str(user_id)
        source_dir = r"./challenge_files/user"
        destination_dir = directory_path
        shutil.copytree(source_dir, destination_dir,dirs_exist_ok=True)
        challenge.append_to_docker_compose(user_id,user_flag)

    #Create list of flags depending on the number of users and save it to a file
    def create_flags(users:int,flag:str): 
        print("Creating user flags...")
        uf = open("./challenge_files/user_flags.txt", "w+")
        for n in range(1,users+1):
            random_number = random.randint(10000, 100000)
            user_flag = flag + str(random_number)
            uf.write(user_flag + '}'  + "\n")
            challenge.create_user_files(n,user_flag)
            print("--------------------------------------------------------------") 

        #close files
        uf.close()

if __name__ == "__main__":
    number_of_users = int(input("Enter the total number of users : "))
    base_flag = input("Enter the Flag format and base key : ")
    challenge.create_flags(users=number_of_users,flag=base_flag)
