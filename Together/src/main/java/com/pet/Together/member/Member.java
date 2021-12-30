package com.pet.Together.member;

public class Member {

	private String id, pwd, name, nickname, phone, address, email;
	private int type, kakaoid;
	
	public Member() {
		super();
	}
	public Member(String id, String pwd, String name, String nickname, String phone, String address, String email,
			int type, int kakaoid) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.type = type;
		this.kakaoid = kakaoid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getKakaoid() {
		return kakaoid;
	}
	public void setKakaoid(int kakaoid) {
		this.kakaoid = kakaoid;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", phone=" + phone
				+ ", address=" + address + ", email=" + email + ", type=" + type + ", kakaoid=" + kakaoid + "]";
	}
	
	
	
	
}
