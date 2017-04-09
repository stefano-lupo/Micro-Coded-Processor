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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    work_a_2416796310_3212880686_init();
    work_a_2482568259_3212880686_init();
    work_a_2453842214_3212880686_init();
    work_a_0599258179_3212880686_init();
    work_a_3708454132_3212880686_init();
    work_a_2878905872_3212880686_init();
    work_a_0213477985_3212880686_init();
    work_a_0212215001_3212880686_init();
    work_a_2270315936_3212880686_init();
    work_a_3435129797_3212880686_init();
    work_a_1249275541_3212880686_init();
    work_a_2857801645_3212880686_init();
    work_a_1292655293_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_2429904220_3212880686_init();
    work_a_0314181152_3212880686_init();
    work_a_3037933143_3212880686_init();
    work_a_3430011751_3212880686_init();
    work_a_3733893370_3212880686_init();
    work_a_2163191159_3212880686_init();
    work_a_4230703719_3212880686_init();
    work_a_2433765616_3212880686_init();
    work_a_0424131810_3212880686_init();
    work_a_2083119018_3212880686_init();
    work_a_0664079147_3212880686_init();
    work_a_2865969475_3212880686_init();
    work_a_0878707372_2372691052_init();


    xsi_register_tops("work_a_0878707372_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
