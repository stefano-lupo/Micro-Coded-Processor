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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/mux8_1bit.vhd";



static void work_a_3733893370_3212880686_p_0(char *t0)
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
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    int64 t26;
    char *t27;
    char *t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    xsi_set_current_line(18, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4843);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB12:    t5 = (t0 + 4846);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB13:    t8 = (t0 + 4849);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB14:    t11 = (t0 + 4852);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB15:    t14 = (t0 + 4855);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB16:    t17 = (t0 + 4858);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB8;

LAB17:    t20 = (t0 + 4861);
    t22 = xsi_mem_cmp(t20, t2, 3U);
    if (t22 == 1)
        goto LAB9;

LAB18:    t23 = (t0 + 4864);
    t25 = xsi_mem_cmp(t23, t2, 3U);
    if (t25 == 1)
        goto LAB10;

LAB19:
LAB11:    xsi_set_current_line(27, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 2912);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, t26);
    t8 = (t0 + 2912);
    xsi_driver_intertial_reject(t8, t26, t26);

LAB2:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(19, ng0);
    t26 = (1 * 1000LL);
    t27 = (t0 + 1032U);
    t28 = *((char **)t27);
    t29 = (0 - 7);
    t30 = (t29 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t27 = (t28 + t32);
    t33 = *((unsigned char *)t27);
    t34 = (t0 + 2912);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    *((unsigned char *)t38) = t33;
    xsi_driver_first_trans_delta(t34, 0U, 1, t26);
    t39 = (t0 + 2912);
    xsi_driver_intertial_reject(t39, t26, t26);
    goto LAB2;

LAB4:    xsi_set_current_line(20, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (1 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB5:    xsi_set_current_line(21, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (2 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB6:    xsi_set_current_line(22, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (3 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB7:    xsi_set_current_line(23, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (4 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB8:    xsi_set_current_line(24, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (5 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB9:    xsi_set_current_line(25, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (6 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB10:    xsi_set_current_line(26, ng0);
    t26 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (7 - 7);
    t30 = (t4 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t1 = (t2 + t32);
    t33 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t33;
    xsi_driver_first_trans_delta(t3, 0U, 1, t26);
    t11 = (t0 + 2912);
    xsi_driver_intertial_reject(t11, t26, t26);
    goto LAB2;

LAB20:;
}


extern void work_a_3733893370_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3733893370_3212880686_p_0};
	xsi_register_didat("work_a_3733893370_3212880686", "isim/microprogram_control_TB_isim_beh.exe.sim/work/a_3733893370_3212880686.didat");
	xsi_register_executes(pe);
}
