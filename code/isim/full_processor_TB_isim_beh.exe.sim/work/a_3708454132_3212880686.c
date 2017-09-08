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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/unit_shifter_1bit.vhd";



static void work_a_3708454132_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    int64 t12;
    char *t13;
    char *t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    t1 = (t0 + 2512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4869);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB9:    t6 = (t0 + 4871);
    t8 = xsi_mem_cmp(t6, t3, 2U);
    if (t8 == 1)
        goto LAB6;

LAB10:    t9 = (t0 + 4873);
    t11 = xsi_mem_cmp(t9, t3, 2U);
    if (t11 == 1)
        goto LAB7;

LAB11:
LAB8:    xsi_set_current_line(35, ng0);
    t12 = (1 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t5 = (1 - 2);
    t16 = (t5 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t2 = (t3 + t18);
    t19 = *((unsigned char *)t2);
    t4 = (t0 + 2912);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t19;
    xsi_driver_first_trans_delta(t4, 0U, 1, t12);
    t13 = (t0 + 2912);
    xsi_driver_intertial_reject(t13, t12, t12);

LAB4:    xsi_set_current_line(34, ng0);

LAB15:    t2 = (t0 + 2832);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB5:    xsi_set_current_line(35, ng0);
    t12 = (1 * 1000LL);
    t13 = (t0 + 1192U);
    t14 = *((char **)t13);
    t15 = (1 - 2);
    t16 = (t15 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t13 = (t14 + t18);
    t19 = *((unsigned char *)t13);
    t20 = (t0 + 2912);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = t19;
    xsi_driver_first_trans_delta(t20, 0U, 1, t12);
    t25 = (t0 + 2912);
    xsi_driver_intertial_reject(t25, t12, t12);
    goto LAB4;

LAB6:    xsi_set_current_line(35, ng0);
    t12 = (1 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t5 = (2 - 2);
    t16 = (t5 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t2 = (t3 + t18);
    t19 = *((unsigned char *)t2);
    t4 = (t0 + 2912);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t19;
    xsi_driver_first_trans_delta(t4, 0U, 1, t12);
    t13 = (t0 + 2912);
    xsi_driver_intertial_reject(t13, t12, t12);
    goto LAB4;

LAB7:    xsi_set_current_line(35, ng0);
    t12 = (1 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t5 = (0 - 2);
    t16 = (t5 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t2 = (t3 + t18);
    t19 = *((unsigned char *)t2);
    t4 = (t0 + 2912);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t19;
    xsi_driver_first_trans_delta(t4, 0U, 1, t12);
    t13 = (t0 + 2912);
    xsi_driver_intertial_reject(t13, t12, t12);
    goto LAB4;

LAB12:;
LAB13:    t3 = (t0 + 2832);
    *((int *)t3) = 0;
    goto LAB2;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

}


extern void work_a_3708454132_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3708454132_3212880686_p_0};
	xsi_register_didat("work_a_3708454132_3212880686", "isim/full_processor_TB_isim_beh.exe.sim/work/a_3708454132_3212880686.didat");
	xsi_register_executes(pe);
}
