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
static const char *ng0 = "D:/Stop_Watch/Stopw/atch/wefwef/TIMEBASE2.VHD";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_2592010699(char *, unsigned char );


static void work_a_1531742574_3175554263_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    char *t10;
    int t11;
    unsigned char t12;
    char *t13;

LAB0:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 528U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1876);
    t5 = (t1 + 32U);
    t8 = *((char **)t5);
    t10 = (t8 + 40U);
    t13 = *((char **)t10);
    *((unsigned char *)t13) = t3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 1832);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1080U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(25, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB3;

LAB5:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1080U);
    t8 = *((char **)t2);
    t9 = *((int *)t8);
    t2 = (t0 + 1016U);
    t10 = *((char **)t2);
    t11 = *((int *)t10);
    t12 = (t9 == t11);
    if (t12 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1080U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t11 = (t9 + 1);
    t1 = (t0 + 1080U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t11;

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 548U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t3 = t7;
    goto LAB9;

LAB10:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1080U);
    t13 = *((char **)t2);
    t2 = (t13 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_2592010699(IEEE_P_2592010699, t3);
    t1 = (t0 + 1144U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = t4;
    goto LAB11;

}


extern void work_a_1531742574_3175554263_init()
{
	static char *pe[] = {(void *)work_a_1531742574_3175554263_p_0};
	xsi_register_didat("work_a_1531742574_3175554263", "isim/_tmp/work/a_1531742574_3175554263.didat");
	xsi_register_executes(pe);
}
