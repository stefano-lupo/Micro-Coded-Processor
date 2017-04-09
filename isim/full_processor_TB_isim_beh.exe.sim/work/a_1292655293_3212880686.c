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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/lupos/Computer Architecture/MicroCode/Datapath/mux2_16bit.vhd";



static void work_a_1292655293_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    int64 t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    static char *nl0[] = {&&LAB5, &&LAB5, &&LAB3, &&LAB4, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5};

LAB0:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(28, ng0);
    t4 = (1 * 1000LL);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t5 = (t0 + 3072);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 16U);
    xsi_driver_first_trans_delta(t5, 0U, 16U, t4);
    t11 = (t0 + 3072);
    xsi_driver_intertial_reject(t11, t4, t4);
    goto LAB2;

LAB4:    xsi_set_current_line(29, ng0);
    t4 = (1 * 1000LL);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 3072);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_delta(t1, 0U, 16U, t4);
    t9 = (t0 + 3072);
    xsi_driver_intertial_reject(t9, t4, t4);
    goto LAB2;

LAB5:    xsi_set_current_line(30, ng0);
    t4 = (1 * 1000LL);
    t1 = (t0 + 5157);
    t5 = (t0 + 3072);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_delta(t5, 0U, 16U, t4);
    t10 = (t0 + 3072);
    xsi_driver_intertial_reject(t10, t4, t4);
    goto LAB2;

}


extern void work_a_1292655293_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1292655293_3212880686_p_0};
	xsi_register_didat("work_a_1292655293_3212880686", "isim/full_processor_TB_isim_beh.exe.sim/work/a_1292655293_3212880686.didat");
	xsi_register_executes(pe);
}
