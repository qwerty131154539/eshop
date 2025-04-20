package com.example.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.pojo.entity.User;
import com.example.service.UserService;
import com.example.constant.ConstantName;

public class RegisterAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    private User user;

    @Autowired
    private UserService userService;

    /**
     * 使用模型驅動來封裝 User 物件
     * @return 返回 User 物件
     */
    @Override
    public User getModel() {
        if (user == null) {
            user = new User();
        }
        return user;
    }

    /**
     * 跳轉至註冊頁面
     * @return 返回註冊頁面
     */
    public String register() {
        return SUCCESS;
    }
    
    /**
     * 處理註冊邏輯
     * @return 註冊成功返回 SUCCESS，失敗返回 INPUT
     */
    public String save() {
        // 註冊前的資料檢查
        if (!doCheck(user)) {
            return INPUT;
        }
        try {
            // 設置註冊時間
            setUserCreateDate(user);

            // 呼叫 UserService 來保存使用者資料
            userService.addUser(user);

            // 註冊成功，將訊息設置到 session
            getSession().setAttribute(ConstantName.SESSION_USER_MSG, "註冊成功，請登入");
        } catch (Exception e) {
            // 註冊失敗，將錯誤訊息設置到 session
            getSession().setAttribute(ConstantName.SESSION_USER_MSG, "註冊失敗，請重試");
            return INPUT;
        }
        return SUCCESS;
    }

    /**
     * 註冊前資料檢查，這裡可以擴展更多檢查邏輯
     * @param user 註冊的使用者資料
     * @return 若檢查通過返回 true，否則返回 false
     */
    private boolean doCheck(User user) {
        if (user == null || user.getLoginId() == null || user.getLoginId().trim().isEmpty()) {
            getSession().setAttribute(ConstantName.SESSION_USER_MSG, "帳號不能為空");
            return false;
        }

        if (userService.isLoginIdExists(user.getLoginId())) {
            getSession().setAttribute(ConstantName.SESSION_USER_MSG, "帳號已被註冊");
            return false;
        }

        if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
            getSession().setAttribute(ConstantName.SESSION_USER_MSG, "密碼不能為空");
            return false;
        }

        // 其他檢查條件可繼續擴充，例如帳號長度、密碼強度、手機格式等

        return true;
    }


    /**
     * 設置使用者的創建日期
     * @param user 使用者資料
     */
    private void setUserCreateDate(User user) {
        user.setCreateDate(new Date());
    }

    // Getter and Setter
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
