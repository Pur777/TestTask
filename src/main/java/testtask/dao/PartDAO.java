package testtask.dao;

import testtask.model.Part;

import java.util.List;

public interface PartDAO {
    List<Part> allParts();
    List<Part> allNeedParts();
    List<Part> allOptionParts();
    List search(String name);
    void add(Part part);
    void delete(Part part);
    void edit(Part part);
    Part getById(int id);
}
