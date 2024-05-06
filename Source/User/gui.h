#ifndef _GUI_H
#define _GUI_H

#include "task.h"
typedef unsigned char u8;
typedef unsigned int u16;
typedef unsigned long u32;

typedef struct
{
    u8 current;
    u8 set;
    u8 set_l;
    u8 up;
    u8 up_l;
    u8 down;
    u8 down_l;
    void (*operation)(void);
}key_table_typedef;

typedef struct
{
    u8 set_select;
    u8 calibration_select;
}gui_arguments_typedef;

typedef struct 
{
    U8_T cal_00 :1;
    U8_T cal_10 : 1;
    U8_T cal_20 : 1;
    U8_T cal_30 : 1;
    U8_T cal_02 : 1;
    U8_T cal_12 : 1;
    U8_T cal_22 : 1;
    U8_T cal_32 : 1;
}cal_ok_typedef;



void task_gui();

#endif