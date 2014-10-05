#include <linux/jiffies.h>
#include <linux/init.h>
#include <linux/module.h>

static int __init hz_init(void)
{
	printk("get_hz initialization...\n");
	printk("HZ:%d\n",HZ);
	return 0;
}

static void __exit hz_exit(void)
{
	printk("get_hz exit...");
	return;
}

module_init(hz_init);
module_exit(hz_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("wxq");
