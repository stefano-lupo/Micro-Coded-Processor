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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/main_memory_512_16bit.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_0314181152_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    int64 t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6000U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 1928U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((int *)t4) = t3;
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)2);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:
LAB3:    t1 = (t0 + 3232);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 1808U);
    t5 = *((char **)t1);
    t1 = (t0 + 1928U);
    t8 = *((char **)t1);
    t3 = *((int *)t8);
    t9 = (t3 - 0);
    t10 = (t9 * 1);
    xsi_vhdl_check_range_of_index(0, 20, 1, t3);
    t11 = (16U * t10);
    t12 = (0 + t11);
    t1 = (t5 + t12);
    memcpy(t1, t4, 16U);
    goto LAB3;

LAB5:    xsi_set_current_line(85, ng0);
    t13 = (1 * 1000LL);
    t1 = (t0 + 1808U);
    t4 = *((char **)t1);
    t1 = (t0 + 1928U);
    t5 = *((char **)t1);
    t3 = *((int *)t5);
    t9 = (t3 - 0);
    t10 = (t9 * 1);
    xsi_vhdl_check_range_of_index(0, 20, 1, t3);
    t11 = (16U * t10);
    t12 = (0 + t11);
    t1 = (t4 + t12);
    t8 = (t0 + 3312);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_delta(t8, 0U, 16U, t13);
    t18 = (t0 + 3312);
    xsi_driver_intertial_reject(t18, t13, t13);
    goto LAB6;

}


extern void work_a_0314181152_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0314181152_3212880686_p_0};
	xsi_register_didat("work_a_0314181152_3212880686", "isim/full_processor_TB_isim_beh.exe.sim/work/a_0314181152_3212880686.didat");
	xsi_register_executes(pe);
}
