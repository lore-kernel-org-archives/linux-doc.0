Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6ABAC7E688
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 21:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753971AbeCFVpI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 16:45:08 -0500
Received: from mail-pg0-f44.google.com ([74.125.83.44]:44462 "EHLO
        mail-pg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753899AbeCFVpG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 16:45:06 -0500
Received: by mail-pg0-f44.google.com with SMTP id l4so50301pgp.11
        for <linux-doc@vger.kernel.org>; Tue, 06 Mar 2018 13:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=jR85DZcjdPYy33PWHK/JGva+4y33amwB1hGcnM+2NI8=;
        b=GGngKeoPQANSaAFo2IOcmp74sNuFX8VWzseeRG5mXIwitUAO4HFd9+NwwVlcSRb2kr
         PRef8VOZClXTCrp6S4QjJk/Ih0uLKQ9GaufwB8rrZeSIS6JqaTpvycIvMm/9JHFkC/0Q
         Yu8yavbP2K6ES+ikg73m+6NlXuDELg/zhs3pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=jR85DZcjdPYy33PWHK/JGva+4y33amwB1hGcnM+2NI8=;
        b=hm1qV5lVPqNOVPnM1MGV9azuj5kD7D8RlFo/DdVBXV/cNBXL/N+wBaDVB6pBKDh3+u
         TJWQLnJzxXXiTvRE9Cdi0Lc9qvQ0yn991FEGdOX7rrx6tlOWBgAiy6nc1k2JzdfLh/O/
         zbkeF7kiIsVLeyEaGYrkhntd68EPlVn0GruWLaJC3GNQ7FD1F2DXOzYjEBmFR5G5aKhv
         xlzsq8XaxwBMz2e64uFxYsqwVgsKYYhhLT8syy0LUxWkZWi21zYzMWeSl8Uv3MEmzFh/
         Tp1DppZ1I/1j+0DT+QkAsfFbbq3bWZeA097C1qaoFnrOcejX5r4Uv9flrLvV60Y3LU6n
         n1Yg==
X-Gm-Message-State: APf1xPD3BiTRWAxxa4+MD96F1T2X79rZZOyUDid2/DJEKe7m+AEfPTC0
        iFSkdIeIAvUA5c6aO33TVuvnCnI4rnw=
X-Google-Smtp-Source: AG47ELvh2QnlzPyIX0/6zkWj07DwqmV/RSGOyGoBSmJ592EepIkwmXrJuhaPEnG1pkAedOesvshgLQ==
X-Received: by 10.101.85.67 with SMTP id t3mr16427150pgr.310.1520372705903;
        Tue, 06 Mar 2018 13:45:05 -0800 (PST)
Received: from localhost ([2620:0:1000:1501:422f:ca5c:71a2:c3b3])
        by smtp.gmail.com with ESMTPSA id u10sm9078907pgr.83.2018.03.06.13.45.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Mar 2018 13:45:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Karthik Ramasubramanian <kramasub@codeaurora.org>,
        andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <f900dc96-0150-079d-bcd6-9d2e05f8fde1@codeaurora.org>
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Doug Anderson <dianders@google.com>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
 <152002870571.108663.443363731684218377@swboyd.mtv.corp.google.com>
 <f900dc96-0150-079d-bcd6-9d2e05f8fde1@codeaurora.org>
Message-ID: <152037270430.218381.11080419743809466427@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver support
 for GENI based QUP
Date:   Tue, 06 Mar 2018 13:45:04 -0800
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Karthik Ramasubramanian (2018-03-05 16:51:23)
> On 3/2/2018 3:11 PM, Stephen Boyd wrote:
> > Quoting Karthikeyan Ramasubramanian (2018-02-27 17:38:09)
> > =

> >> +               size_t chars_to_write =3D 0;
> >> +               size_t avail =3D DEF_FIFO_DEPTH_WORDS - DEF_TX_WM;
> >> +
> >> +               /*
> >> +                * If the WM bit never set, then the Tx state machine =
is not
> >> +                * in a valid state, so break, cancel/abort any existi=
ng
> >> +                * command. Unfortunately the current data being writt=
en is
> >> +                * lost.
> >> +                */
> >> +               while (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ=
_STATUS,
> >> +                                               M_TX_FIFO_WATERMARK_EN=
, true))
> > =

> > Does this ever timeout? So many nested while loops makes it hard to
> > follow.
> Yes. Based on the baud rate of 115200 and the FIFO Depth & Width of (16 =

> * 32), the poll should not take more than 5 ms under the timeout scenario.

Sure, but I'm asking if this has any sort of timeout associated with it.
It looks to be a while loop that could possibly go forever?

> >> +static void qcom_geni_serial_console_write(struct console *co, const =
char *s,
> >> +                             unsigned int count)
> >> +{
> >> +       struct uart_port *uport;
> >> +       struct qcom_geni_serial_port *port;
> >> +       bool locked =3D true;
> >> +       unsigned long flags;
> >> +
> >> +       WARN_ON(co->index < 0 || co->index >=3D GENI_UART_CONS_PORTS);
> >> +
> >> +       port =3D get_port_from_line(co->index);
> >> +       if (IS_ERR(port))
> >> +               return;
> >> +
> >> +       uport =3D &port->uport;
> >> +       if (oops_in_progress)
> >> +               locked =3D spin_trylock_irqsave(&uport->lock, flags);
> >> +       else
> >> +               spin_lock_irqsave(&uport->lock, flags);
> >> +
> >> +       if (locked) {
> >> +               __qcom_geni_serial_console_write(uport, s, count);
> > =

> > So if oops is in progress, and we didn't lock here, we don't output
> > data? I'd think we would always want to write to the fifo, just make the
> > lock grab/release conditional.
> If we fail to grab the lock, then there is another active writer. So =

> trying to write to the fifo will put the hardware in bad state because =

> writer has programmed the hardware to write 'x' number of words and this =

> thread will over-write it with 'y' number of words. Also the data that =

> you might see in the console might be garbled.

I suspect that because this is the serial console, and we want it to
always output stuff even when we're going down in flames, we may want to
ignore that case and just wait for the fifo to free up and then
overwrite the number of words that we want to output and push out more
characters.

I always get confused though because there seem to be lots of different
ways to do things in serial drivers and not too much clear documentation
that I've read describing what to do.

> > =

> >> +               spin_unlock_irqrestore(&uport->lock, flags);
> >> +       }
> >> +}
[...]
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

> > How does break character handling work? I see the accounting here, but
> > don't see any uart_handle_break() call anywhere.
> The reason it is not added is because the hardware does not indicate =

> when the break character occured. It can be any one of the FIFO words. =

> The statistics is updated to give an idea that the break happened. We =

> can add uart_handle_break() but it may not be at an accurate position =

> for the above mentioned reason.

Sounds like the previous uart design. We would want uart_handle_break()
support for kgdb to work over serial. Do we still get an interrupt
signal that a break character is somewhere in the fifo? If we get that,
then does it also put a NUL (0) character into the fifo that we can
find? I had to do something like that before, where we detect the irq
and then we go through the fifo a character at a time to find the break
character that looks like a NUL, and then let sysrq core handle the
characters after that break character comes in.

> > =

> > =

> >> +}
> >> +
> >> +static unsigned long get_clk_div_rate(unsigned int baud, unsigned int=
 *clk_div)
> >> +{
> >> +       unsigned long ser_clk;
> >> +       unsigned long desired_clk;
> >> +
> >> +       desired_clk =3D baud * UART_OVERSAMPLING;
> >> +       ser_clk =3D get_clk_cfg(desired_clk);
> >> +       if (!ser_clk) {
> >> +               pr_err("%s: Can't find matching DFS entry for baud %d\=
n",
> >> +                                                               __func=
__, baud);
> >> +               return ser_clk;
> >> +       }
> >> +
> >> +       *clk_div =3D ser_clk / desired_clk;
> > =

> > How wide can clk_div be? It may be better to implement the ser_clk as an
> > actual clk in the common clk framework, and then have the serial driver
> > or the i2c driver call clk_set_rate() on that clk and have the CCF
> > implementation take care of determining the rate that the parent clk can
> > supply and how it can fit it into the frequency that the divider can
> > support.
> Based on my current expertise with the CCF, I will address this comment =

> in a later patchset than the next one.

Ok. I've seen similar designs in some mmc drivers. For example, you can
look at drivers/mmc/host/meson-gx-mmc.c and see that they register a
clk_ops and then just start using that clk directly from the driver.
There are also some helper functions for dividers that would hopefully
make the job of calculating the best divider easier.

> >> +
> >> +       uport->uartclk =3D clk_rate;
> >> +       clk_set_rate(port->se.clk, clk_rate);
> >> +       ser_clk_cfg =3D SER_CLK_EN;
> >> +       ser_clk_cfg |=3D (clk_div << CLK_DIV_SHFT);
> > =

> > Drop useless cast.
> I think you mean parenthesis. I do not see casting here.

Yes! You got it.

> >> +#endif
> >> +       .pm =3D qcom_geni_serial_cons_pm,
> >> +};
> >> +
> >> +static int qcom_geni_serial_probe(struct platform_device *pdev)
> >> +{
> >> +       int ret =3D 0;
> >> +       int line =3D -1;
> >> +       struct qcom_geni_serial_port *port;
> >> +       struct uart_port *uport;
> >> +       struct resource *res;
> >> +       struct uart_driver *drv;
> >> +
> >> +       drv =3D (void *)of_device_get_match_data(&pdev->dev);
> > =

> > Useless cast.
> There were compiler warnings assigning a const void * to a void *. That =

> is why I have the cast in place.

Oh. Yes you shouldn't cast away the const. Please make the compiler
warning go away without casting it away.

> > =

> > =

> > Also, I see some serial drivers do the mapping when the port is
> > requested. That can't be done here?
> By "when the port is requested" do you mean console's setup operation. =

> It can be done, but given that it is a one-time operation I am not sure =

> if it makes any difference between mapping here and there.

No. I meant the uart_ops::uart_request() function and also
uart_ops::config_port(). Take a look at msm_config_port() and
msm_request_port() for how it was done on pre-geni qcom uarts.

I suppose we should try to probe this as a module and run a getty on it
and then remove and probe the module a couple times after that.
That should shake out some bugs.

> >> +
> >> +static const struct dev_pm_ops qcom_geni_serial_pm_ops =3D {
> >> +       .suspend_noirq =3D qcom_geni_serial_sys_suspend_noirq,
> >> +       .resume_noirq =3D qcom_geni_serial_sys_resume_noirq,
> > =

> > Why are these noirq variants? Please add a comment.
> The intention is to enable the console UART port usage as late as =

> possible in the suspend cycle. Hence noirq variants. I will add this as =

> a comment. Please let me know if the usage does not match the intention.

Hm.. Does no_console_suspend not work? Or not work well enough?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
