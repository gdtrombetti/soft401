package UserData;

public class User {
private String full_name;
private String email;
private String date;
private String id;
private String type;
private String affiliation;
private String favorite_topic;
private boolean isValid;
/**
 * @return the full_name
 */
public String getFull_name() {
	return full_name;
}
/**
 * @param full_name the full_name to set
 */
public void setFull_name(String full_name) {
	this.full_name = full_name;
}
/**
 * @return the email
 */
public String getEmail() {
	return email;
}
/**
 * @param email the email to set
 */
public void setEmail(String email) {
	this.email = email;
}
/**
 * @return the date
 */
public String getDate() {
	return date;
}
/**
 * @param date the date to set
 */
public void setDate(String date) {
	this.date = date;
}


/**
 * @return the affiliation
 */
public String getAffiliation() {
	return affiliation;
}
/**
 * @param affiliation the affiliation to set
 */
public void setAffiliation(String affiliation) {
	this.affiliation = affiliation;
}
/**
 * @return the favorite_topic
 */
public String getFavorite_topic() {
	return favorite_topic;
}
/**
 * @param favorite_topic the favorite_topic to set
 */
public void setFavorite_topic(String favorite_topic) {
	this.favorite_topic = favorite_topic;
}
/**
 * @return the id
 */
public String getId() {
	return id;
}
/**
 * @param string the id to set
 */
public void setId(String string) {
	this.id = string;
}
/**
 * @return the isValid
 */
public boolean isValid() {
	return isValid;
}
/**
 * @param isValid the isValid to set
 */
public void setIsValid(boolean isValid) {
	this.isValid = isValid;
}
/**
 * @return the type
 */
public String getType() {
	return type;
}
/**
 * @param type the type to set
 */
public void setType(String type) {
	this.type = type;
}
}
