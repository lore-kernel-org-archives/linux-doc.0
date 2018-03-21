Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EAFF7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 00:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751633AbeCUATc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 20:19:32 -0400
Received: from mail-ot0-f169.google.com ([74.125.82.169]:34088 "EHLO
        mail-ot0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbeCUATb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 20:19:31 -0400
Received: by mail-ot0-f169.google.com with SMTP id m7-v6so3830044otd.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 17:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gpqwx584Yb2RxVBSYdD1Ix1/s2bNYoNaiVxgpFPQrfs=;
        b=iBpKu2ts8um52jMkQakeJKBE2EKwfcf5S9UMnvj1b66eyWeJrI+I+9XswaHIioJJcX
         JUu65VoobAvTUFyE/2dCwxJCPlD0h9tUk6OCNturMyuU4xc0wNv2WzvxBAgImA3M0sQs
         +gE/S8mlL22dCLVhjocLrGuyTjLNEHWRXQEps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gpqwx584Yb2RxVBSYdD1Ix1/s2bNYoNaiVxgpFPQrfs=;
        b=PwBlKSCqCq3IHIBe0RaLrgyVURf9/MaSr1saeAGtjrNJyQVxiKs67wGW1VABfvEMIh
         mjxSyUsYwYfBhIJ8fQORCixEhkK4Xs65lQ6XrPDZlKTS/rF+oUQ9W9NEpaBWbstfL3mf
         AoDmuVvy+wxLxLWyFqMZvsDtdCHkagBO/EISWq5XtIrO5rP1Yr95j3RPB5TG1uA6/VJh
         ta1MbqXSKommwUNKhPVvg1iSWkJWfCzeMAvcxGsjyhocF/yNhZ44hMQPg5lt6requVbS
         IIXhNbZ72yvtwYlHp4syGfpG67eCJe3vBczYEN85LoKv1x31Yw+VC14alf4VA9QeV9s6
         IgGg==
X-Gm-Message-State: AElRT7F4FFIi3Y8TECZVG9Vi1FErHEMqbDTjtTx/D+yEFe0vpthG3yUP
        Wr4121RAkJSLjNn3QSscfqY0Imp3N6M=
X-Google-Smtp-Source: AG47ELtfQ7FJ1cXbovc42ZFnDEhtcKEiurhMLElFh2EmkBTyVY+4MBqzaaoqiLwFZMTPqJnRO/AxuA==
X-Received: by 2002:a9d:4d11:: with SMTP id n17-v6mr995074otf.31.1521591570537;
        Tue, 20 Mar 2018 17:19:30 -0700 (PDT)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id i83sm1621717oih.53.2018.03.20.17.19.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 17:19:29 -0700 (PDT)
Received: by mail-ot0-f174.google.com with SMTP id i28-v6so3816571otf.8
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 17:19:28 -0700 (PDT)
X-Received: by 2002:a9d:2c23:: with SMTP id f32-v6mr11013021otb.273.1521591567899;
 Tue, 20 Mar 2018 17:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
 <CAE=gft7QAE0+3YpLu9BL2uvN=A0YgF=Xp2ocmbX=pvwszWtZew@mail.gmail.com> <1fa9262a-28bf-8432-5672-4f8c09898493@codeaurora.org>
In-Reply-To: <1fa9262a-28bf-8432-5672-4f8c09898493@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 21 Mar 2018 00:18:52 +0000
X-Gmail-Original-Message-ID: <CAE=gft7x23Fc3OicbaaF6wGw-CjgnSDT53xnHmXEDoZmtW0_7Q@mail.gmail.com>
Message-ID: <CAE=gft7x23Fc3OicbaaF6wGw-CjgnSDT53xnHmXEDoZmtW0_7Q@mail.gmail.com>
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

On Tue, Mar 20, 2018 at 4:44 PM Karthik Ramasubramanian <
kramasub@codeaurora.org> wrote:



> On 3/20/2018 12:39 PM, Evan Green wrote:
> > Hi Karthik,
> >
> > On Wed, Mar 14, 2018 at 4:59 PM Karthikeyan Ramasubramanian <
> > kramasub@codeaurora.org> wrote:
> >
> >> +
> >> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> >> +                               int offset, int field, bool set)
> >> +{
> >> +       u32 reg;
> >> +       struct qcom_geni_serial_port *port;
> >> +       unsigned int baud;
> >> +       unsigned int fifo_bits;
> >> +       unsigned long timeout_us = 20000;
> >> +
> >> +       /* Ensure polling is not re-ordered before the prior
writes/reads
> > */
> >> +       mb();
> >
> > These barriers sprinkled around everywhere are new. Did
> > you find that you needed them for something? In this case, the
> > readl_poll_timeout_atomic should already have a read barrier (nor do you
> > probably care about read reordering, right?) Perhaps this should
> > only be a mmiowb rather than a full barrier, because you really just
want
> > to say "make sure all my old writes got out to hardware before spinning"
> These barriers have been there from v3. Regarding this barrier - since
> readl_poll_timeout_atomic has a read barrier, this one can be converted
> to just write barrier.

Thanks. I must have missed them in v3. Is that mmiowb that would go there,
or wmb? I'm unsure.

> >
> >> +
> >> +       if (uport->private_data) {
> >> +               port = to_dev_port(uport, uport);
> >> +               baud = port->baud;
> >> +               if (!baud)
> >> +                       baud = 115200;
> >> +               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> >> +               /*
> >> +                * Total polling iterations based on FIFO worth of
bytes
> > to be
> >> +                * sent at current baud. Add a little fluff to the
wait.
> >> +                */
> >> +               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> >> +       }
> >> +
> >> +       return !readl_poll_timeout_atomic(uport->membase + offset, reg,
> >> +                        (bool)(reg & field) == set, 10, timeout_us);
> >> +}
> > [...]
> >> +
> >> +static void qcom_geni_serial_start_tx(struct uart_port *uport)
> >> +{
> >> +       u32 irq_en;
> >> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> >> +       u32 status;
> >> +
> >> +       if (port->xfer_mode == GENI_SE_FIFO) {
> >> +               status = readl_relaxed(uport->membase +
SE_GENI_STATUS);
> >> +               if (status & M_GENI_CMD_ACTIVE)
> >> +                       return;
> >> +
> >> +               if (!qcom_geni_serial_tx_empty(uport))
> >> +                       return;
> >> +
> >> +               /*
> >> +                * Ensure writing to IRQ_EN & watermark registers are
not
> >> +                * re-ordered before checking the status of the Serial
> >> +                * Engine and TX FIFO
> >> +                */
> >> +               mb();
> >
> > Here's another one. You should just be able to use a regular readl when
> > reading SE_GENI_STATUS and remove this barrier, since readl has an rmb
> > which orders your read of M_IRQ_EN below. I don't think you need to
worry
> > about the writes below going above the read above, since there's logic
in
> > between that needs the result of the read. Maybe that also saves you in
the
> > read case, too. Either way, this barrier seems heavy handed.
> Write to the watermark register does not have any dependency on the
> reads. Hence it can be re-ordered. But writing to that register alone
> without enabling the watermark interrupt will not have any impact. From
> that perspective, using readl while checking the GENI_STATUS is
> sufficient to maintain the required order. I will put a comment
> regarding the use of readl so that the reason is not lost.

Yes, I see what you mean, and without the branch I'd agree. My thinking
though was that you have a branch between the read and writes. So to
determine whether or not to even execute the writes, you must have
successfully evaluated the read, since program flow depends on it. I will
admit this is where my barrier knowledge gets fuzzy. Can speculative
execution perform register writes? (ie if that branch was guessed wrong
before the read actually completes, and then the writes happen before the
read? That seems like it couldn't possibly happen, as it would result in
weird spurious speculative writes to registers. Perhaps the mapping bits
prevent this sort of thing...)

If what I've said makes any sort of sense, and you still want to keep the
barriers here and below, then I'll let it go.

> >
> >> +
> >> +               irq_en = readl_relaxed(uport->membase +
SE_GENI_M_IRQ_EN);
> >> +               irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
> >> +
> >> +               writel_relaxed(port->tx_wm, uport->membase +
> >> +
SE_GENI_TX_WATERMARK_REG);
> >> +               writel_relaxed(irq_en, uport->membase +
SE_GENI_M_IRQ_EN);
> >> +       }
> >> +}
> >> +
> >> +static void qcom_geni_serial_stop_tx(struct uart_port *uport)
> >> +{
> >> +       u32 irq_en;
> >> +       u32 status;
> >> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> >> +
> >> +       irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> >> +       irq_en &= ~M_CMD_DONE_EN;
> >> +       if (port->xfer_mode == GENI_SE_FIFO) {
> >> +               irq_en &= ~M_TX_FIFO_WATERMARK_EN;
> >> +               writel_relaxed(0, uport->membase +
> >> +                                    SE_GENI_TX_WATERMARK_REG);
> >> +       }
> >> +       port->xmit_size = 0;
> >> +       writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> >> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> >> +       /* Possible stop tx is called multiple times. */
> >> +       if (!(status & M_GENI_CMD_ACTIVE))
> >> +               return;
> >> +
> >> +       /*
> >> +        * Ensure cancel command write is not re-ordered before
checking
> >> +        * the status of the Primary Sequencer.
> >> +        */
> >> +       mb();
> >
> > I don't see how what's stated in your comment could happen, as that
would
> > be a logic error. This barrier seems unneeded to me.
> Issuing a cancel command to the primary sequencer, makes the primary
> sequencer to go to inactive state. Even though they are 2 different
> registers, writing to one register impacts the other. From that
> perspective, we want to ensure that the order is maintained. Else if the
> cancel command goes through and then the GENI_STATUS is read, it might
> say that the primary sequencer is not active and the function might
> return prematurely. Same argument applies for the below mentioned cases.
> >
> >> +
> >> +       geni_se_cancel_m_cmd(&port->se);
> >> +       if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> >> +                                               M_CMD_CANCEL_EN,
true)) {
> >> +               geni_se_abort_m_cmd(&port->se);
> >> +               qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> >> +                                               M_CMD_ABORT_EN, true);
> >> +               writel_relaxed(M_CMD_ABORT_EN, uport->membase +
> >> +
> > SE_GENI_M_IRQ_CLEAR);
> >> +       }
> >> +       writel_relaxed(M_CMD_CANCEL_EN, uport->membase +
> > SE_GENI_M_IRQ_CLEAR);
> >> +}
> >> +
> >> +static void qcom_geni_serial_start_rx(struct uart_port *uport)
> >> +{
> >> +       u32 irq_en;
> >> +       u32 status;
> >> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> >> +
> >> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> >> +       if (status & S_GENI_CMD_ACTIVE)
> >> +               qcom_geni_serial_stop_rx(uport);
> >> +
> >> +       /*
> >> +        * Ensure setup command write is not re-ordered before checking
> >> +        * the status of the Secondary Sequencer.
> >> +        */
> >> +       mb();
> >
> > Also here, I think the reordering you're worried about would mean the
CPU
> > is executing incorrectly.
> >
> >> +
> >> +       geni_se_setup_s_cmd(&port->se, UART_START_READ, 0);
> >> +
> >> +       if (port->xfer_mode == GENI_SE_FIFO) {
> >> +               irq_en = readl_relaxed(uport->membase +
SE_GENI_S_IRQ_EN);
> >> +               irq_en |= S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
> >> +               writel_relaxed(irq_en, uport->membase +
SE_GENI_S_IRQ_EN);
> >> +
> >> +               irq_en = readl_relaxed(uport->membase +
SE_GENI_M_IRQ_EN);
> >> +               irq_en |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
> >> +               writel_relaxed(irq_en, uport->membase +
SE_GENI_M_IRQ_EN);
> >> +       }
> >> +}
> >> +
> >> +static void qcom_geni_serial_stop_rx(struct uart_port *uport)
> >> +{
> >> +       u32 irq_en;
> >> +       u32 status;
> >> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> >> +       u32 irq_clear = S_CMD_DONE_EN;
> >> +
> >> +       if (port->xfer_mode == GENI_SE_FIFO) {
> >> +               irq_en = readl_relaxed(uport->membase +
SE_GENI_S_IRQ_EN);
> >> +               irq_en &= ~(S_RX_FIFO_WATERMARK_EN |
S_RX_FIFO_LAST_EN);
> >> +               writel_relaxed(irq_en, uport->membase +
SE_GENI_S_IRQ_EN);
> >> +
> >> +               irq_en = readl_relaxed(uport->membase +
SE_GENI_M_IRQ_EN);
> >> +               irq_en &= ~(M_RX_FIFO_WATERMARK_EN |
M_RX_FIFO_LAST_EN);
> >> +               writel_relaxed(irq_en, uport->membase +
SE_GENI_M_IRQ_EN);
> >> +       }
> >> +
> >> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> >> +       /* Possible stop rx is called multiple times. */
> >> +       if (!(status & S_GENI_CMD_ACTIVE))
> >> +               return;
> >> +
> >> +       /*
> >> +        * Ensure cancel command write is not re-ordered before
checking
> >> +        * the status of the Secondary Sequencer.
> >> +        */
> >> +       mb();
> >
> > Same deal here.
> >
> >> +
> >> +       geni_se_cancel_s_cmd(&port->se);
> >> +       qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
> >> +                                       S_GENI_CMD_CANCEL, false);
> >> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> >> +       writel_relaxed(irq_clear, uport->membase +
SE_GENI_S_IRQ_CLEAR);
> >> +       if (status & S_GENI_CMD_ACTIVE)
> >> +               qcom_geni_serial_abort_rx(uport);
> >> +}
> >> +
> >
> > Sorry gmail decided to wrap some of the context lines.
> > -Evan
> > --
> > To unsubscribe from this list: send the line "unsubscribe
linux-arm-msm" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> Regards,
> Karthik.
> --
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
