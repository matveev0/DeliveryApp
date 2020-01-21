using DbProject;
using DeliveryModels;
using System.Collections.Generic;

namespace BLService
{
    public interface IService
    {
        void Add(product curProduct);
        bool Delete(int ID);
        void Update(product curProduct);
        ItemModel Get(int ID);
        PagedResult<ItemModel> GetMany(int page, int pageLen);
        List<ItemModel> GetByType(int typeID);
    }
}
