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
static const char *ng0 = "D:/Stop_Watch/Stopw/atch/wefwef/STPWATCH.VHD";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_2592010699(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_2592010699(char *, unsigned char );


static void work_a_3965607947_1181938964_p_0(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(78, ng0);

LAB3:    t1 = (t0 + 6856);
    t3 = (t0 + 4116);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3965607947_1181938964_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 1164U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1320U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4048);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 4152);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1428U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = ieee_p_2592010699_sub_1690584930_2592010699(IEEE_P_2592010699, t11);
    t2 = (t0 + 4152);
    t7 = (t2 + 32U);
    t8 = *((char **)t7);
    t13 = (t8 + 40U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t12;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB7:    t2 = (t0 + 1340U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

}

static void work_a_3965607947_1181938964_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(113, ng0);

LAB3:    t1 = (t0 + 1252U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 636U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1605435078_2592010699(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 4188);
    t7 = (t1 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 4056);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3965607947_1181938964_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(115, ng0);

LAB3:    t1 = (t0 + 1428U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1604U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1605435078_2592010699(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 4224);
    t7 = (t1 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 4064);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3965607947_1181938964_p_4(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(162, ng0);
    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 1);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 2);
    if (t4 != 0)
        goto LAB5;

LAB6:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 3);
    if (t4 != 0)
        goto LAB7;

LAB8:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 4);
    if (t4 != 0)
        goto LAB9;

LAB10:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 5);
    if (t4 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(167, ng0);
    t1 = (t0 + 6894);
    t5 = (t0 + 4260);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 6U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(167, ng0);
    t1 = (t0 + 2484U);
    t2 = *((char **)t1);
    t1 = (t0 + 4296);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 4072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(162, ng0);
    t1 = (t0 + 6864);
    t6 = (t0 + 4260);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(162, ng0);
    t1 = (t0 + 2044U);
    t2 = *((char **)t1);
    t1 = (t0 + 4296);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(163, ng0);
    t1 = (t0 + 6870);
    t6 = (t0 + 4260);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(163, ng0);
    t1 = (t0 + 2132U);
    t2 = *((char **)t1);
    t1 = (t0 + 4296);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB7:    xsi_set_current_line(164, ng0);
    t1 = (t0 + 6876);
    t6 = (t0 + 4260);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(164, ng0);
    t1 = (t0 + 2220U);
    t2 = *((char **)t1);
    t1 = (t0 + 4296);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB9:    xsi_set_current_line(165, ng0);
    t1 = (t0 + 6882);
    t6 = (t0 + 4260);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(165, ng0);
    t1 = (t0 + 2308U);
    t2 = *((char **)t1);
    t1 = (t0 + 4296);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB11:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 6888);
    t6 = (t0 + 4260);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(166, ng0);
    t1 = (t0 + 2396U);
    t2 = *((char **)t1);
    t1 = (t0 + 4296);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

}


extern void work_a_3965607947_1181938964_init()
{
	static char *pe[] = {(void *)work_a_3965607947_1181938964_p_0,(void *)work_a_3965607947_1181938964_p_1,(void *)work_a_3965607947_1181938964_p_2,(void *)work_a_3965607947_1181938964_p_3,(void *)work_a_3965607947_1181938964_p_4};
	xsi_register_didat("work_a_3965607947_1181938964", "isim/_tmp/work/a_3965607947_1181938964.didat");
	xsi_register_executes(pe);
}
