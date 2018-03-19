Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 503EB7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 21:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965488AbeCSVJB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 17:09:01 -0400
Received: from mail-vk0-f54.google.com ([209.85.213.54]:33887 "EHLO
        mail-vk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965391AbeCSVIs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 17:08:48 -0400
Received: by mail-vk0-f54.google.com with SMTP id z190so11200760vkg.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Mar 2018 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=qSgdSRI5AyLFBnf+9kUnQiVuC/FPzC3bNtHBcc6tNHs=;
        b=iYntDe9P/civ8db++zQeMxhZiEWbUxer0oZtkQmGOo+NJLBaz4rLNKs45f89LjefXh
         4FXml8vxjSTZkWsMnE4D6FrmaXS3PN31NZDfgZxjatDoMDfX70Q0yEM0iRxa4vtVvd+V
         z+52KFPFbxwz509vZHhX8E+nkVFr3HAphmNcHWGp0EvHoW9btRZx7g3TgaW7PvHvx2uF
         dzd6FU0v1jw+tRRxYoGK0jEI2heLQc+PrUk/gC+N/ga9DhrMba7WnQCEY/2B72LNnx4k
         Moym2pyr0+7NeBJ8I17OoKRwZN5L+dCJj+6hdDC+VakvUyvJtg7JViRt5etmUA2Dijka
         xdiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=qSgdSRI5AyLFBnf+9kUnQiVuC/FPzC3bNtHBcc6tNHs=;
        b=NHVF3IBpq+PaFS6OAJs7kxEj03dK4nApa6mSljPfQySE3jJs9Ye6SiXDSjlJPQvMC0
         BDF77QM0W2BPMSJWHQ+XrpEsHP6wr7TcDZGU1I1qPIUFgOj8l77esS7uCDZYAK3xSvD1
         00FvtfbU49NOhD812dUEFD/RrQNAbqGvYlLaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=qSgdSRI5AyLFBnf+9kUnQiVuC/FPzC3bNtHBcc6tNHs=;
        b=iub+pf+pViyxrnP6jetMG87Vwlix1Ejq4VmVAEnFziMBr7bGm/mjUGrY3LqCbx7L2U
         RTvQ/ElOvkTcz87R7+jF9387Cs8GmN+NGDu4zvAzlrXsthffoISTdkuTbz8mebuQjz3R
         fwq2jTGECBNtk0MlljNs/DNZLN7kNFS3mM1K3QqgNBKzHho9gRt+2wKFvD0Y4MFhxzbc
         2JdlPi1KtJvOa0iUAOZQC5QSrlKPn6w4lYgKVbttUpTuIXpUjLFHxM29xzHT+hnYV0JH
         yK6aiMjfmSCJIvMjDfEXnoLRL1bMNoWypSR3zH7X8ZpmtQJdoX38jbv2aws6vOrUGZnv
         6RtA==
X-Gm-Message-State: AElRT7ElhjnFV9vP7mM0kY1qDqpNjdvYT6bi/cXOwNkFPUUV/bTGI1mW
        pL3bIjzD88VdzP6rZtrsvtPbZppFCUQ33DMw5VVd5g==
X-Google-Smtp-Source: AG47ELt72aRmw64jqY9LGh5+/Bsvh1h+8ENHJ4qf2OWtyTFd4L6eXBO75xnDGs/uUfikuX3NBrFsi4JzQkw0Msn4cgQ=
X-Received: by 10.31.167.18 with SMTP id q18mr8686366vke.10.1521493726500;
 Mon, 19 Mar 2018 14:08:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.180.195 with HTTP; Mon, 19 Mar 2018 14:08:44 -0700 (PDT)
In-Reply-To: <1521071931-9294-4-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org> <1521071931-9294-4-git-send-email-kramasub@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 19 Mar 2018 14:08:44 -0700
X-Google-Sender-Auth: QBDlOfTInD9ncq3XdzoilK_nFRw
Message-ID: <CAD=FV=W+eiy80y2QKp_-jPEp4SG0WxmdKFTn-5de0A1F-XPrqA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Mar 14, 2018 at 4:58 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> This bus driver supports the GENI based i2c hardware controller in the
> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
> module supporting a wide range of serial interfaces including I2C. The
> driver supports FIFO mode and DMA mode of transfer and switches modes
> dynamically depending on the size of the transfer.
>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>  drivers/i2c/busses/Kconfig         |  13 +
>  drivers/i2c/busses/Makefile        |   1 +
>  drivers/i2c/busses/i2c-qcom-geni.c | 648 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 662 insertions(+)

Since I reviewed v3 of the i2c patch, can you make sure that you CC me
on future patches?  Thanks!  :)

Overall this looks pretty nice to me now.  A few minor comments...


> +/*
> + * Hardware uses the underlying formula to calculate time periods of
> + * SCL clock cycle.
> + *
> + * time of high period of SCL: t_high = (t_high_cnt * clk_div) / source_clock
> + * time of low period of SCL: t_low = (t_low_cnt * clk_div) / source_clock
> + * time of full period of SCL: t_cycle = (t_cycle_cnt * clk_div) / source_clock
> + * clk_freq_out = t / t_cycle
> + * source_clock = 19.2 MHz
> + */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> +       {KHZ(100), 7, 10, 11, 26},
> +       {KHZ(400), 2,  5, 12, 24},
> +       {KHZ(1000), 1, 3,  9, 18},
> +};

Thanks for the docs.  ...though if these docs are indeed correct and
there's no extra magic fudge factor I'm still a bit baffled why the
frequency isn't out of spec for 100 kHz and 1 MHz.  I know you said
hardware validated it, but are you really certain they validated 100
kHz and 1 MHz?

>>> 19200. / (1 * 18)
1066.6666666666667

>>> 19200. / (2 * 24)
400.0

>>> 19200. / (7 * 26)
105.49450549450549

Specifically: either the docs you wrote above are wrong (and there's a
magic fudge factor that you didn't document) or your hardware guys are
wrong.  See the I2C spec at
<https://www.nxp.com/docs/en/user-guide/UM10204.pdf>.  Table 10.
("Characteristics of the SDA and SCL bus lines for Standard, Fast, and
Fast-mode Plus I2C-bus devices") says fSCL Max is 100 kHz, 400 kHz, or
1000 kHz.


I could believe that 99.9% of all devices that support 100 kHz also
support 105.5 kHz and that 99.9% of all devices that support 1000 kHz
also support 1066.7 kHz.  However, it's still not in spec.  If you
want to enable a turbo boost mode that runs 5% faster (really?) then I
suppose you could add that as an optional feature, but this shouldn't
be the default.


> +static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       u32 val;
> +       unsigned long time_left = ABORT_TIMEOUT;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gi2c->lock, flags);
> +       geni_i2c_err(gi2c, GENI_TIMEOUT);
> +       gi2c->cur = NULL;
> +       geni_se_abort_m_cmd(&gi2c->se);
> +       spin_unlock_irqrestore(&gi2c->lock, flags);
> +       do {
> +               time_left = wait_for_completion_timeout(&gi2c->done, time_left);
> +               val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
> +       } while (!(val & M_CMD_ABORT_EN) && time_left);
> +
> +       if (!(val & M_CMD_ABORT_EN) && !time_left)

Why do you need to check !time_left?  Just "if (!(val & M_CMD_ABORT_EN))".


> +               dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
> +}
> +
> +static void geni_i2c_rx_fsm_rst(struct geni_i2c_dev *gi2c)
> +{
> +       u32 val;
> +       unsigned long time_left = RST_TIMEOUT;
> +
> +       writel_relaxed(1, gi2c->se.base + SE_DMA_RX_FSM_RST);
> +       do {
> +               time_left = wait_for_completion_timeout(&gi2c->done, time_left);
> +               val = readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_STAT);
> +       } while (!(val & RX_RESET_DONE) && time_left);
> +
> +       if (!(val & RX_RESET_DONE) && !time_left)

Similar.  Don't need "&& !time_left"


> +               dev_err(gi2c->se.dev, "Timeout resetting RX_FSM\n");
> +}
> +
> +static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
> +{
> +       u32 val;
> +       unsigned long time_left = RST_TIMEOUT;
> +
> +       writel_relaxed(1, gi2c->se.base + SE_DMA_TX_FSM_RST);
> +       do {
> +               time_left = wait_for_completion_timeout(&gi2c->done, time_left);
> +               val = readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_STAT);
> +       } while (!(val & TX_RESET_DONE) && time_left);
> +
> +       if (!(val & TX_RESET_DONE) && !time_left)

Similar.  Don't need "&& !time_left"


> +static int geni_i2c_probe(struct platform_device *pdev)
> +{
> +       struct geni_i2c_dev *gi2c;
> +       struct resource *res;
> +       u32 proto, tx_depth;
> +       int ret;
> +
> +       gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
> +       if (!gi2c)
> +               return -ENOMEM;
> +
> +       gi2c->se.dev = &pdev->dev;
> +       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(gi2c->se.base))
> +               return PTR_ERR(gi2c->se.base);
> +
> +       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
> +       if (IS_ERR(gi2c->se.clk)) {
> +               ret = PTR_ERR(gi2c->se.clk);
> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> +                                                       &gi2c->clk_freq_out);
> +       if (ret) {
> +               /* All GENI I2C slaves support 400kHz. So default to 400kHz. */

Can you explain this comment?  Are you saying that GENI only supports
talking to I2C devices (devices are also known as "slaves" and GENI
should be the I2C master) that talk 400 kHz I2C or better?  Why do you
even have 100 kHz in your table above then?  I don't think this is
what you meant...

Perhaps you meant to say "All GENI I2C masters support at least 400
kHz, so default ot 400 kHz"

...however, even if you changed the comment as I suggested I'm still
not a fan.  As I said in my review of the prevous version:

> I feel like it should default to 100KHz.  i2c_parse_fw_timings()
> defaults to this and to me the wording "New drivers almost always
> should use the defaults" makes me feel this should be the defaults.

I would also say that even if all GENI I2C masters support at least
400 kHz that doesn't mean that all I2C devices on the bus support 400
kHz.  You could certainly imagine someone sticking something on this
bus that was super low cost and supported only 100 kHz I2C.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
