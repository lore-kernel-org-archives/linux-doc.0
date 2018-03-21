Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CC7027D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 17:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751550AbeCURUE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 13:20:04 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:44944 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751604AbeCURUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 13:20:02 -0400
Received: by mail-pl0-f65.google.com with SMTP id 9-v6so3520522ple.11
        for <linux-doc@vger.kernel.org>; Wed, 21 Mar 2018 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=TXuvjaEd8eh2mE/1uMptFenDJ7vLMIxidZhYtij08Dw=;
        b=AGbVY1JemzLZA/0PSE5OPNtRTEpnVP+1+h4+pHPVyi+Q3jEiCbFhWzMsNeBxAsnPFv
         vHAIVuGCs+Y5li5kmL5Nk/7y9It340eV68xF7pS16dgQ6wqmLtx0uCpqFUYtTDfrWJMo
         b213IvCop/9hb48MCC/1Xsxx1ezUNkp3ToIKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=TXuvjaEd8eh2mE/1uMptFenDJ7vLMIxidZhYtij08Dw=;
        b=N9x9Yhx+WJgySWK8vh50jFb0lmdwhfGGvVJwKUusaRBNFQ4SqIW5mDQ9o5czBqHsT7
         Lgq5x4k/kUQQqM/arGudEHrNI9BOe1Jx0lFrcgm+5MjzDXvyxu2cJWwWfAKGl5jZJ4JP
         aQuRuWkFLdaxbN+2Afd638XKfvauetSNRL97oexGO9d9C2z5tE5415AHaHZcxaFzZQiD
         3v9Uj297pA2KjKzAK8hcSC5ZumcnxsTGutEPsWbGGacbPDA2kLhIrS2EdJVrL9RNC10D
         j70B97Wfegz8nRiV90haq88/udXSSNGnVZ9gTAOJDA6K8PQohMnJM1KfyF5dwAk3jR61
         tu7Q==
X-Gm-Message-State: AElRT7G3GzRKfwWAt10EoroEBhfPkEJLsySMrQL4MT3PMmNzMAE5iZr4
        VH2kO889JX9iu8Mt/mkavqDGwA==
X-Google-Smtp-Source: AG47ELu/TYz+/sgOeiLGa612o9Y9tYg0lnYCok0jqqsoMLLEcqI6g6X+6mZzsYx98lJWicPKJi6yvw==
X-Received: by 2002:a17:902:bc41:: with SMTP id t1-v6mr21285349plz.56.1521652801816;
        Wed, 21 Mar 2018 10:20:01 -0700 (PDT)
Received: from localhost ([2620:0:1000:1511:d30e:62c6:f82c:ff40])
        by smtp.gmail.com with ESMTPSA id y18sm8881971pfe.67.2018.03.21.10.20.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Mar 2018 10:20:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Karthik Ramasubramanian <kramasub@codeaurora.org>,
        andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <23359b7c-6760-9cca-4c99-b08b3e79fa7a@codeaurora.org>
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Doug Anderson <dianders@google.com>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
 <152156025613.254778.431774948232120027@swboyd.mtv.corp.google.com>
 <23359b7c-6760-9cca-4c99-b08b3e79fa7a@codeaurora.org>
Message-ID: <152165280040.91116.1976061062009791598@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver support
 for GENI based QUP
Date:   Wed, 21 Mar 2018 10:20:00 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Karthik Ramasubramanian (2018-03-20 15:53:25)
> =

> =

> On 3/20/2018 9:37 AM, Stephen Boyd wrote:
> > Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:49)
> >> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/seria=
l/qcom_geni_serial.c
> >> new file mode 100644
> >> index 0000000..1442777
> >> --- /dev/null
> >> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >> @@ -0,0 +1,1158 @@
> >> +
> >> +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> >> +static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
> >> +{
> >> +       writel_relaxed(ch, uport->membase + SE_GENI_TX_FIFOn);
> > =

> > Does this expect the whole word to have data to write? Or does the FIFO
> > output a character followed by three NUL bytes each time it gets
> > written? The way that uart_console_write() works is to take each
> > character a byte at a time, put it into an int (so extend that byte with
> > zero) and then pass it to the putchar function. I would expect that at
> > this point the hardware sees the single character and then 3 NULs enter
> > the FIFO each time.
> > =

> > For previous MSM uarts I had to handle this oddity by packing the words
> > into the fifo four at a time. You may need to do the same here.
> The packing configuration 1 * 8 (done using geni_se_config_packing)
> ensures that only one byte per FIFO word needs to be transmitted. From
> that perspective, we need not have such oddity.

Ok! That's good to hear.

> > =

> > Can you also support the OF_EARLYCON_DECLARE method of console writing
> > so we can get an early printk style debug console?
> Do you prefer that as part of this patch itself or is it ok if I upload
> the earlycon support once this gets merged.

I think this already got merged? So just split it out into another patch
would be fine. I see the config is already selecting the earlycon
support so it must be planned.

> > =

> > =

> >> +
> >> +       spin_lock_irqsave(&uport->lock, flags);
> >> +       m_irq_status =3D readl_relaxed(uport->membase + SE_GENI_M_IRQ_=
STATUS);
> >> +       s_irq_status =3D readl_relaxed(uport->membase + SE_GENI_S_IRQ_=
STATUS);
> >> +       m_irq_en =3D readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> >> +       writel_relaxed(m_irq_status, uport->membase + SE_GENI_M_IRQ_CL=
EAR);
> >> +       writel_relaxed(s_irq_status, uport->membase + SE_GENI_S_IRQ_CL=
EAR);
> >> +
> >> +       if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
> >> +               goto out_unlock;
> >> +
> >> +       if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
> >> +               uport->icount.overrun++;
> >> +               tty_insert_flip_char(tport, 0, TTY_OVERRUN);
> >> +       }
> >> +
> >> +       if (m_irq_status & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN) &&
> >> +           m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
> >> +               qcom_geni_serial_handle_tx(uport);
> >> +
> >> +       if (s_irq_status & S_GP_IRQ_0_EN || s_irq_status & S_GP_IRQ_1_=
EN) {
> >> +               if (s_irq_status & S_GP_IRQ_0_EN)
> >> +                       uport->icount.parity++;
> >> +               drop_rx =3D true;
> >> +       } else if (s_irq_status & S_GP_IRQ_2_EN ||
> >> +                                       s_irq_status & S_GP_IRQ_3_EN) {
> >> +               uport->icount.brk++;
> > =

> > Maybe move this stat accounting to the place where brk is handled?
> Since other error accounting like overrun, parity are happening here, it
> feels logical to keep that accounting here.

Alright.

> >> +       return uart_add_one_port(&qcom_geni_console_driver, uport);
> >> +}
> >> +
> >> +static int qcom_geni_serial_remove(struct platform_device *pdev)
> >> +{
> >> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pd=
ev);
> >> +       struct uart_driver *drv =3D port->uport.private_data;
> >> +
> >> +       uart_remove_one_port(drv, &port->uport);
> >> +       return 0;
> >> +}
> >> +
> >> +static int __maybe_unused qcom_geni_serial_sys_suspend_noirq(struct d=
evice *dev)
> >> +{
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pd=
ev);
> >> +       struct uart_port *uport =3D &port->uport;
> >> +
> >> +       uart_suspend_port(uport->private_data, uport);
> >> +       return 0;
> >> +}
> >> +
> >> +static int __maybe_unused qcom_geni_serial_sys_resume_noirq(struct de=
vice *dev)
> >> +{
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pd=
ev);
> >> +       struct uart_port *uport =3D &port->uport;
> >> +
> >> +       if (console_suspend_enabled && uport->suspended) {
> >> +               uart_resume_port(uport->private_data, uport);
> >> +               disable_irq(uport->irq);
> > =

> > I missed the enable_irq() part. Is this still necessary?
> Suspending the uart console port invokes the uart port shutdown
> operation. The shutdown operation disables and frees the concerned IRQ.
> Resuming the uart console port invokes the uart port startup operation
> which requests for the IRQ. The request_irq operation auto-enables the
> IRQ. In addition, resume_noirq implicitly enables the IRQ. This leads to
> an unbalanced IRQ enable warning.
> =

> This disable_irq() helps with suppressing that warning.

That's not obvious so we need a big comment here.

I thought we would move this to the normal suspend/resume callbacks and
skip the noirq variants. That would make this disable_irq() unnecessary
then?

BTW, free_irq() should disable the irq itself, so it looks odd to have a
disable_irq() followed directly by a free_irq().

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
