Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 766267D0F4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 23:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752189AbeCWXe0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 19:34:26 -0400
Received: from mail-vk0-f53.google.com ([209.85.213.53]:35398 "EHLO
        mail-vk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751677AbeCWXeY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Mar 2018 19:34:24 -0400
Received: by mail-vk0-f53.google.com with SMTP id r197so8284074vke.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Mar 2018 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=JsjN0OxMNqVOIjAPgKog1tcOIRZ4vt+96D07LC0/RFQ=;
        b=CgH0BPtuaFmo/pYPd06mIqnq62KSJ0m9gVmLa9sLg0Qn5gmDC+jydJ/0zlwi3pXhLb
         EKw9FgsiLqnDYboD+Jt8ckw3GZnK93AHOcpwdcGl780oi8jAfHa8GFi9y+Sj0xeTy2CW
         1mbwxyT6/4/MxPUjrDfwqgWQ8UCxevNWCIydqlVZnIZ1ZVxur6zEaQ57uv5tnShcKVFn
         jmQx2t9Yl00l5wT0taSEVpXfgy+Dfd77K7hBb0j4nuF4ZIb8+tmBRrbu2m9qdopkKZ/R
         c6w0CbBqu2PLq7ABBry53BBdPfcXSve3j4J62/9OYzN+xL2BfI9nEYrddKhoFr/vZJ3W
         D7IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=JsjN0OxMNqVOIjAPgKog1tcOIRZ4vt+96D07LC0/RFQ=;
        b=ig8k0Laa57oWEJwMjygGwmbQCdNMdPPdIf9CQLKwD3Jy4cLgLyLoz1qY2TQvtdnBGG
         EpZXeVaZZI4WQqiFYOZCQ6tNjTiLEOBEOssd6URzOJ8hndNI3FseIGcZ5zcdkwiRPrcX
         b0t/SeGUyNeLHv/ZCGuWf8F4ZvLbhSgYsl2ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=JsjN0OxMNqVOIjAPgKog1tcOIRZ4vt+96D07LC0/RFQ=;
        b=lDlFjmcZpNISivEKR8MpPLva3R3ElrS2u5dOsx0yzsCe34/OfcH/ftH5gU8AubZkRz
         myMkcccn5dcV0nhWL0WWykZjLV8Rs7GMm1UaOsDMKYgUyaLGHG9GOhnS8Lp/o2Lm+AIn
         BPu18MHVbJVQsI8EkazKve4jL+7boxQXAcp+t/hQFET3yXEfmmDkt94n0inVpPcNcYpe
         PNbBiGZfrbFU7MRpmPrYLvitKbQVYcZBwp69kqOIUVZSwVOb6OWwsoDMZMWVsshmnnWd
         wqwM0VVxlZ4WfwwDnsaEzsF9duKBZQMXoxNvJd3e8C/Wz0Fufz8JqmSM5bnNjKPqgPdM
         eDag==
X-Gm-Message-State: AElRT7GH6QqSo0XMRliJNNL6Rr0KX4QQVSQfxWQ6iCAz9QtWhq0EgGbd
        KV5mv6OoJbrYIN1VxMneHdsQOwPqm3lKt7EvAWTxzg==
X-Google-Smtp-Source: AG47ELu9vi2A7QrGF2PHvdnJslv7AtWI5riXwanKrQmY7W6yK5Hh2rwh9iXNL2TBXULa3vBBLQzWtlrGQIvA+ri+rX8=
X-Received: by 10.31.229.196 with SMTP id c187mr19697852vkh.1.1521848063432;
 Fri, 23 Mar 2018 16:34:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.180.195 with HTTP; Fri, 23 Mar 2018 16:34:22 -0700 (PDT)
In-Reply-To: <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org> <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Mar 2018 16:34:22 -0700
X-Google-Sender-Auth: qIBv_p2ULuWSo1MHWYVCgrp2fj4
Message-ID: <CAD=FV=VGcttQ6H1-Hnqj+Jrk+eaE52bOna6NojG5DoQ--A5aEg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, evgreen@chromium.org,
        acourbot@chromium.org, swboyd@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Mar 23, 2018 at 1:20 PM, Karthikeyan Ramasubramanian
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
>  drivers/i2c/busses/i2c-qcom-geni.c | 650 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 664 insertions(+)

[...]

> +/*
> + * Hardware uses the underlying formula to calculate time periods of
> + * SCL clock cycle. Firmware uses some additional cycles excluded from the
> + * below formula and it is confirmed that the time periods are within
> + * specification limits.

I was hoping for more than just "oh, and there's a fudge factor", but
I guess this is the best I'm going to get?


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
> +               /* Clock frequency not specified, so default to 100kHz. */
> +               dev_info(&pdev->dev,
> +                       "Bus frequency not specified, default to 100kHz.\n");

If you happen to spin again, can you remove the comment since it's
obvious from the string in the print?  It looks a lot like this code:

/* Print hello, world */
printf("hello, world\n");


In any case, that's a pretty minor nit, so I'll add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...assuming that the bindings and "geni" code get Acked / landed
somewhere.  Ideally let's not land this before the geni code lands
since if the geni API changes for some reason it'll cause us grief.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
