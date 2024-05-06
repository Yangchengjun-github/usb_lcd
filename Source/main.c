/*
 ******************************************************************************
 * @file    main.c
 * @author  APT AE Team
 * @version V1.15
 * @date    2022/08/30
 ******************************************************************************
 *THIS SOFTWARE WHICH IS FOR ILLUSTRATIVE PURPOSES ONLY WHICH PROVIDES
 *CUSTOMER WITH CODING INFORMATION REGARDING THEIR PRODUCTS.
 *APT CHIP SHALL NOT BE HELD RESPONSIBILITY ADN LIABILITY FOR ANY DIRECT,
 *INDIRECT DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT OF
 *SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION
 *CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.AND APT CHIP RESERVES
 *THE RIGHT TO MAKE CHANGES IN THE SOFTWARE WITHOUT NOTIFICATION
 ******************************************************************************
 */
/* Includes ------------------------------------------------------------------*/
#include "apt32f102a.h"
#include "apt32f102a_adc.h"
#include "apt32f102a_bt.h"
#include "apt32f102a_coret.h"
#include "apt32f102a_countera.h"
#include "apt32f102a_crc.h"
#include "apt32f102a_ept.h"
#include "apt32f102a_et.h"
#include "apt32f102a_gpio.h"
#include "apt32f102a_gpt.h"
#include "apt32f102a_i2c.h"
#include "apt32f102a_ifc.h"
#include "apt32f102a_lpt.h"
#include "apt32f102a_rtc.h"
#include "apt32f102a_sio.h"
#include "apt32f102a_spi.h"
#include "apt32f102a_syscon.h"
#include "apt32f102a_uart.h"
#include "apt32f102a_wwdt.h"
#include "apt32f102a_types_local.h"
#include "apt32f102a_tkey.h"
#include "task.h"
#include "lcd.h"
#include "lcd_init.h"
#include "lcd.h"
#include "pic.h"
/* defines -------------------------------------------------------------------*/
/* externs Register-------------------------------------------------------------------*/

/* externs function-------------------------------------------------------------------*/
extern void delay_nms(unsigned int t);
extern void APT32F102_init(void);


U8_T flash1 = 8;
U8_T flash2 = 0;
/***************************************************/
// main
/**************************************************/
int main(void)
{
  // delay_nms(1000);
  // SYSCON_WDT_CMD(DISABLE);
  // PCLK_goto_deepsleep_mode();
  APT32F102_init();

  LCD_Init();
  LCD_Fill(0, 0, 160, 80, LGRAY);
  ReadDataArry(DROM_PageAdd0,4,cal0_a.arr);
  ReadDataArry(DROM_PageAdd1, 4, cal0_b.arr);
  ReadDataArry(DROM_PageAdd2, 4, cal1_a.arr);
  ReadDataArry(DROM_PageAdd3, 4, cal1_b.arr);
  ReadDataArry(DROM_PageAdd4, 4, cal2_a.arr);
  ReadDataArry(DROM_PageAdd5, 4, cal2_b.arr);
  ReadDataArry(DROM_PageAdd6, 4, cal3_a.arr);
  ReadDataArry(DROM_PageAdd7, 4, cal3_b.arr);
  // LCD_ShowPicture(100, 20, 40, 40, gImage_1);
  while (1)
  {

    SYSCON_IWDCNT_Reload();
    Task_Pro_Handler_Callback();
    // Page_ProgramData(DROM_PageAdd0, 4, &flash1);
    
    // ReadDataArry(DROM_PageAdd0,4,&flash2);
  //  my_printf("flash2:%d",flash2);

     ;
   //....
   //....
  }
}
/******************* (C) COPYRIGHT 2019 APT Chip *****END OF FILE****/