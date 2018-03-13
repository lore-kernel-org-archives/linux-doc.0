Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2D1697E6A4
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 20:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752479AbeCMUQq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 16:16:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33844 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbeCMUQo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Mar 2018 16:16:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0EE3860851; Tue, 13 Mar 2018 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520972204;
        bh=D0aVLq50LSyRPyl8jtbkXSzOPset691QDKNr/ONsmTU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LtaF/8DcpTTdRFCwRpe47Sye9H4MgAhK/3D1Mx1GyI+M346anehZaAvyxwOdKyGap
         /7rABvVSGcB/vKgQ3CK+4LC1zaPI1WY98XXYVSxtQhq6/MUec4WM6DwKgV6In8fGG5
         Rm1OdcK5s7UN8ZPX2qhh7QrxTUofCmvT2s+NoQh0=
Received: from [10.226.60.63] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 207B5605FB;
        Tue, 13 Mar 2018 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520972202;
        bh=D0aVLq50LSyRPyl8jtbkXSzOPset691QDKNr/ONsmTU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T1/zkbMxHtMMj0Pwki0tRA2Feh2WyjYzfytApR1nBa0JbghBBc3C3MgtwCsHVQVhB
         HdzqHdaKVYfLUt/mV5jfIY7mlSh9sZw/6l8KNpRyqilq08MdouWbM6RRKnnngAaHhq
         PGVPA2Oc3O2WdPcKpSD33mhLYpvpm5+TwCk9T7u4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 207B5605FB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
To:     Evan Green <evgreen@chromium.org>
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
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
 <CAE=gft4Hwqq2gx+b9AmiX1ZZBrSt1Ca2E48JV77wpcQQT0060w@mail.gmail.com>
From:   Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <9a12ffe5-5168-8d73-82c9-93914c50de51@codeaurora.org>
Date:   Tue, 13 Mar 2018 14:16:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft4Hwqq2gx+b9AmiX1ZZBrSt1Ca2E48JV77wpcQQT0060w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/2/2018 5:11 PM, Evan Green wrote:
>> +
>> +#ifdef CONFIG_CONSOLE_POLL
>> +#define RX_BYTES_PW 1
>> +#else
>> +#define RX_BYTES_PW 4
>> +#endif
> 
> This seems fishy to me. Does either setting work? If so, why not just
> have one value?
Yes, either one works. In the interrupt driven mode, sometimes due to
increased interrupt latency the RX FIFO may overflow if we use only 1
byte per FIFO word - given there are no flow control lines in the debug
uart. Hence using 4 bytes in the FIFO word will help to prevent the FIFO
overflow - especially in the case where commands are executed through
scripts.

In polling mode, using 1 byte per word helps to use the hardware to
buffer the data instead of software buffering especially when the
framework keeps reading one byte at a time.
> 
>> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>> +                               int offset, int bit_field, bool set)
>> +{
>> +       u32 reg;
>> +       struct qcom_geni_serial_port *port;
>> +       unsigned int baud;
>> +       unsigned int fifo_bits;
>> +       unsigned long timeout_us = 20000;
>> +
>> +       /* Ensure polling is not re-ordered before the prior writes/reads */
>> +       mb();
>> +
>> +       if (uport->private_data) {
>> +               port = to_dev_port(uport, uport);
>> +               baud = port->cur_baud;
>> +               if (!baud)
>> +                       baud = 115200;
>> +               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
>> +               /*
>> +                * Total polling iterations based on FIFO worth of bytes to be
>> +                * sent at current baud .Add a little fluff to the wait.
>> +                */
>> +               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> 
> This fluff is a little mysterious, can it be explained at all? Do you
> think the fluff factor is in units of time (as you have it) or bits?
> Time makes sense I guess if we're worried about clock source
> differences.
The fluff is in micro-seconds and can help with unforeseen delays in
emulation platforms.
> 
>> +
>> +static void qcom_geni_serial_console_write(struct console *co, const char *s,
>> +                             unsigned int count)
>> +{
>> +       struct uart_port *uport;
>> +       struct qcom_geni_serial_port *port;
>> +       bool locked = true;
>> +       unsigned long flags;
>> +
>> +       WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
>> +
>> +       port = get_port_from_line(co->index);
>> +       if (IS_ERR(port))
>> +               return;
>> +
>> +       uport = &port->uport;
>> +       if (oops_in_progress)
>> +               locked = spin_trylock_irqsave(&uport->lock, flags);
>> +       else
>> +               spin_lock_irqsave(&uport->lock, flags);
>> +
>> +       if (locked) {
>> +               __qcom_geni_serial_console_write(uport, s, count);
>> +               spin_unlock_irqrestore(&uport->lock, flags);
> 
> I too am a little lost on the locking here. What exactly is the lock
> protecting? Looks like for the most part it's trying to synchronize
> with the ISR? What specifically in the ISR? I just wanted to go
> through and check to make sure whatever the shared resource is is
> appropriately protected.
The lock protects 2 simultaneous writers from putting the hardware in
the bad state. The output of the command entered in a shell can trigger
a write in the interrupt context while logging activity can trigger a
simultaneous write.
> 
>> +       }
>> +}
>> +
>> +static int handle_rx_console(struct uart_port *uport, u32 rx_bytes, bool drop)
>> +{
>> +       u32 i = rx_bytes;
>> +       u32 rx_fifo;
>> +       unsigned char *buf;
>> +       struct tty_port *tport;
>> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>> +
>> +       tport = &uport->state->port;
>> +       while (i > 0) {
>> +               int c;
>> +               int bytes = i > port->rx_bytes_pw ? port->rx_bytes_pw : i;
> 
> Please replace this with a min macro.
Ok.
> 
>> +static int qcom_geni_serial_handle_tx(struct uart_port *uport)
>> +{
>> +       int ret = 0;
>> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>> +       struct circ_buf *xmit = &uport->state->xmit;
>> +       size_t avail;
>> +       size_t remaining;
>> +       int i = 0;
>> +       u32 status;
>> +       unsigned int chunk;
>> +       int tail;
>> +
>> +       chunk = uart_circ_chars_pending(xmit);
>> +       status = readl_relaxed(uport->membase + SE_GENI_TX_FIFO_STATUS);
>> +       /* Both FIFO and framework buffer are drained */
>> +       if ((chunk == port->xmit_size) && !status) {
>> +               port->xmit_size = 0;
>> +               uart_circ_clear(xmit);
>> +               qcom_geni_serial_stop_tx(uport);
>> +               goto out_write_wakeup;
>> +       }
>> +       chunk -= port->xmit_size;
>> +
>> +       avail = (port->tx_fifo_depth - port->tx_wm) * port->tx_bytes_pw;
>> +       tail = (xmit->tail + port->xmit_size) & (UART_XMIT_SIZE - 1);
>> +       if (chunk > (UART_XMIT_SIZE - tail))
>> +               chunk = UART_XMIT_SIZE - tail;
>> +       if (chunk > avail)
>> +               chunk = avail;
>> +
>> +       if (!chunk)
>> +               goto out_write_wakeup;
>> +
>> +       qcom_geni_serial_setup_tx(uport, chunk);
>> +
>> +       remaining = chunk;
>> +       while (i < chunk) {
>> +               unsigned int tx_bytes;
>> +               unsigned int buf = 0;
>> +               int c;
>> +
>> +               tx_bytes = min_t(size_t, remaining, (size_t)port->tx_bytes_pw);
>> +               for (c = 0; c < tx_bytes ; c++)
>> +                       buf |= (xmit->buf[tail + c] << (c * BITS_PER_BYTE));
>> +
>> +               writel_relaxed(buf, uport->membase + SE_GENI_TX_FIFOn);
>> +
>> +               i += tx_bytes;
>> +               tail = (tail + tx_bytes) & (UART_XMIT_SIZE - 1);
>> +               uport->icount.tx += tx_bytes;
>> +               remaining -= tx_bytes;
>> +       }
>> +       qcom_geni_serial_poll_tx_done(uport);
>> +       port->xmit_size += chunk;
>> +out_write_wakeup:
>> +       uart_write_wakeup(uport);
>> +       return ret;
>> +}
> 
> This function can't fail, please change the return type to void.
Ok.
> 
>> +
>> +static void qcom_geni_serial_shutdown(struct uart_port *uport)
>> +{
>> +       unsigned long flags;
>> +
>> +       /* Stop the console before stopping the current tx */
>> +       console_stop(uport->cons);
>> +
>> +       disable_irq(uport->irq);
>> +       free_irq(uport->irq, uport);
>> +       spin_lock_irqsave(&uport->lock, flags);
>> +       qcom_geni_serial_stop_tx(uport);
>> +       qcom_geni_serial_stop_rx(uport);
>> +       spin_unlock_irqrestore(&uport->lock, flags);
> 
> This is one part of where I'm confused. What are we protecting here
> with the lock? disable_irq waits for any pending ISRs to finish
> according to its comment, so you know you're not racing with the ISR.
In android, console shutdown can be invoked while console write happens.
This lock prevents shutdown from not interfering with the write and
vice-versa.
> 
>> +static void geni_serial_write_term_regs(struct uart_port *uport,
>> +               u32 tx_trans_cfg, u32 tx_parity_cfg, u32 rx_trans_cfg,
>> +               u32 rx_parity_cfg, u32 bits_per_char, u32 stop_bit_len,
>> +               u32 s_clk_cfg)
>> +{
>> +       writel_relaxed(tx_trans_cfg, uport->membase + SE_UART_TX_TRANS_CFG);
>> +       writel_relaxed(tx_parity_cfg, uport->membase + SE_UART_TX_PARITY_CFG);
>> +       writel_relaxed(rx_trans_cfg, uport->membase + SE_UART_RX_TRANS_CFG);
>> +       writel_relaxed(rx_parity_cfg, uport->membase + SE_UART_RX_PARITY_CFG);
>> +       writel_relaxed(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
>> +       writel_relaxed(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
>> +       writel_relaxed(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
>> +       writel_relaxed(s_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
>> +       writel_relaxed(s_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
>> +}
>> +
> 
> I agree with Stephen's comment, this should be inlined into the single
> place it's called from.
> 
> Thanks Karthik!
> -Evan
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
