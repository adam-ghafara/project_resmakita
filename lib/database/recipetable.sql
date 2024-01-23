CREATE TABLE recipetable (
    id_masaakan INTEGER(15) PRIMARY KEY AUTO_INCREMENT,
    recipe_user_id INTEGER(15) NOT NULL,
    nama_masakan TEXT NOT NULL,
    deskripsi_masakan TEXT NOT NULL,
    bahan_masakan TEXT NOT NULL,
    cara_masakan TEXT NOT NULL,
    FOREIGN KEY (recipe_user_id) REFERENCES users(user_id)
);