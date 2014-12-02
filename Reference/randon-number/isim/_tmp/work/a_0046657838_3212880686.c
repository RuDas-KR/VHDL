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

/* This file is designed for use with ISim build 0x734844ce */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/hg/random_number/random0_9.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_std_logic_unsigned_equal_stdv_stdv(char *, char *, char *, char *, char *);
unsigned char p_2592010699_sub_1744673427_2592010699(char *, char *, unsigned int , unsigned int );
char *p_3620187407_sub_4185486039_3620187407(char *, char *, char *, char *, int );


static void work_a_0046657838_3212880686_p_0(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t12;
    unsigned int t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 704U);
    t3 = p_2592010699_sub_1744673427_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 1664);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 2720);
    t6 = (t0 + 1708);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 2724);
    t5 = (t0 + 976U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 4U);
    goto LAB3;

LAB5:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 976U);
    t5 = *((char **)t2);
    t2 = (t0 + 2696U);
    t6 = (t0 + 2728);
    t8 = (t11 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 3;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t12 = (3 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t13;
    t4 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t5, t2, t6, t11);
    if (t4 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 976U);
    t2 = *((char **)t1);
    t1 = (t0 + 2696U);
    t5 = p_3620187407_sub_4185486039_3620187407(IEEE_P_3620187407, t11, t2, t1, 1);
    t6 = (t0 + 976U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    t8 = (t11 + 12U);
    t13 = *((unsigned int *)t8);
    t12 = (1U * t13);
    memcpy(t6, t5, t12);

LAB8:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    xsi_set_current_line(48, ng0);
    t9 = (t0 + 2732);
    t14 = (t0 + 976U);
    t15 = *((char **)t14);
    t14 = (t15 + 0);
    memcpy(t14, t9, 4U);
    goto LAB8;

LAB10:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 976U);
    t5 = *((char **)t1);
    t1 = (t0 + 1708);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 4U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB11;

}


extern void work_a_0046657838_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0046657838_3212880686_p_0};
	xsi_register_didat("work_a_0046657838_3212880686", "isim/_tmp/work/a_0046657838_3212880686.didat");
	xsi_register_executes(pe);
}
