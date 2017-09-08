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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/mux2_1bit.vhd";



static void work_a_0213477985_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    int t13;
    int64 t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 5570);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t5 = (t0 + 5572);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 5574);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 5576);
    t13 = xsi_mem_cmp(t11, t2, 2U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(36, ng0);
    t14 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t17 = *((unsigned char *)t2);
    t1 = (t0 + 3392);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = t17;
    xsi_driver_first_trans_delta(t1, 0U, 1, t14);
    t9 = (t0 + 3392);
    xsi_driver_intertial_reject(t9, t14, t14);

LAB2:    t1 = (t0 + 3312);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(32, ng0);
    t14 = (1 * 1000LL);
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t17 = *((unsigned char *)t16);
    t15 = (t0 + 3392);
    t18 = (t15 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t17;
    xsi_driver_first_trans_delta(t15, 0U, 1, t14);
    t22 = (t0 + 3392);
    xsi_driver_intertial_reject(t22, t14, t14);
    goto LAB2;

LAB4:    xsi_set_current_line(33, ng0);
    t14 = (1 * 1000LL);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t17 = *((unsigned char *)t2);
    t1 = (t0 + 3392);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = t17;
    xsi_driver_first_trans_delta(t1, 0U, 1, t14);
    t9 = (t0 + 3392);
    xsi_driver_intertial_reject(t9, t14, t14);
    goto LAB2;

LAB5:    xsi_set_current_line(34, ng0);
    t14 = (1 * 1000LL);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t17 = *((unsigned char *)t2);
    t1 = (t0 + 3392);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = t17;
    xsi_driver_first_trans_delta(t1, 0U, 1, t14);
    t9 = (t0 + 3392);
    xsi_driver_intertial_reject(t9, t14, t14);
    goto LAB2;

LAB6:    xsi_set_current_line(35, ng0);
    t14 = (1 * 1000LL);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t17 = *((unsigned char *)t2);
    t1 = (t0 + 3392);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = t17;
    xsi_driver_first_trans_delta(t1, 0U, 1, t14);
    t9 = (t0 + 3392);
    xsi_driver_intertial_reject(t9, t14, t14);
    goto LAB2;

LAB12:;
}


extern void work_a_0213477985_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0213477985_3212880686_p_0};
	xsi_register_didat("work_a_0213477985_3212880686", "isim/full_processor_TB_isim_beh.exe.sim/work/a_0213477985_3212880686.didat");
	xsi_register_executes(pe);
}
