// Datasheet for the chip: https://www.microchip.com/content/dam/mchp/documents/CPG/ProductDocuments/DataSheets/MEC172x-Data-Sheet-DS00003583E.pdf

MEMORY {
    
    // u_Notes about FLASH:
    //  - This assumes the 'Cache SPI Enable' bit is 0, which it is by default.
    //  - See FIGURE 7-1 on page 180 of the datasheet for more info (384KB comes from 32KB + 352KB. If the 'Cache SPI Enable' bit was 1, FLASH would just be 352KB).
    //  - Also, the 384K number is supported by https://github.com/embassy-rs/embassy/blob/e9c32931b906649d65fc502fe8e8f2c70ef1e6ab/examples/microchip/memory.x
    FLASH : ORIGIN = 0x000C0000, LENGTH = 384K

    RAM   : ORIGIN = 0x00118000, LENGTH = 62K
}