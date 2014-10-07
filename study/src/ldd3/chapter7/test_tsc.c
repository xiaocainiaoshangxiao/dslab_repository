#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>

static int __init test_tsc_init(void)
{
	unsigned long ini,end;
	rdtscl(ini);rdtscl(end);
	printk("time lapse:%li\n",end-ini);

	return 0;
}

static void __exit test_tsc_exit(void)
{
	printk("tsc exit...\n");
	return;
}

module_init(test_tsc_init);
module_exit(test_tsc_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("wangxq");
