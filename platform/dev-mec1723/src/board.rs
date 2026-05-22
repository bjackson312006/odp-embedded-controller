use platform_common::board::BoardIo;
use embassy_microchip::{uart, bind_interrupts, peripherals, Peripherals};

bind_interrupts!(struct Irqs {
    UART1 => uart::InterruptHandler::<peripherals::UART1>;
});


/// Board IO for the dev-mec1723 platform.
pub struct Board {
    pub uart: uart::Uart<'static, uart::Async>,
}

impl BoardIo for Board {
    type Peripherals = Peripherals;

    fn init(p: Self::Peripherals) -> Self {
        Board {
            /* Set up async UART on UART0 */
            uart: uart::Uart::new_async(
                p.UART1,
                p.GPIO171,
                p.GPIO170,
                Irqs,
                uart::Config::default()
            ).expect("Failed to create 'uart' in 'Board'.")
         }
    }
}
