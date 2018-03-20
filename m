Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 472C57D0F4
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 18:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751531AbeCTSj7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 14:39:59 -0400
Received: from mail-oi0-f50.google.com ([209.85.218.50]:45493 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751186AbeCTSj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 14:39:58 -0400
Received: by mail-oi0-f50.google.com with SMTP id 71-v6so2215904oie.12
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eKUSej+Midi7lbYvKopthhCcqFlsGQWwrJ+s0/fHNcc=;
        b=Z80LJZMb0grKt2cCatlUfn+2TS/hWH6yah/e+q8SxZ6amVB5RV6f74qmu4DrSDeF/x
         kgWKTcAQVnwC4/OcNDOTkQBKvLcSwzv4pPgSNuiWHW14FVock+A0SswU4hMZWu7k9iGu
         Nh02b4gZLFq/651K8oF+wjwznbMHjwPFttD/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eKUSej+Midi7lbYvKopthhCcqFlsGQWwrJ+s0/fHNcc=;
        b=Q6qfC+2C7FQlZMBuv4QevbK9wDdOoKmuYoW5HId4queKgHZ2m0bTL0tRRCd8RVW7M2
         CjzeWJ6s2svFYRZUv/9RjXl0BuSOqBnJmn0Hvdmc1n+oNuDbLhfu0vxfylcC2TKtyKca
         HWqqu7CF0AKi8E+C5E1wmEbmIH+USCuZLW2zIm1fkG28BLhvbA8NW7BGQnOeAxfRNQBX
         Jh2PEdMbOh6o1IlQwCmLT6IM1xmnXk2UMS5j5f5mg655af0nYKJsz+33avjyZpT/Ph2v
         Mw3W3nk2PE4Uo+DfHKa9qZhJDUxo8J52BLjVs1HwnEWOMvA78l9GmbxY2v/0fhTJZtQo
         GqvQ==
X-Gm-Message-State: AElRT7HqJKwgyJ1L/5pBpw7jYHttyIhq75sCiqljV1YF37S7a3lqCihd
        QN8fkqJiKqe4Hohpp7yOYIEHJTgLhio=
X-Google-Smtp-Source: AG47ELsUVX/L2L3wJyx2QkODT2R0ZtK8g37ozGStfHankEJ/Ysv35QkZazpfKYKwSNnMhob3vwHiGw==
X-Received: by 10.202.19.5 with SMTP id e5mr3509965oii.179.1521571197014;
        Tue, 20 Mar 2018 11:39:57 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 62sm1212926oih.21.2018.03.20.11.39.54
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 11:39:55 -0700 (PDT)
Received: by mail-oi0-f44.google.com with SMTP id g5-v6so2224615oiy.8
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 11:39:54 -0700 (PDT)
X-Received: by 10.202.23.15 with SMTP id j15mr3083708oii.266.1521571194236;
 Tue, 20 Mar 2018 11:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org> <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
In-Reply-To: <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 20 Mar 2018 18:39:18 +0000
X-Gmail-Original-Message-ID: <CAE=gft7QAE0+3YpLu9BL2uvN=A0YgF=Xp2ocmbX=pvwszWtZew@mail.gmail.com>
Message-ID: <CAE=gft7QAE0+3YpLu9BL2uvN=A0YgF=Xp2ocmbX=pvwszWtZew@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, wsa@the-dreams.de,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, acourbot@chromium.org, swboyd@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Karthik,

On Wed, Mar 14, 2018 at 4:59 PM Karthikeyan Ramasubramanian <
kramasub@codeaurora.org> wrote:

> +
> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> +                               int offset, int field, bool set)
> +{
> +       u32 reg;
> +       struct qcom_geni_serial_port *port;
> +       unsigned int baud;
> +       unsigned int fifo_bits;
> +       unsigned long timeout_us = 20000;
> +
> +       /* Ensure polling is not re-ordered before the prior writes/reads
*/
> +       mb();

These barriers sprinkled around everywhere are new. Did
you find that you needed them for something? In this case, the
readl_poll_timeout_atomic should already have a read barrier (nor do you
probably care about read reordering, right?) Perhaps this should
only be a mmiowb rather than a full barrier, because you really just want
to say "make sure all my old writes got out to hardware before spinning"

> +
> +       if (uport->private_data) {
> +               port = to_dev_port(uport, uport);
> +               baud = port->baud;
> +               if (!baud)
> +                       baud = 115200;
> +               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> +               /*
> +                * Total polling iterations based on FIFO worth of bytes
to be
> +                * sent at current baud. Add a little fluff to the wait.
> +                */
> +               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> +       }
> +
> +       return !readl_poll_timeout_atomic(uport->membase + offset, reg,
> +                        (bool)(reg & field) == set, 10, timeout_us);
> +}
[...]
> +
> +static void qcom_geni_serial_start_tx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +       u32 status;
> +
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +               if (status & M_GENI_CMD_ACTIVE)
> +                       return;
> +
> +               if (!qcom_geni_serial_tx_empty(uport))
> +                       return;
> +
> +               /*
> +                * Ensure writing to IRQ_EN & watermark registers are not
> +                * re-ordered before checking the status of the Serial
> +                * Engine and TX FIFO
> +                */
> +               mb();

Here's another one. You should just be able to use a regular readl when
reading SE_GENI_STATUS and remove this barrier, since readl has an rmb
which orders your read of M_IRQ_EN below. I don't think you need to worry
about the writes below going above the read above, since there's logic in
between that needs the result of the read. Maybe that also saves you in the
read case, too. Either way, this barrier seems heavy handed.

> +
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +               irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
> +
> +               writel_relaxed(port->tx_wm, uport->membase +
> +                                               SE_GENI_TX_WATERMARK_REG);
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       }
> +}
> +
> +static void qcom_geni_serial_stop_tx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       u32 status;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +
> +       irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +       irq_en &= ~M_CMD_DONE_EN;
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               irq_en &= ~M_TX_FIFO_WATERMARK_EN;
> +               writel_relaxed(0, uport->membase +
> +                                    SE_GENI_TX_WATERMARK_REG);
> +       }
> +       port->xmit_size = 0;
> +       writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       /* Possible stop tx is called multiple times. */
> +       if (!(status & M_GENI_CMD_ACTIVE))
> +               return;
> +
> +       /*
> +        * Ensure cancel command write is not re-ordered before checking
> +        * the status of the Primary Sequencer.
> +        */
> +       mb();

I don't see how what's stated in your comment could happen, as that would
be a logic error. This barrier seems unneeded to me.

> +
> +       geni_se_cancel_m_cmd(&port->se);
> +       if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> +                                               M_CMD_CANCEL_EN, true)) {
> +               geni_se_abort_m_cmd(&port->se);
> +               qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> +                                               M_CMD_ABORT_EN, true);
> +               writel_relaxed(M_CMD_ABORT_EN, uport->membase +
> +
SE_GENI_M_IRQ_CLEAR);
> +       }
> +       writel_relaxed(M_CMD_CANCEL_EN, uport->membase +
SE_GENI_M_IRQ_CLEAR);
> +}
> +
> +static void qcom_geni_serial_start_rx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       u32 status;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       if (status & S_GENI_CMD_ACTIVE)
> +               qcom_geni_serial_stop_rx(uport);
> +
> +       /*
> +        * Ensure setup command write is not re-ordered before checking
> +        * the status of the Secondary Sequencer.
> +        */
> +       mb();

Also here, I think the reordering you're worried about would mean the CPU
is executing incorrectly.

> +
> +       geni_se_setup_s_cmd(&port->se, UART_START_READ, 0);
> +
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_S_IRQ_EN);
> +               irq_en |= S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_S_IRQ_EN);
> +
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +               irq_en |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       }
> +}
> +
> +static void qcom_geni_serial_stop_rx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       u32 status;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +       u32 irq_clear = S_CMD_DONE_EN;
> +
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_S_IRQ_EN);
> +               irq_en &= ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_S_IRQ_EN);
> +
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +               irq_en &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       }
> +
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       /* Possible stop rx is called multiple times. */
> +       if (!(status & S_GENI_CMD_ACTIVE))
> +               return;
> +
> +       /*
> +        * Ensure cancel command write is not re-ordered before checking
> +        * the status of the Secondary Sequencer.
> +        */
> +       mb();

Same deal here.

> +
> +       geni_se_cancel_s_cmd(&port->se);
> +       qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
> +                                       S_GENI_CMD_CANCEL, false);
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       writel_relaxed(irq_clear, uport->membase + SE_GENI_S_IRQ_CLEAR);
> +       if (status & S_GENI_CMD_ACTIVE)
> +               qcom_geni_serial_abort_rx(uport);
> +}
> +

Sorry gmail decided to wrap some of the context lines.
-Evan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
