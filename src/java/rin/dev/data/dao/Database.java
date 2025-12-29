package rin.dev.data.dao;

import rin.dev.data.impl.UserImpl;
import rin.dev.data.impl.CategoryImpl;
import rin.dev.data.impl.ProductImpl;
import rin.dev.data.impl.CartImpl;
import rin.dev.data.impl.CartItemImpl;
import rin.dev.data.impl.OrderImpl;
import rin.dev.data.impl.OrderItemImpl;
import rin.dev.data.impl.ContactImpl;
import rin.dev.data.impl.NewsletterImpl;
import rin.dev.data.impl.BlogImpl;
import rin.dev.data.impl.ServiceImpl;

public class Database extends DatabaseDao {

    // ===== DAO getters =====
    @Override
    public UserDao getUserDao() {
        return new UserImpl();
    }

    @Override
    public CategoryDao getCategoryDao() {
        return new CategoryImpl();
    }

    @Override
    public ProductDao getProductDao() {
        return new ProductImpl();
    }

    @Override
    public CartDao getCartDao() {
        return new CartImpl();
    }

    @Override
    public CartItemDao getCartItemDao() {
        return new CartItemImpl();
    }

    @Override
    public OrderDao getOrderDao() {
        return new OrderImpl();
    }

    @Override
    public OrderItemDao getOrderItemDao() {
        return new OrderItemImpl();
    }

    @Override
    public ContactDao getContactDao() {
        return new ContactImpl();
    }

    @Override
    public NewsletterDao getNewsletterDao() {
        return new NewsletterImpl();
    }

    @Override
    public BlogDao getBlogDao() {
        return new BlogImpl();
    }

    @Override
    public ServiceDao getServiceDao() {
        return new ServiceImpl();
    }
}
