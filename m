Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A2E947E281
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 00:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935329AbeCCASq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 19:18:46 -0500
Received: from mail-oi0-f68.google.com ([209.85.218.68]:46577 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932890AbeCCASp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 19:18:45 -0500
Received: by mail-oi0-f68.google.com with SMTP id x12so8288657oie.13
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 16:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=LTl2rpoXD3Vbjs6NXBe6BMvqJIxhQKYMegZLjDLlvGY=;
        b=KDaWqk0VdkIMjOV4tuPaQJlaazLoTKpdV4+47A72B0+hPE/NsJasYgf+tFzqIU3luD
         ipTUR9IVvxjEt1II6WOu5kP+psprJ99nwDplOBg2V3qetzDVgaJxsDYK6cUd4A5+ymTM
         8cGme0oh67g+UDXLPd5YLBqdYLHQXdtchCck8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=LTl2rpoXD3Vbjs6NXBe6BMvqJIxhQKYMegZLjDLlvGY=;
        b=N0moPOPA78nRkJIJZSr6lDeYPnvbDcEqVefdAXVOZ/pqIP2o5rW4PJHIv3X/r7yEcd
         YnOcMhJ+OrT9Gbfdh71rIsWQDlTkse/Jq4XGrmbuvtLfVFDNxrv7PO/0NieOm7PwL2s/
         WLW6CxRYKNbVDOAJhRDadN2pPET2sDGMljxZlhC1FxJ/TJC+srJ3JSzAR9Y1SzIlc3oh
         uIhpJOfFKUFFVKzqpslaVpYWkyRduJUYNmcjcqmWwGHcrwPxn8aV3JmlNMp/C0TECqSJ
         xnr+n+2C4qpZz7azKJf7WeVVVLosXsD0UyNLm+FP7nuDs2v0IsBwx4nqVItIYY3auxGK
         5S2A==
X-Gm-Message-State: APf1xPDAUdgR9y0NE2PiWfRGCc/TZStz1U0W+WCJFgYbdlR9Rn9X2nu9
        6Wrt7pHPICwrfFii/PRC5k4oxnw/++w=
X-Google-Smtp-Source: AG47ELt3bmopdNbHt22VZ+4c3esfE/XqbS19OzHHQ5CimPfGjMS9X/SFKfbgdoLrsKVdyIuuWnBQmQ==
X-Received: by 10.202.83.73 with SMTP id h70mr4582833oib.154.1520036324054;
        Fri, 02 Mar 2018 16:18:44 -0800 (PST)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id i4sm3571159oib.36.2018.03.02.16.18.43
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Mar 2018 16:18:43 -0800 (PST)
Received: by mail-oi0-f44.google.com with SMTP id c18so8282783oiy.9
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 16:18:43 -0800 (PST)
X-Received: by 10.202.17.6 with SMTP id 6mr4480172oir.266.1520035960558; Fri,
 02 Mar 2018 16:12:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.14.33 with HTTP; Fri, 2 Mar 2018 16:11:59 -0800 (PST)
In-Reply-To: <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org> <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 2 Mar 2018 16:11:59 -0800
X-Gmail-Original-Message-ID: <CAE=gft4Hwqq2gx+b9AmiX1ZZBrSt1Ca2E48JV77wpcQQT0060w@mail.gmail.com>
Message-ID: <CAE=gft4Hwqq2gx+b9AmiX1ZZBrSt1Ca2E48JV77wpcQQT0060w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, wsa@the-dreams.de,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, acourbot@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Karthik,

On Tue, Feb 27, 2018 at 5:38 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> This driver supports GENI based UART Controller in the Qualcomm SOCs. The
> Qualcomm Generic Interface (GENI) is a programmable module supporting a
> wide range of serial interfaces including UART. This driver support console
> operations using FIFO mode of transfer.
>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Doug Anderson <dianders@google.com>
> ---
>  drivers/tty/serial/Kconfig            |   11 +
>  drivers/tty/serial/Makefile           |    1 +
>  drivers/tty/serial/qcom_geni_serial.c | 1181 +++++++++++++++++++++++++++++++++
>  3 files changed, 1193 insertions(+)
>  create mode 100644 drivers/tty/serial/qcom_geni_serial.c
>
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 3682fd3..c6b1500 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -1104,6 +1104,17 @@ config SERIAL_MSM_CONSOLE
>         select SERIAL_CORE_CONSOLE
>         select SERIAL_EARLYCON
>
> +config SERIAL_QCOM_GENI
> +       bool "QCOM on-chip GENI based serial port support"
> +       depends on ARCH_QCOM
> +       depends on QCOM_GENI_SE

My understanding is that this has to be "bool" because there's a
console in there, and consoles cannot be built as modules. Stephen is
suggesting splitting this option up into two, so you could have serial
with or without the console. That's fine, and probably the preferred
way. However, you do want to make sure that if serial (or what's soon
to be serial+console) is enabled, that QCOM_GENI_SE has to be built
=y, and not =m. I'd suggest "select QCOM_GENI_SE" in the new
SERIAL_QCOM_GENI_CONSOLE (or whatever it's called). As it is now, if
SERIAL_QCOM_GENI=y and QCOM_GENI_SE=m, there's a build failure.

GENI_SE is allowed to be built as a module if serial is not enabled
and I2C is built as a module. In order to keep the dependency arrows
going in the same direction, you might want the I2C driver to "select
QCOM_GENI_SE" as well, in order to upgrade GENI_SE to y if I2C is y.

> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> new file mode 100644
> index 0000000..8536b7d
> --- /dev/null
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -0,0 +1,1181 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
> +
> +#include <linux/console.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/qcom-geni-se.h>
> +#include <linux/serial.h>
> +#include <linux/serial_core.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <linux/tty_flip.h>
> +
> +/* UART specific GENI registers */
> +#define SE_UART_TX_TRANS_CFG           0x25c
> +#define SE_UART_TX_WORD_LEN            0x268
> +#define SE_UART_TX_STOP_BIT_LEN                0x26c
> +#define SE_UART_TX_TRANS_LEN           0x270
> +#define SE_UART_RX_TRANS_CFG           0x280
> +#define SE_UART_RX_WORD_LEN            0x28c
> +#define SE_UART_RX_STALE_CNT           0x294
> +#define SE_UART_TX_PARITY_CFG          0x2a4
> +#define SE_UART_RX_PARITY_CFG          0x2a8
> +
> +/* SE_UART_TRANS_CFG */
> +#define UART_TX_PAR_EN         BIT(0)
> +#define UART_CTS_MASK          BIT(1)
> +
> +/* SE_UART_TX_WORD_LEN */
> +#define TX_WORD_LEN_MSK                GENMASK(9, 0)
> +
> +/* SE_UART_TX_STOP_BIT_LEN */
> +#define TX_STOP_BIT_LEN_MSK    GENMASK(23, 0)
> +#define TX_STOP_BIT_LEN_1      0
> +#define TX_STOP_BIT_LEN_1_5    1
> +#define TX_STOP_BIT_LEN_2      2
> +
> +/* SE_UART_TX_TRANS_LEN */
> +#define TX_TRANS_LEN_MSK       GENMASK(23, 0)
> +
> +/* SE_UART_RX_TRANS_CFG */
> +#define UART_RX_INS_STATUS_BIT BIT(2)
> +#define UART_RX_PAR_EN         BIT(3)
> +
> +/* SE_UART_RX_WORD_LEN */
> +#define RX_WORD_LEN_MASK       GENMASK(9, 0)
> +
> +/* SE_UART_RX_STALE_CNT */
> +#define RX_STALE_CNT           GENMASK(23, 0)
> +
> +/* SE_UART_TX_PARITY_CFG/RX_PARITY_CFG */
> +#define PAR_CALC_EN            BIT(0)
> +#define PAR_MODE_MSK           GENMASK(2, 1)
> +#define PAR_MODE_SHFT          1
> +#define PAR_EVEN               0x00
> +#define PAR_ODD                        0x01
> +#define PAR_SPACE              0x10
> +#define PAR_MARK               0x11
> +
> +/* UART M_CMD OP codes */
> +#define UART_START_TX          0x1
> +#define UART_START_BREAK       0x4
> +#define UART_STOP_BREAK                0x5
> +/* UART S_CMD OP codes */
> +#define UART_START_READ                0x1
> +#define UART_PARAM             0x1
> +
> +#define UART_OVERSAMPLING      32
> +#define STALE_TIMEOUT          16
> +#define DEFAULT_BITS_PER_CHAR  10
> +#define GENI_UART_CONS_PORTS   1
> +#define DEF_FIFO_DEPTH_WORDS   16
> +#define DEF_TX_WM              2
> +#define DEF_FIFO_WIDTH_BITS    32
> +#define UART_CONSOLE_RX_WM     2
> +
> +#ifdef CONFIG_CONSOLE_POLL
> +#define RX_BYTES_PW 1
> +#else
> +#define RX_BYTES_PW 4
> +#endif

This seems fishy to me. Does either setting work? If so, why not just
have one value?

> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> +                               int offset, int bit_field, bool set)
> +{
> +       u32 reg;
> +       struct qcom_geni_serial_port *port;
> +       unsigned int baud;
> +       unsigned int fifo_bits;
> +       unsigned long timeout_us = 20000;
> +
> +       /* Ensure polling is not re-ordered before the prior writes/reads */
> +       mb();
> +
> +       if (uport->private_data) {
> +               port = to_dev_port(uport, uport);
> +               baud = port->cur_baud;
> +               if (!baud)
> +                       baud = 115200;
> +               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> +               /*
> +                * Total polling iterations based on FIFO worth of bytes to be
> +                * sent at current baud .Add a little fluff to the wait.
> +                */
> +               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;

This fluff is a little mysterious, can it be explained at all? Do you
think the fluff factor is in units of time (as you have it) or bits?
Time makes sense I guess if we're worried about clock source
differences.

> +
> +static void qcom_geni_serial_console_write(struct console *co, const char *s,
> +                             unsigned int count)
> +{
> +       struct uart_port *uport;
> +       struct qcom_geni_serial_port *port;
> +       bool locked = true;
> +       unsigned long flags;
> +
> +       WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
> +
> +       port = get_port_from_line(co->index);
> +       if (IS_ERR(port))
> +               return;
> +
> +       uport = &port->uport;
> +       if (oops_in_progress)
> +               locked = spin_trylock_irqsave(&uport->lock, flags);
> +       else
> +               spin_lock_irqsave(&uport->lock, flags);
> +
> +       if (locked) {
> +               __qcom_geni_serial_console_write(uport, s, count);
> +               spin_unlock_irqrestore(&uport->lock, flags);

I too am a little lost on the locking here. What exactly is the lock
protecting? Looks like for the most part it's trying to synchronize
with the ISR? What specifically in the ISR? I just wanted to go
through and check to make sure whatever the shared resource is is
appropriately protected.

> +       }
> +}
> +
> +static int handle_rx_console(struct uart_port *uport, u32 rx_bytes, bool drop)
> +{
> +       u32 i = rx_bytes;
> +       u32 rx_fifo;
> +       unsigned char *buf;
> +       struct tty_port *tport;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +
> +       tport = &uport->state->port;
> +       while (i > 0) {
> +               int c;
> +               int bytes = i > port->rx_bytes_pw ? port->rx_bytes_pw : i;

Please replace this with a min macro.

> +static int qcom_geni_serial_handle_tx(struct uart_port *uport)
> +{
> +       int ret = 0;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +       struct circ_buf *xmit = &uport->state->xmit;
> +       size_t avail;
> +       size_t remaining;
> +       int i = 0;
> +       u32 status;
> +       unsigned int chunk;
> +       int tail;
> +
> +       chunk = uart_circ_chars_pending(xmit);
> +       status = readl_relaxed(uport->membase + SE_GENI_TX_FIFO_STATUS);
> +       /* Both FIFO and framework buffer are drained */
> +       if ((chunk == port->xmit_size) && !status) {
> +               port->xmit_size = 0;
> +               uart_circ_clear(xmit);
> +               qcom_geni_serial_stop_tx(uport);
> +               goto out_write_wakeup;
> +       }
> +       chunk -= port->xmit_size;
> +
> +       avail = (port->tx_fifo_depth - port->tx_wm) * port->tx_bytes_pw;
> +       tail = (xmit->tail + port->xmit_size) & (UART_XMIT_SIZE - 1);
> +       if (chunk > (UART_XMIT_SIZE - tail))
> +               chunk = UART_XMIT_SIZE - tail;
> +       if (chunk > avail)
> +               chunk = avail;
> +
> +       if (!chunk)
> +               goto out_write_wakeup;
> +
> +       qcom_geni_serial_setup_tx(uport, chunk);
> +
> +       remaining = chunk;
> +       while (i < chunk) {
> +               unsigned int tx_bytes;
> +               unsigned int buf = 0;
> +               int c;
> +
> +               tx_bytes = min_t(size_t, remaining, (size_t)port->tx_bytes_pw);
> +               for (c = 0; c < tx_bytes ; c++)
> +                       buf |= (xmit->buf[tail + c] << (c * BITS_PER_BYTE));
> +
> +               writel_relaxed(buf, uport->membase + SE_GENI_TX_FIFOn);
> +
> +               i += tx_bytes;
> +               tail = (tail + tx_bytes) & (UART_XMIT_SIZE - 1);
> +               uport->icount.tx += tx_bytes;
> +               remaining -= tx_bytes;
> +       }
> +       qcom_geni_serial_poll_tx_done(uport);
> +       port->xmit_size += chunk;
> +out_write_wakeup:
> +       uart_write_wakeup(uport);
> +       return ret;
> +}

This function can't fail, please change the return type to void.

> +
> +static void qcom_geni_serial_shutdown(struct uart_port *uport)
> +{
> +       unsigned long flags;
> +
> +       /* Stop the console before stopping the current tx */
> +       console_stop(uport->cons);
> +
> +       disable_irq(uport->irq);
> +       free_irq(uport->irq, uport);
> +       spin_lock_irqsave(&uport->lock, flags);
> +       qcom_geni_serial_stop_tx(uport);
> +       qcom_geni_serial_stop_rx(uport);
> +       spin_unlock_irqrestore(&uport->lock, flags);

This is one part of where I'm confused. What are we protecting here
with the lock? disable_irq waits for any pending ISRs to finish
according to its comment, so you know you're not racing with the ISR.

> +static void geni_serial_write_term_regs(struct uart_port *uport,
> +               u32 tx_trans_cfg, u32 tx_parity_cfg, u32 rx_trans_cfg,
> +               u32 rx_parity_cfg, u32 bits_per_char, u32 stop_bit_len,
> +               u32 s_clk_cfg)
> +{
> +       writel_relaxed(tx_trans_cfg, uport->membase + SE_UART_TX_TRANS_CFG);
> +       writel_relaxed(tx_parity_cfg, uport->membase + SE_UART_TX_PARITY_CFG);
> +       writel_relaxed(rx_trans_cfg, uport->membase + SE_UART_RX_TRANS_CFG);
> +       writel_relaxed(rx_parity_cfg, uport->membase + SE_UART_RX_PARITY_CFG);
> +       writel_relaxed(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
> +       writel_relaxed(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
> +       writel_relaxed(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
> +       writel_relaxed(s_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
> +       writel_relaxed(s_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
> +}
> +

I agree with Stephen's comment, this should be inlined into the single
place it's called from.

Thanks Karthik!
-Evan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
