package model;

public class User {
	protected int id;
	protected String name;
	protected String email;
	protected String address;
	protected String phone;
	protected String vehicle;
	protected String dob;
	protected String username;
	protected String password;
	
	//default constructor
	public User() {
	}
	
	//overloaded constructor with all fields
	public User(int id, String name, String email, String address, String phone, String vehicle, String dob,
			String username, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.vehicle = vehicle;
		this.dob = dob;
		this.username = username;
		this.password = password;
	}

	//overloaded constructor with all attributes execpt id
	public User(String name, String email, String address, String phone, String vehicle, String dob, String username,
			String password) {
		super();
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.vehicle = vehicle;
		this.dob = dob;
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getVehicle() {
		return vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
}