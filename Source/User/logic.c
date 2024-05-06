#include "logic.h"
#include "apt32f102a_tkey.h"
#include "apt32f102a_ifc.h"
/*主要应用参数*/

U16_T uart_tx_cnt = 0;
U16_T led_blink_cnt = 0;

/*校准点*/
U16_T cal_0_AD0 = 0;
U16_T cal_0_AD2 = 0;
U16_T cal_1_AD0 = 0;
U16_T cal_1_AD2 = 0;
U16_T cal_2_AD0 = 0;
U16_T cal_2_AD2 = 0;
U16_T cal_3_AD0 = 0;
U16_T cal_3_AD2 = 0;

/*校准参数*/

F32_T cal_0_a = 0;
F32_T cal_0_b = 0;
F32_T cal_1_a = 0;
F32_T cal_1_b = 0;
F32_T cal_2_a = 0;
F32_T cal_2_b = 0;
F32_T cal_3_a = 0;
F32_T cal_3_b = 0;

cal_union cal0_a;
cal_union cal0_b;
cal_union cal1_a;
cal_union cal1_b;
cal_union cal2_a;
cal_union cal2_b;
cal_union cal3_a;
cal_union cal3_b;

// 10ms
void
task_sys(void)
{
	if(uart_tx_cnt++ > 50)
	{
		uart_tx_cnt = 0;
		my_printf("k1:%d,k2:%d,k3:%d\n", Key_Map & (1 << 6) ? 1 : 0, Key_Map & (1 << 8) ? 1 : 0, Key_Map & (1 << 7) ? 1 : 0);
		my_printf("cal_ad0:%d, cal_ad2:%d",cal_0_AD0,cal_0_AD2);
	}
	if(led_blink_cnt++ < 30)
	{
		GPIO_Write_High(GPIOA0, 4);
//		GPIO_Write_High(GPIOA0, 3);
//		GPIO_Write_High(GPIOA0, 1);
//		GPIO_Write_High(GPIOA0, 0);
	}
	else if(led_blink_cnt++ < 60)
	{
		GPIO_Write_Low(GPIOA0,4);
//		GPIO_Write_Low(GPIOA0,3);
//		GPIO_Write_Low(GPIOA0,1);
//		GPIO_Write_Low(GPIOA0,0);
	}
	else 
	{
		led_blink_cnt = 0;
	}
	
}
void cal_comput(U8_T ch)
{
	switch(ch)
	{
	case 0:
		cal0_a.flo = 2000.0 / (cal_0_AD2 - cal_0_AD0);
		cal0_b.flo = 2000.0 - cal_0_AD2 * cal0_a.flo;
		Page_ProgramData(DROM_PageAdd0, 4, cal0_a.arr);
		Page_ProgramData(DROM_PageAdd1, 4, cal0_b.arr);
		break;
	case 1:
		cal1_a.flo = 2000.0 / (cal_1_AD2 - cal_1_AD0);
		cal1_b.flo = 2000.0 - cal_1_AD2 * cal1_a.flo;
		Page_ProgramData(DROM_PageAdd2, 4, cal1_a.arr);
		Page_ProgramData(DROM_PageAdd3, 4, cal1_b.arr);
		break;
	case 2:
		cal2_a.flo = 2000.0 / (cal_2_AD2 - cal_2_AD0);
		cal2_b.flo = 2000.0 - cal_2_AD2 * cal2_a.flo;
		Page_ProgramData(DROM_PageAdd4, 4, cal2_a.arr);
		Page_ProgramData(DROM_PageAdd5, 4, cal2_b.arr);
		break;
	case 3:
		cal3_a.flo = 2000.0 / (cal_3_AD2 - cal_3_AD0);
		cal3_b.flo = 2000.0 - cal_3_AD2 * cal3_a.flo;
		Page_ProgramData(DROM_PageAdd6, 4, cal3_a.arr);
		Page_ProgramData(DROM_PageAdd7, 4, cal3_b.arr);
		break;
	}
	

	

	

	

	
	
	
	
}