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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/arithmetic_unit.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);


static void work_a_2857801645_3212880686_p_0(char *t0)
{
    char t24[16];
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
    char *t12;
    char *t13;
    int t14;
    int64 t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t25;
    unsigned int t26;
    unsigned char t27;

LAB0:    t1 = (t0 + 3792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 8625);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB10:    t6 = (t0 + 8627);
    t8 = xsi_mem_cmp(t6, t3, 2U);
    if (t8 == 1)
        goto LAB6;

LAB11:    t9 = (t0 + 8629);
    t11 = xsi_mem_cmp(t9, t3, 2U);
    if (t11 == 1)
        goto LAB7;

LAB12:    t12 = (t0 + 8631);
    t14 = xsi_mem_cmp(t12, t3, 2U);
    if (t14 == 1)
        goto LAB8;

LAB13:
LAB9:    xsi_set_current_line(62, ng0);
    t15 = (1 * 1000LL);
    t2 = (t0 + 8665);
    t4 = (t0 + 4984);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 16U);
    xsi_driver_first_trans_delta(t4, 0U, 16U, t15);
    t12 = (t0 + 4984);
    xsi_driver_intertial_reject(t12, t15, t15);

LAB4:    xsi_set_current_line(61, ng0);

LAB19:    t2 = (t0 + 4856);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB20;

LAB1:    return;
LAB5:    xsi_set_current_line(62, ng0);
    t15 = (1 * 1000LL);
    t16 = (t0 + 8633);
    t18 = (t0 + 4984);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t16, 16U);
    xsi_driver_first_trans_delta(t18, 0U, 16U, t15);
    t23 = (t0 + 4984);
    xsi_driver_intertial_reject(t23, t15, t15);
    goto LAB4;

LAB6:    xsi_set_current_line(62, ng0);
    t15 = (1 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_delta(t2, 0U, 16U, t15);
    t10 = (t0 + 4984);
    xsi_driver_intertial_reject(t10, t15, t15);
    goto LAB4;

LAB7:    xsi_set_current_line(62, ng0);
    t15 = (1 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 8468U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t24, t3, t2);
    t6 = (t24 + 12U);
    t25 = *((unsigned int *)t6);
    t26 = (1U * t25);
    t27 = (16U != t26);
    if (t27 == 1)
        goto LAB15;

LAB16:    t7 = (t0 + 4984);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 16U);
    xsi_driver_first_trans_delta(t7, 0U, 16U, t15);
    t16 = (t0 + 4984);
    xsi_driver_intertial_reject(t16, t15, t15);
    goto LAB4;

LAB8:    xsi_set_current_line(62, ng0);
    t15 = (1 * 1000LL);
    t2 = (t0 + 8649);
    t4 = (t0 + 4984);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 16U);
    xsi_driver_first_trans_delta(t4, 0U, 16U, t15);
    t12 = (t0 + 4984);
    xsi_driver_intertial_reject(t12, t15, t15);
    goto LAB4;

LAB14:;
LAB15:    xsi_size_not_matching(16U, t26, 0);
    goto LAB16;

LAB17:    t3 = (t0 + 4856);
    *((int *)t3) = 0;
    goto LAB2;

LAB18:    goto LAB17;

LAB20:    goto LAB18;

}

static void work_a_2857801645_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(80, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 5048);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4872);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2857801645_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(81, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5112);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4888);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2857801645_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(82, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5176);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4904);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2857801645_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2857801645_3212880686_p_0,(void *)work_a_2857801645_3212880686_p_1,(void *)work_a_2857801645_3212880686_p_2,(void *)work_a_2857801645_3212880686_p_3};
	xsi_register_didat("work_a_2857801645_3212880686", "isim/full_processor_TB_isim_beh.exe.sim/work/a_2857801645_3212880686.didat");
	xsi_register_executes(pe);
}
