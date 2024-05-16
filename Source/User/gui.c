#include "lcd.h"
#include "lcd_init.h"
#include "lcd.h"
#include "gui.h"
#include "apt32f102a_ifc.h"

U8_T key_val;
U8_T index = 0;
U8_T index_last = 0;


void gui_home(void);
void gui_set(void);
void gui_calibration(void);
void gui_option2(void);
cal_ok_typedef cal_ok ={0};
gui_arguments_typedef gui_arguments = {0};
key_table_typedef key_table[] =
    {
        /*current set setL up upL down downL FunPoint*/
        {0, 0, 1, 0, 0, 0, 0, gui_home},
        {1, 2, 0, 1, 1, 1, 1, gui_set},
        {2, 2, 1, 2, 2, 2, 2, gui_calibration},
        {3, 3, 1, 3, 3, 3, 3, gui_option2},
};

void task_gui(void)
{
    if(KEY_SET_SHORT)
    {
        index = key_table[index].set;
    }
        
    if (KEY_SET_LONG)
    {
        index = key_table[index].set_l;
    }
        
    if (KEY_UP_SHORT)
        index = key_table[index].up;
    if (KEY_UP_SHORT)
        index = key_table[index].up_l;
    if (KEY_DOWN_SHORT)
        index = key_table[index].down;
    if (KEY_DOWN_SHORT)
        index = key_table[index].down_l;
    if(index != index_last)
    {
        index_last = index;
        LCD_Fill(0, 0, 160, 80, LGRAY);
    }
    (*key_table[index].operation)();
}
void gui_home(void)
{

    KEY_SET_SHORT = 0;
    KEY_SET_LONG = 0;
    KEY_UP_LONG = 0;
    KEY_UP_SHORT = 0;
    KEY_DOWN_LONG = 0;
    KEY_DOWN_SHORT = 0;

    LCD_ShowIntNum(10, 0, adc_result_conver[CH_USB4], 4, RED, WHITE, 16);
    LCD_ShowString(45, 0, "mA", BLACK, GREEN, 16, 0);
    LCD_ShowIntNum(10, 20, adc_result_conver[CH_USB3], 4, RED, WHITE, 16);
    LCD_ShowString(45, 20, "mA", BLACK, GREEN, 16, 0);
    LCD_ShowIntNum(10, 40, adc_result_conver[CH_USB2], 4, RED, WHITE, 16);
    LCD_ShowString(45, 40, "mA(<50)", BLACK, GREEN, 16, 0);
    LCD_ShowIntNum(10, 60, adc_result_conver[CH_USB1], 4, RED, WHITE, 16);
    LCD_ShowString(45, 60, "mA", BLACK, GREEN, 16, 0);
    LCD_Fill(0,0,160,80,BLUE);
    LCD_Fill(0, 0, 160, 80, BLACK);
}
void gui_set(void)
{
    KEY_SET_SHORT = 0;
    KEY_SET_LONG = 0;
    KEY_UP_LONG = 0;
    KEY_DOWN_LONG = 0;
   

    if(KEY_UP_SHORT)
    {
        KEY_UP_SHORT = 0;
        if(gui_arguments.set_select < 1)
            gui_arguments.set_select++;
        else
            gui_arguments.set_select = 0;

    }

    if(KEY_DOWN_SHORT)
    {
        KEY_DOWN_SHORT = 0;
        if(gui_arguments.set_select )
        {
            gui_arguments.set_select--;
        }
        else
            gui_arguments.set_select = 1;
    }
    key_table[1].set = gui_arguments.set_select + 2;
    LCD_ShowString(0, 0, "calibration", BLACK, gui_arguments.set_select == 0 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(0, 20, "option2", BLACK, gui_arguments.set_select == 1 ? GREEN : WHITE, 16, 0);
    
}
void gui_calibration(void)
{
    static U8_T t = 0;
    KEY_SET_SHORT = 0;
    KEY_SET_LONG = 0;

    if (KEY_UP_SHORT)
    {
        KEY_UP_SHORT = 0;
        if (gui_arguments.calibration_select < 3)
            gui_arguments.calibration_select++;
        else
            gui_arguments.calibration_select = 0;
    }

    if (KEY_DOWN_SHORT)
    {
        KEY_DOWN_SHORT = 0;
        if (gui_arguments.calibration_select)
        {
            gui_arguments.calibration_select--;
        }
        else
            gui_arguments.calibration_select = 3;
    }

    if (KEY_UP_LONG)
    {
        KEY_UP_LONG =0;
        switch (gui_arguments.calibration_select)
        {
        case 0:
            cal_ok.cal_00 = 1;
            cal_0_AD0 = adc_result_direct[CH_USB4];
            break;
        case 1:
            cal_ok.cal_10 = 1;
            cal_1_AD0 = adc_result_direct[CH_USB3];
            break;
        case 2:
            cal_ok.cal_20 = 1;
            cal_2_AD0 = adc_result_direct[CH_USB2];
            break;
        case 3:
            cal_ok.cal_30 = 1;
            cal_3_AD0 = adc_result_direct[CH_USB1];
            break;
        default:
            break;
        }
        t = 5;
    }
    if (KEY_DOWN_LONG)
    {
        KEY_DOWN_LONG = 0;
        switch (gui_arguments.calibration_select)
        {
        case 0:
            cal_ok.cal_02 = 1;
            cal_0_AD2 = adc_result_direct[CH_USB4];
            break;
        case 1:
            cal_ok.cal_12 = 1;
            cal_1_AD2 = adc_result_direct[CH_USB3];
            break;
        case 2:
            cal_ok.cal_22 = 1;
            cal_2_AD2 = adc_result_direct[CH_USB2];
            break;
        case 3:
            cal_ok.cal_32 = 1;
            cal_3_AD2 = adc_result_direct[CH_USB1];
            break;
        default:
            break;
        }
        cal_comput(gui_arguments.calibration_select);
        Page_ProgramData(DROM_PageAdd0,4,cal0_a.arr);
        t = 5;
    }
    if (t)
    {
        t--;
    }
    if(!t)
    {
        cal_ok.cal_00 = 0;
        cal_ok.cal_10 = 0;
        cal_ok.cal_20 = 0;
        cal_ok.cal_30 = 0;
        cal_ok.cal_02 = 0;
        cal_ok.cal_12 = 0;
        cal_ok.cal_22 = 0;
        cal_ok.cal_32 = 0;
    }

    LCD_ShowString(0, 0,   "cal1", BLACK, gui_arguments.calibration_select == 0 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(0, 20, "cal2", BLACK, gui_arguments.calibration_select == 1 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(0, 40, "cal3", BLACK, gui_arguments.calibration_select == 2 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(0, 60, "cal4", BLACK, gui_arguments.calibration_select == 3 ? GREEN : WHITE, 16, 0);

    LCD_ShowString(50, 0,  "cal_0A", BLACK, cal_ok.cal_00 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(50, 20, "cal_0A", BLACK, cal_ok.cal_10 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(50, 40, "cal_0A", BLACK, cal_ok.cal_20 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(50, 60, "cal_0A", BLACK, cal_ok.cal_30 ? GREEN : WHITE, 16, 0);

    LCD_ShowString(110, 0,  "cal_2A", BLACK, cal_ok.cal_02 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(110, 20, "cal_2A", BLACK, cal_ok.cal_12 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(110, 40, "cal_2A", BLACK, cal_ok.cal_22 ? GREEN : WHITE, 16, 0);
    LCD_ShowString(110, 60, "cal_2A", BLACK, cal_ok.cal_32 ? GREEN : WHITE, 16, 0);
}
void gui_option2(void)
{
    KEY_SET_SHORT = 0;
    KEY_SET_LONG = 0;
    KEY_UP_LONG = 0;
    KEY_UP_SHORT = 0;
    KEY_DOWN_LONG = 0;
    KEY_DOWN_SHORT = 0;
    LCD_ShowString(0, 0, "option2", BLACK, RED, 16, 0);

}
