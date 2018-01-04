package Dao.entities;

/**
 * @generated
 */
public final class User extends IdOwnerComparable {

    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String avatarPath;
    private String conferma;
    private String privileges;

    public User() {
    }

    public User(String firstName, String lastName, String email, String password, String conferma , String pirvileges) {
        setFirstName(firstName);
        setLastName(lastName);
        setEmail(email);
        setPassword(password);
        setConfirm(conferma);
        setPrivileges(privileges);
    }

    public User(String firstName, String lastName, String email, String password, String Conferma,String privileges ,String avatarPath) {
        setFirstName(firstName);
        setLastName(lastName);
        setEmail(email);
        setPassword(password);
        setConfirm(Conferma);
        setPrivileges(privileges);
        setAvatarPath(avatarPath);
    }

    /**
     * @return the conferma
     */
    public String getConfirm() {
        return conferma;
    }

    /**
     * @param conferma the conferma to set
     */
    public void setConfirm(String conferma) {
        this.conferma = conferma;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatarPath() {
        return avatarPath;
    }

    public void setAvatarPath(String avatarPath) {
        this.avatarPath = avatarPath;
    }

    public void setPassword(String passwd) {
        this.password = passwd;
    }

    public String getPassword() {
        return password;
    }

    public String getPrivileges() {
        return privileges;
    }

    public void setPrivileges(String privileges) {
        this.privileges = privileges;
    }
    
}
