namespace BLService
{
    public class DataFactory
    {
        public static ProductService GetProductService()
        {
            return new ProductService();
        }
    }
}
