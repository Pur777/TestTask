package testtask.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import testtask.dao.PartDAO;
import testtask.model.Part;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class PartServiceImpl implements PartService {
    private PartDAO partDAO;
    private List<Part> partList = new ArrayList<>();

    @Override
    @Transactional
    public int partsCount() {
        return partList.size();
    }

    @Override
    @Transactional
    public List<Part> getPartList(int page) {
        int from = 10 * (page - 1);
        int to = from + 10;
        if (to > partList.size()) {
            to = partList.size();
        }
        return partList.subList(from, to);
    }

    @Autowired
    public void setPartDAO(PartDAO partDAO) {
        this.partDAO = partDAO;
    }

    @Override
    @Transactional
    public void allParts() {
        partList = partDAO.allParts();
    }

    @Override
    @Transactional
    public void allNeedParts() {
        partList =  partDAO.allNeedParts();
    }

    @Override
    @Transactional
    public void allOptionParts() {
        partList = partDAO.allOptionParts();
    }

    @Override
    @Transactional
    public void search(String name) {
        partList = partDAO.search(name);
    }

    @Override
    @Transactional
    public void add(Part part) {
        partDAO.add(part);
        partList.add(part);
    }

    @Override
    @Transactional
    public void delete(Part part) {
        partDAO.delete(part);
        for (int i = 0; i < partList.size(); i++) {
            if (partList.get(i).getId() == part.getId()) {
                partList.remove(i);
                i--;
            }
        }
    }

    @Override
    @Transactional
    public void edit(Part part) {
        partDAO.edit(part);
        for (int i = 0; i < partList.size(); i++) {
            if (partList.get(i).getId() == part.getId()) {
                partList.set(i, part);
            }
        }
    }

    @Override
    @Transactional
    public Part getById(int id) {
        return partDAO.getById(id);
    }

    @Override
    @Transactional
    public int getCount() {
        Part min = Collections.min(partDAO.allNeedParts(), Comparator.comparingInt(Part::getCount));
        return min.getCount();
    }
}
