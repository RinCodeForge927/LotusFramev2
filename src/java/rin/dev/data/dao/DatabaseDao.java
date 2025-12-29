package rin.dev.data.dao;

public abstract class DatabaseDao {

    private static DatabaseDao instance;

    public static void init(DatabaseDao inst) {
        instance = inst;
    }

    public static DatabaseDao getInstance() {
        return instance;
    }

    public abstract UserDao getUserDao();

    public abstract CategoryDao getCategoryDao();

    public abstract ProductDao getProductDao();

    public abstract CartDao getCartDao();

    public abstract CartItemDao getCartItemDao();

    public abstract OrderDao getOrderDao();

    public abstract OrderItemDao getOrderItemDao();

    public abstract ContactDao getContactDao();

    public abstract NewsletterDao getNewsletterDao();

    public abstract BlogDao getBlogDao();

    public abstract ServiceDao getServiceDao();

}
