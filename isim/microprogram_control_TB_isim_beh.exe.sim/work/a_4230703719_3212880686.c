/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/instruction_register.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_4230703719_3212880686_p_0(char *t0)
{
    char t17[16];
    char t18[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    int64 t16;
    int t19;
    unsigned int t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(25, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(26, ng0);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = (15 - 2);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t3 = (t7 + t10);
    t11 = (t0 + 3552);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t3, 3U);
    xsi_driver_first_trans_fast_port(t11);
    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t8 = (15 - 5);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t3 + t10);
    t4 = (t0 + 3616);
    t7 = (t4 + 56U);
    t11 = *((char **)t7);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 3U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t8 = (15 - 8);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t3 + t10);
    t4 = (t0 + 3680);
    t7 = (t4 + 56U);
    t11 = *((char **)t7);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 3U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(29, ng0);
    t16 = (5 * 1000LL);
    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t8 = (15 - 15);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t3 + t10);
    t7 = ((IEEE_P_2592010699) + 4024);
    t11 = (t18 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 15;
    t12 = (t11 + 4U);
    *((int *)t12) = 9;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t19 = (9 - 15);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t20;
    t4 = xsi_base_array_concat(t4, t17, t7, (char)99, (unsigned char)2, (char)97, t1, t18, (char)101);
    t20 = (1U + 7U);
    t2 = (8U != t20);
    if (t2 == 1)
        goto LAB8;

LAB9:    t12 = (t0 + 3744);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t21 = *((char **)t15);
    memcpy(t21, t4, 8U);
    xsi_driver_first_trans_delta(t12, 0U, 8U, t16);
    t22 = (t0 + 3744);
    xsi_driver_intertial_reject(t22, t16, t16);
    goto LAB6;

LAB8:    xsi_size_not_matching(8U, t20, 0);
    goto LAB9;

}


extern void work_a_4230703719_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4230703719_3212880686_p_0};
	xsi_register_didat("work_a_4230703719_3212880686", "isim/microprogram_control_TB_isim_beh.exe.sim/work/a_4230703719_3212880686.didat");
	xsi_register_executes(pe);
}
