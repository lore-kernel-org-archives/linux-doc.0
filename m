Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A8697E281
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 20:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933286AbeCBU7g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 15:59:36 -0500
Received: from mail-ot0-f193.google.com ([74.125.82.193]:44564 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752636AbeCBU7e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 15:59:34 -0500
Received: by mail-ot0-f193.google.com with SMTP id 79so9924599oth.11
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=EUcoyzna9x1JCVuA6uiieo3NBADCZCIxVMceqxHCuRY=;
        b=Q1jfT/MzY9EmNRCXGxb7HXyYWb4tH/dK7+o121INj24LC7l7GqiuV+PzZ0vM/Tf4JT
         crjWn+FiXMIoFLs1um+4g95GTO/gi8QkCy0sIdVtAQShdojoXFTz+21lOaNtIYILLsuT
         1L4yhV1gb8c31WbrhdqumdZOQeRQaqvM1A9jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=EUcoyzna9x1JCVuA6uiieo3NBADCZCIxVMceqxHCuRY=;
        b=K/KCSvXG5UDCZ/912kgKR/jT++Gii3Dduu1yLXQ+NbAj3S2b706mPF21oHBGNuP8mB
         znqP8JK4NM+0d0Qwo65O2K/NicId9Sqy0wz41fG36tJor1Uf29MBRVLZA+JAiqouI6qx
         ipYRctLmnSeizEDC4ldmlfp3Cvv8TgQcDBCB70v7Jql9tg7tZkUYUcN0xxzelc0h1TKs
         rM7Ued8QyYJhWXqZiWw/tajS6hQvRr0+5XE+tFPtRZaGN1+me8pLZANqX6xL7lB5jWBJ
         bdaSj8PBlvOLJ/n5/WUyywwWjhjXAPB+RUxjagCCETV6x/pIq9fGoQ3YDkbsdafS5NBm
         iC4g==
X-Gm-Message-State: AElRT7GqmEWQd7uhtmU3r6DKw81FeCMg31AE0dyW3K4IOyjCCltZC+YJ
        TbnP8QscfSvsdbEELBCCn1wALPZVFuc=
X-Google-Smtp-Source: AG47ELuBvJwFO8CXr9uwwN6hw/Rbi10mPYoGA9kLs6QQEEZ7Kl8coqdClbtWgZzga1c921kjsWowKQ==
X-Received: by 10.157.87.4 with SMTP id p4mr4693827oth.397.1520024373857;
        Fri, 02 Mar 2018 12:59:33 -0800 (PST)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id x4sm3998160otx.13.2018.03.02.12.59.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Mar 2018 12:59:32 -0800 (PST)
Received: by mail-oi0-f46.google.com with SMTP id x12so7993572oie.13
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 12:59:31 -0800 (PST)
X-Received: by 10.84.79.129 with SMTP id g1mr4769732oiy.28.1520024371302; Fri,
 02 Mar 2018 12:59:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.14.33 with HTTP; Fri, 2 Mar 2018 12:58:50 -0800 (PST)
In-Reply-To: <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-3-git-send-email-kramasub@codeaurora.org> <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 2 Mar 2018 12:58:50 -0800
X-Gmail-Original-Message-ID: <CAE=gft76Twp9xZUPkv0x+qs5E9Hj72EwZNZx=vtNQ9uzKx_5Nw@mail.gmail.com>
Message-ID: <CAE=gft76Twp9xZUPkv0x+qs5E9Hj72EwZNZx=vtNQ9uzKx_5Nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
To:     Stephen Boyd <sboyd@chromium.org>
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        David Brown <david.brown@linaro.org>,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, acourbot@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Karthik,

On Tue, Feb 27, 2018 at 5:38 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> This driver manages the Generic Interface (GENI) firmware based Qualcomm
> Universal Peripheral (QUP) Wrapper. GENI based QUP is the next generation
> programmable module composed of multiple Serial Engines (SE) and supports
> a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. This
> driver also enables managing the serial interface independent aspects of
> Serial Engines.
>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig        |   9 +
>  drivers/soc/qcom/Makefile       |   1 +
>  drivers/soc/qcom/qcom-geni-se.c | 971 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h    | 247 ++++++++++
>  4 files changed, 1228 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom-geni-se.c
>  create mode 100644 include/linux/qcom-geni-se.h
>
[...]
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> new file mode 100644
> index 0000000..61335b8
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> +
> +/**
> + * geni_se_clk_tbl_get() - Get the clock table to program DFS
> + * @se:                Pointer to the concerned Serial Engine.
> + * @tbl:       Table in which the output is returned.
> + *
> + * This function is called by the protocol drivers to determine the different
> + * clock frequencies supported by Serial Engine Core Clock. The protocol
> + * drivers use the output to determine the clock frequency index to be
> + * programmed into DFS.
> + *
> + * Return: number of valid performance levels in the table on success,
> + *        standard Linux error codes on failure.
> + */
> +int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl)
> +{
> +       struct geni_wrapper *wrapper = se->wrapper;
> +       unsigned long freq = 0;
> +       int i;
> +       int ret = 0;
> +
> +       mutex_lock(&wrapper->lock);
> +       if (wrapper->clk_perf_tbl) {
> +               *tbl = wrapper->clk_perf_tbl;
> +               ret = wrapper->num_clk_levels;
> +               goto out_unlock;
> +       }
> +
> +       wrapper->clk_perf_tbl = kcalloc(MAX_CLK_PERF_LEVEL,
> +                                       sizeof(*wrapper->clk_perf_tbl),
> +                                       GFP_KERNEL);
> +       if (!wrapper->clk_perf_tbl) {
> +               ret = -ENOMEM;
> +               goto out_unlock;
> +       }
> +
> +       for (i = 0; i < MAX_CLK_PERF_LEVEL; i++) {
> +               freq = clk_round_rate(se->clk, freq + 1);
> +               if (!freq || freq == wrapper->clk_perf_tbl[i - 1])
> +                       break;
> +               wrapper->clk_perf_tbl[i] = freq;
> +       }
> +       wrapper->num_clk_levels = i;
> +       *tbl = wrapper->clk_perf_tbl;
> +       ret = wrapper->num_clk_levels;
> +out_unlock:
> +       mutex_unlock(&wrapper->lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL(geni_se_clk_tbl_get);

I think Bjorn had this feedback before, but if you did this work in
probe you could remove the mutex altogether.

> +       wrapper->ahb_clks[0].id = m_ahb_clk;
> +       wrapper->ahb_clks[1].id = s_ahb_clk;
> +       ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> +       if (ret) {
> +               dev_err(dev, "Err getting AHB clks %d\n", ret);
> +               return ret;
> +       }
> +
> +       mutex_init(&wrapper->lock);
> +       dev_set_drvdata(dev, wrapper);
> +       dev_dbg(dev, "GENI SE Driver probed\n");
> +       return devm_of_platform_populate(dev);
> +}
> +
> +static int geni_se_remove(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct geni_wrapper *wrapper = dev_get_drvdata(dev);
> +
> +       kfree(wrapper->clk_perf_tbl);

Maybe null out clk_perf_tbl for safety?

> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> new file mode 100644
> index 0000000..4996de7
> --- /dev/null
> +++ b/include/linux/qcom-geni-se.h
[...]
> +/* SE_DMA_RX_IRQ_STAT Register fields */
> +#define RX_DMA_DONE                    BIT(0)
> +#define RX_EOT                         BIT(1)
> +#define RX_SBE                         BIT(2)
> +#define RX_RESET_DONE                  BIT(3)
> +#define RX_FLUSH_DONE                  BIT(4)
> +#define RX_GENI_GP_IRQ                 GENMASK(10, 5)
> +#define RX_GENI_CANCEL_IRQ             BIT(11)
> +#define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
> +
> +#ifdef CONFIG_QCOM_GENI_SE

I think this needs to be #if IS_ENABLED(CONFIG_QCOM_GENI_SE), since
the function prototypes below won't light up if this is built as a
module.

Thanks,
Evan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
