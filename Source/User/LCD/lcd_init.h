#ifndef __LCD_INIT_H
#define __LCD_INIT_H

#include "apt32f102a_gpio.h"

#define USE_HORIZONTAL 3  //设置横屏或者竖屏显示 0或1为竖屏 2或3为横屏


#if USE_HORIZONTAL==0||USE_HORIZONTAL==1
#define LCD_W 80
#define LCD_H 160

#else
#define LCD_W 160
#define LCD_H 80
#endif

typedef unsigned char u8;
typedef unsigned int u16;

// sbit LCD_SCL=P1^0;//SCLK
// sbit LCD_SDA=P1^1;//MOSI
// sbit LCD_RES=P1^2;//RES
// sbit LCD_DC =P1^3;//DC
// sbit LCD_CS =P1^4; //CS
// sbit LCD_BLK=P1^5; //BLK



//-----------------LCD端口定义----------------

// #define LCD_SCLK_Clr() LCD_SCL=0//SCL=SCLK
// #define LCD_SCLK_Set() LCD_SCL=1

// #define LCD_MOSI_Clr() LCD_SDA=0//SDA=MOSI
// #define LCD_MOSI_Set() LCD_SDA=1

#define LCD_RES_Clr() GPIO_Write_Low(GPIOA0,2)//RES
#define LCD_RES_Set() GPIO_Write_High(GPIOA0, 2)

#define LCD_DC_Clr() GPIO_Write_Low(GPIOB0,1)//LCD_DC=0//DC
#define LCD_DC_Set() GPIO_Write_High(GPIOB0, 1) // LCD_DC=1

    // #define LCD_CS_Clr()  LCD_CS=0//CS
    // #define LCD_CS_Set()  LCD_CS=1

    // #define LCD_BLK_Clr()  LCD_BLK=0//BLK
    // #define LCD_BLK_Set()  LCD_BLK=1

    void
    delay_ms(unsigned int ms); // 不准确延时函数
void LCD_GPIO_Init(void);//初始化GPIO
void LCD_Writ_Bus(u8 dat);//模拟SPI时序
void LCD_WR_DATA8(u8 dat);//写入一个字节
void LCD_WR_DATA(u16 dat);//写入两个字节
void LCD_WR_REG(u8 dat);//写入一个指令
void LCD_Address_Set(u16 x1,u16 y1,u16 x2,u16 y2);//设置坐标函数
void LCD_Init(void);//LCD初始化
#endif




