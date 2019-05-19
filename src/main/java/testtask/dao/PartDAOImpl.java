package testtask.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import testtask.model.Part;

import java.util.List;

@Repository
public class PartDAOImpl implements PartDAO {
    private SessionFactory sessionFactory;
    private int page;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> allParts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Part").list();
    }

    @Override
    public List<Part> allNeedParts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Part P where P.need = true").list();
    }

    @Override
    public List<Part> allOptionParts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Part P where P.need = false").list();
    }

    @Override
    public List<Part> search(String name) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery(String.format("from Part P where P.name = '%s'", name)).list();
    }

    @Override
    public void add(Part part) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(part);
    }

    @Override
    public void delete(Part part) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(part);
    }

    @Override
    public void edit(Part part) {
        Session session = sessionFactory.getCurrentSession();
        session.update(part);
    }

    @Override
    public Part getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Part.class, id);
    }
}
