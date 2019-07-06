package com.inventory.bean;

public class User {

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getPer_unit_price() {
        return per_unit_price;
    }

    public void setPer_unit_price(String per_unit_price) {
        this.per_unit_price = per_unit_price;
    }

    public String getProduct_exp_date() {
        return product_exp_date;
    }

    public void setProduct_exp_date(String product_exp_date) {
        this.product_exp_date = product_exp_date;
    }

    public String getPurchase_date() {
        return purchase_date;
    }

    public void setPurchase_date(String purchase_date) {
        this.purchase_date = purchase_date;
    }
    //extra

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_category() {
        return p_category;
    }

    public void setP_category(String p_category) {
        this.p_category = p_category;
    }

    public String getP_company() {
        return p_company;
    }

    public void setP_company(String p_company) {
        this.p_company = p_company;
    }

    public String getP_quantity() {
        return p_quantity;
    }

    public void setP_quantity(String p_quantity) {
        this.p_quantity = p_quantity;
    }

    public String getP_unit() {
        return p_unit;
    }

    public void setP_unit(String p_unit) {
        this.p_unit = p_unit;
    }

    public String getP_price() {
        return p_price;
    }

    public void setP_price(String p_price) {
        this.p_price = p_price;
    }
    
    

    //All works of Dealership
    private String dealer_name, branch, dealer_id, contact, address, agent_name, agent_contact, date;

    private int id;
    private String category, code,p_id,p_name,p_category,p_company,p_quantity,p_unit,p_price,
            product_name, company_name, quantity, unit, per_unit_price, product_exp_date, purchase_date;

   

    public String getDealer_name() {
        return dealer_name;
    }

    public void setDealer_name(String dealer_name) {
        this.dealer_name = dealer_name;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getDealer_id() {
        return dealer_id;
    }

    public void setDealer_id(String dealer_id) {
        this.dealer_id = dealer_id;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {

        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAgent_name() {
        return agent_name;
    }

    public void setAgent_name(String agent_name) {
        this.agent_name = agent_name;
    }

    public String getAgent_contact() {
        return agent_contact;
    }

    public void setAgent_contact(String agent_contact) {
        this.agent_contact = agent_contact;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

/////////////////////////for Membership//////////////////////////////////////////
    
    private String member_id, name, password, gender, email, mobile_no, per_address,payment;

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }

   

    public String getPer_address() {
        return per_address;
    }

    public void setPer_address(String per_address) {
        this.per_address = per_address;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

/////////////For Staff////////////
 private String staff_id,joining_date;

public String getStaff_id() {
	return staff_id;
}
public void setStaff_id(String staff_id) {
	this.staff_id = staff_id;
}

    public String getJoining_date() {
        return joining_date;
    }

    public void setJoining_date(String joining_date) {
        this.joining_date = joining_date;
    }

    

/////For Sale/////////

private String p_u_price,total_price;
public String getP_U_Price() {
	return p_u_price;
}
public void setP_U_Price(String p_u_price) {
	this.p_u_price = p_u_price;
}
public String getT_Price() {
	return total_price;
}
public void setT_Price(String total_price) {
	this.total_price = total_price;
}


}
