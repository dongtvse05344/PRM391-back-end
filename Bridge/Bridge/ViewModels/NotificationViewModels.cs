using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Bridge.ViewModels
{
    public class NotificationCM
    {
        public String to { get; set; }
        public String collapse_key { get; set; }
        public NotificationData notification { get; set; }
        public NotificationBodyData data { get; set; }
    }

    public class NotificationData
    {
        public String body { get; set; }
        public String title { get; set; }
    }

    public class NotificationBodyData
    {
        public NotificationBodyData()
        {
            click_action = "FLUTTER_NOTIFICATION_CLICK";
        }

        public String message { get; set; }
        public String click_action { get; set; }
    }
}
