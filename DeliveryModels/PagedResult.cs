using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeliveryModels
{
    public class PagedResult<T>
    {
        public int PageCount
        {
            get; set;
        }
        public T[] Page;
    }
}
