/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

/* This file is designed for use with ISim build 0xef153c89 */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Stop_Watch/Stopw/atch/wefwef/INT2SEG2.VHD";



static void work_a_1963789915_2866026638_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    int t10;

LAB0:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 90);
    if (t3 != 0)
        goto LAB5;

LAB6:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 80);
    if (t3 != 0)
        goto LAB7;

LAB8:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 70);
    if (t3 != 0)
        goto LAB9;

LAB10:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 60);
    if (t3 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 50);
    if (t3 != 0)
        goto LAB13;

LAB14:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 40);
    if (t3 != 0)
        goto LAB15;

LAB16:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 30);
    if (t3 != 0)
        goto LAB17;

LAB18:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 20);
    if (t3 != 0)
        goto LAB19;

LAB20:    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t3 = (t9 >= 10);
    if (t3 != 0)
        goto LAB21;

LAB22:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1884);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t9;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 1840);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1920);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 9;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 90);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(38, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 80);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB9:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 7;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(40, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 70);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB11:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 6;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(42, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 60);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB13:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 5;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 50);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB15:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 4;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 40);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB17:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 30);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB19:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 20);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB21:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1884);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t10 = (t9 - 10);
    t1 = (t0 + 1920);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t10;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}


extern void work_a_1963789915_2866026638_init()
{
	static char *pe[] = {(void *)work_a_1963789915_2866026638_p_0};
	xsi_register_didat("work_a_1963789915_2866026638", "isim/_tmp/work/a_1963789915_2866026638.didat");
	xsi_register_executes(pe);
}
