<?php


class Users {

    private static function GetIdProf($id, $base, $sql) {
        $stmt = $base->prepare($sql);
        $stmt->execute( array( $id) );
        $id_prof = $stmt->fetch()['id'];
        self::AddUserId($id_prof, $id ,$base);
    }

    private static function AddUserId($id_prof, $id, $base) {
        $stmt = $base->prepare("UPDATE `users` SET `profile_id`= ? WHERE `id` = ?");
        $stmt->execute( array( $id_prof, $id) );
    }

    public static function ProfileStud($data, $user_id, $base) {
        $first_name = $data['first_name'];
        $last_name = $data['last_name'];
        $age = $data['age'];
        $country = $data['country'];
        $study = $data['study'];
        $faculty = $data['faculty'];
        $year_enter = $data['year_enter'];
        $spec = $data['spec'];
        $about = $data['about'];
        $status = 0;
        $avatar = $data['avatar'];
        $raiting = 5;
        $comp = json_decode($data['comp'], true);

        if(self::IsProfSt($user_id, $base)) {
            $stmt = $base->prepare("INSERT INTO `students`( `first_name`, `last_name`, `age`, `country`, `study`, `faculty`, `year_enter`, `spec`, `about`, `raiting`, `status`, `avatar`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute( array(  $first_name ,  $last_name, $age , $country,  $study, $faculty, $year_enter, $spec, $about,  $raiting, $status, $avatar, $user_id) );

            if($stmt) {
               foreach($comp as $prop) {
                    self::AddCompInteUser($user_id, $prop, $base);
               }
               self::GetIdProf($user_id, $base, "SELECT * FROM `students` WHERE `user_id` = ?");
                echo json_encode( array(
                    "status" => "true"
                ));
            }
        } 
            exit();
    }

    private static function IsProfSt($user_id, $base) {
        $stmt = $base->prepare("SELECT * FROM `students` WHERE `user_id` = ?");
        $stmt->execute( array( $user_id ) );
        if(!$stmt->fetch()) {
            return true;
        }
            return false;
    }

    private static function IsProfEm($user_id, $base) {
        
        $stmt = $base->prepare("SELECT * FROM `employer` WHERE `user_id` = ?");
        $stmt->execute( array( $user_id ) );
        if(!$stmt->fetch()) {
            return true;
        }
            return false;
    }

    private static function IsProfEd($user_id, $base) {
        $stmt = $base->prepare("SELECT * FROM `educational` WHERE `user_id` = ?");
        $stmt->execute( array( $user_id ) );
        if(!$stmt->fetch()) {
            return true;
        }
            return false;
    }

    public static function ProfilEmpl($data, $user_id, $base) {
        $name = $data['name'];
        $about = $data['about'];
        $phone = $data['phone'];
        $email = $data['email'];
        $name_dir = $data['name_dir'];
        $status = 0;
        $avatar = $data['avatar'];
        $raiting = 5;

        if(self::IsProfEm($user_id, $base)) {
            $stmt = $base->prepare("INSERT INTO `employer`( `name`, `raiting`, `about`, `phone`, `email`, `name_dir`, `status`, `avatar`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute( array( $name, $raiting, $about, $phone, $email,  $name_dir, $status, $avatar, $user_id) );
            self::GetIdProf($user_id, $base, "SELECT * FROM `employer` WHERE `user_id` = ?");

            if($stmt) {
                echo json_encode( array(
                    "status" => "true"
                ));
            }
        } 
            exit();
    }

    public static function ProfileEdu($data, $user_id, $base) {
        $name = $data['name'];
        $about = $data['about'];
        $phone = $data['phone'];
        $email = $data['email'];
        $name_dir = $data['name_dir'];
        $status = 0;
        $avatar = $data['avatar'];
        $raiting = 5;

        if(self::IsProfEd($user_id, $base)) {
            $stmt = $base->prepare("INSERT INTO `educational`( `name`, `raiting`, `about`, `user_id`, `avatar`) VALUES (?, ?, ?, ?, ?)");
            $stmt->execute( array( $name, $raiting, $about, $user_id, $avatar) );

            if($stmt) {
                self::GetIdProf($user_id, $base, "SELECT * FROM `educational` WHERE `user_id` = ?");

                echo json_encode( array(
                    "status" => "true"
                ));
            }
        } 
            exit();
    }

    private static function AddCompInteUser($id, $comp_id, $base) {
        $stmt = $base->prepare("INSERT INTO `students_comp` (`stud_id`, `comp_id`) VALUES (?, ?)");
        $stmt->execute( array( $id, $comp_id ) );
    }
    

}

