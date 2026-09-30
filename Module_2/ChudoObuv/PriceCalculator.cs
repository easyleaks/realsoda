using System;

namespace ChudoObuv
{
    public static class PriceCalculator
    {
        private const decimal DiscountPercent = 25m;

        public static decimal CalculatePrice(decimal price, bool wasOrderedLastMonth)
        {
            if (wasOrderedLastMonth)
            {
                return price;
            }

            return Math.Round(price - price * DiscountPercent / 100m, 2);
        }

        public static DateTime GetPreviousMonthStart(DateTime calculationDate)
        {
            DateTime currentMonthStart = new DateTime(calculationDate.Year, calculationDate.Month, 1);
            return currentMonthStart.AddMonths(-1);
        }
    }
}
