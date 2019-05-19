package testtask.service;

import testtask.model.Part;

import java.util.List;

public interface PartService {
    List<Part> getPartList(int page);
    int partsCount();
    void allParts();
    void allNeedParts();
    void allOptionParts();
    void add(Part part);
    void delete(Part part);
    void edit(Part part);
    Part getById(int id);
    int getCount();
    void search(String name);
}
