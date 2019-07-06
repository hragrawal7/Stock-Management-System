package com.inventory.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.inventory.bean.User;

public class UserDao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }

//All works of purchase
    public static int saveproduct(User u) {
        int status = 0;
        try {
            Connection con;
            con = getConnection();
            PreparedStatement ps1 = con.prepareStatement("insert into product(p_id,p_name,p_category,p_company,p_quantity,p_unit,p_price) values(?,?,?,?,?,?,?)");
            ps1.setString(1, u.getP_id());
            ps1.setString(2, u.getP_name());
            ps1.setString(3, u.getP_category());
            ps1.setString(4, u.getP_company());
            ps1.setString(5, u.getP_quantity());
            ps1.setString(6, u.getP_unit());
            ps1.setString(7, u.getPer_unit_price());
            status = ps1.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int savepurchase(User u) {
        int status = 0;
        try {
            Connection con;
            con = getConnection();
            PreparedStatement ps1 = con.prepareStatement("insert into purchase(dealer_id,p_id,quantity,per_unit_price,purchase_date) values(?,?,?,?,?)");
            ps1.setString(1, u.getDealer_id());
            ps1.setString(2, u.getP_id());
            ps1.setString(3, u.getP_quantity());
            ps1.setString(4, u.getPer_unit_price());
            ps1.setString(5, u.getPurchase_date());
            status = ps1.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updatepurchase(User u) {
        int status = 0;

        try {
            Connection con = getConnection();

            PreparedStatement ps1 = con.prepareStatement("update product set p_id=?,p_name=?,p_category=?,p_company=?,p_quantity=?,p_unit=?,p_price=? where id=?");
            ps1.setString(1, u.getP_id());
            ps1.setString(2, u.getP_name());
            ps1.setString(3, u.getP_category());

            ps1.setString(4, u.getP_company());
            ps1.setString(5, u.getP_quantity());
            ps1.setString(6, u.getP_unit());
            ps1.setString(7, u.getP_price());
            //ps1.setString(8, u.getProduct_exp_date());
            //ps1.setString(9, u.getPurchase_date());
            ps1.setInt(8, u.getId());
            status = ps1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deletepurchase(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps1 = con.prepareStatement("delete from product where id=?");
            ps1.setInt(1, u.getId());
            status = ps1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static User getRecordByPurchaseId(int id) {
        User u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps1 = con.prepareStatement("select * from product where id=?");
            ps1.setInt(1, id);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setP_id(rs.getString("p_id"));
                u.setP_name(rs.getString("p_name"));
                u.setP_category(rs.getString("p_category"));
                // u.setDealer_name(rs.getString("dealer_name"));
                // u.setCode(rs.getString("code"));
                u.setP_company(rs.getString("p_company"));

                u.setP_quantity(rs.getString("p_quantity"));
                u.setP_unit(rs.getString("p_unit"));
                u.setP_price(rs.getString("p_price"));
//                u.setProduct_exp_date(rs.getString("product_exp_date"));
//                u.setPurchase_date(rs.getString("purchase_date"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

//All works of Dealer
    public static int savedealer(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into dealership(dealer_name,dealer_id,contact,address,date) values(?,?,?,?,?)");
            ps.setString(1, u.getDealer_name());

            ps.setString(2, u.getDealer_id());
            ps.setString(3, u.getContact());
            ps.setString(4, u.getAddress());

            ps.setString(5, u.getDate());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updatedealer(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update dealership set dealer_name=?,dealer_id=?,contact=?,address=?,date=? where id=?");
            ps.setString(1, u.getDealer_name());

            ps.setString(2, u.getDealer_id());
            ps.setString(3, u.getContact());
            ps.setString(4, u.getAddress());

            ps.setString(5, u.getDate());
            ps.setInt(6, u.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deletedealer(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from dealership where id=?");
            ps.setInt(1, u.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status;
    }

    public static User getRecordByDealerId(int id) {
        User u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from dealership where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setDealer_name(rs.getString("dealer_name"));

                u.setDealer_id(rs.getString("dealer_id"));
                u.setContact(rs.getString("contact"));
                u.setAddress(rs.getString("address"));

                u.setDate(rs.getString("date"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }
//All works of MemberShip

    public static int saveMember(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into membership(member_id,name,gender,email,mobile_no,per_address,payment,category,date) values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, u.getMember_id());
            ps.setString(2, u.getName());
            ps.setString(3, u.getGender());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getMobile_no());

            ps.setString(6, u.getPer_address());
            ps.setString(7, u.getPayment());
            ps.setString(8, u.getCategory());
            ps.setString(9, u.getDate());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updateMember(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update membership set member_id=?,name=?,gender=?,email=?,mobile_no=?,per_address=?,payment=?,category=?,date=? where id=?");
            ps.setString(1, u.getMember_id());
            ps.setString(2, u.getName());
            ps.setString(3, u.getGender());
           
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getMobile_no());

            ps.setString(6, u.getPer_address());
            ps.setString(7, u.getPayment());
            ps.setString(8, u.getCategory());
            ps.setString(9, u.getDate());
            ps.setInt(10, u.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deleteMember(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from membership where id=?");
            ps.setInt(1, u.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status;
    }

    public static User getRecordMemberById(int id) {
        User u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from membership where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setMember_id(rs.getString("member_id"));
                u.setName(rs.getString("name"));
                u.setGender(rs.getString("gender"));
                
                u.setEmail(rs.getString("email"));
                u.setMobile_no(rs.getString("mobile_no"));

                u.setPer_address(rs.getString("per_address"));
                u.setPayment(rs.getString("payment"));
                u.setCategory(rs.getString("category"));
                u.setDate(rs.getString("date"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

/////////////////////For Staff//////
    public static int saveStaff(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into staff(staff_id,password,name,gender,mobile_no,per_address,category,joining_date) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, u.getStaff_id());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getName());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getMobile_no());

            ps.setString(6, u.getPer_address());
            ps.setString(7, u.getCategory());
            ps.setString(8, u.getJoining_date());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updateStaff(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("update staff set staff_id=?,password=?,name=?,gender=?,mobile_no=?,per_address=?,category=?,joining_date=? where id=?");
            ps.setString(1, u.getStaff_id());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getName());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getMobile_no());
            ps.setString(6, u.getPer_address());
            ps.setString(7, u.getCategory());
            ps.setString(8, u.getJoining_date());
            ps.setInt(9, u.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deleteStaff(User u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from staff where id=?");
            ps.setInt(1, u.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status;
    }

    public static User getStaffRecordMemberById(int id) {
        User u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from staff where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setStaff_id(rs.getString("staff_id"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setGender(rs.getString("gender"));
                u.setMobile_no(rs.getString("mobile_no"));
                u.setPer_address(rs.getString("per_address"));
                u.setCategory(rs.getString("category"));
                u.setJoining_date(rs.getString("joining_date"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

/////////////for sales//////////////

    public static List<User> getAllSaleRecords() {
        List<User> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from sale");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setCode(rs.getString("code"));
                u.setCategory(rs.getString("category"));
                u.setProduct_name(rs.getString("product_name"));
                u.setQuantity(rs.getString("quantity"));
                u.setUnit(rs.getString("unit"));
                u.setPer_unit_price(rs.getString("per_unit_price"));
                u.setT_Price(rs.getString("total_price"));
                u.setDate(rs.getString("date"));

                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
///////for Fetching Supplier Name//////
    public static List<User> getAllRecords() {
        List<User> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from dealership");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setDealer_id(rs.getString("dealer_id"));
                u.setDealer_name(rs.getString("dealer_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
