Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3F537D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 18:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753442AbeEUSOc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 14:14:32 -0400
Received: from mail-ua0-f195.google.com ([209.85.217.195]:32874 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753209AbeEUSOa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 14:14:30 -0400
Received: by mail-ua0-f195.google.com with SMTP id i2-v6so10527912uah.0
        for <linux-doc@vger.kernel.org>; Mon, 21 May 2018 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=8sEzIgovsDIYIYCg1efvYqJ/GtWJzshd/nFt9vi/kHI=;
        b=wGjXeYUiPc5/2spMXDPMFNz4KRp3XeQxmMCZy7pahjuk1mXsLogPiroRVsiSL/8N8U
         8NeFwvDN/3xqUs21y+82RqC5QS0jMJ+NgboaUsOSaKqq5Oq0sekz/MwranrwJ+oAoG/y
         7isxtPwIMOJhytzrCSnUANnzmOLN0hs9g++1xbTHhTbXGTrJvP1+Y04KbvbWI9UQQJ5A
         D+3lhKDN7e31unJs9Qk/0ui4nxoDivbVOs7Oa5bNDVkhh+oK3y8qzQItc2rGo1av4RrJ
         JBKu69pszu6IHGOSlo5BWHduAjnIrTWa99Q0Lz+Reu3JSVaI8xJrX1MgG+ngaa3OyJz7
         YZgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=8sEzIgovsDIYIYCg1efvYqJ/GtWJzshd/nFt9vi/kHI=;
        b=czQRSF0uKGSY47SEZ02UIxzHJwd0c4Zq9Qw6NYOlC/aPNX7/7BcmpQMdrq4e1Vj/Hh
         8wdPKIgfh5vQDEokmzlp9pOg22hkjM1ApgmXLAXxoQOe2Gs9Fekq4Ps/YE97jp27zwEt
         bqRcTcBmnsmOB0HYzwJvQUr+GH61mPMVYu6uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=8sEzIgovsDIYIYCg1efvYqJ/GtWJzshd/nFt9vi/kHI=;
        b=qvgNXIEqDBDbaFfRILi9PaCLTbjocWe3nLAE75kDVjIcQAz/OpME7HUf3u0IZ/9htd
         s1OJqMkopoNbTC/1JdMSkDln0SCPWmW5znxRu9xmnPGZB5hOscofTDO9sifq5Xyb8b0b
         fMvDppWNFgMWMBejIWbi3TFfKyttQTJuIT53XDEdHA+1QmiAqiV2jQRC/9dXMUh6WOBD
         PJHF6Khq5V5/7GA2xTHGT7xTquu+XgZgKnkzS402oZrvQV13Mexi+weBE2wVZFG0XX4b
         4N8PXZUa6+CBm8YPI3AKnOkS42N3YW2aN7CJUiupgU1GW9fGFE9ySVW3eq1afrtSSBAa
         QRng==
X-Gm-Message-State: ALKqPwc0iB+DsL9H7JWyrAyCUboQFVtrOKrhHtoEGUkkX79cxi05REIu
        JUfqvTzv7mxDGphXHHZbrkzgz9BhZsQpVmV4DUNhtQ==
X-Google-Smtp-Source: AB8JxZpZhhR6VYQB7hWE30/kgUe3Ah4zVWxS32vKpS3xYJZfXr1tj7HofuVdg8uI0VIOGEEDzmT2tsIequWNiESkJgA=
X-Received: by 2002:ab0:5a72:: with SMTP id m47-v6mr14549255uad.37.1526926469193;
 Mon, 21 May 2018 11:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.48.82 with HTTP; Mon, 21 May 2018 11:14:28 -0700 (PDT)
In-Reply-To: <CAD=FV=VGcttQ6H1-Hnqj+Jrk+eaE52bOna6NojG5DoQ--A5aEg@mail.gmail.com>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org>
 <1521836461-6515-4-git-send-email-kramasub@codeaurora.org> <CAD=FV=VGcttQ6H1-Hnqj+Jrk+eaE52bOna6NojG5DoQ--A5aEg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 21 May 2018 11:14:28 -0700
X-Google-Sender-Auth: r-y60lkw5CmbppmryQE8KdKMJhA
Message-ID: <CAD=FV=VhZXM102dtqG0+3m3HQ0fkAW4moTGwef=2rSLnvvzrgQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Gross <andy.gross@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Evan Green <evgreen@chromium.org>,
        acourbot@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wolfram,

On Fri, Mar 23, 2018 at 4:34 PM, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Fri, Mar 23, 2018 at 1:20 PM, Karthikeyan Ramasubramanian
> <kramasub@codeaurora.org> wrote:
>> This bus driver supports the GENI based i2c hardware controller in the
>> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
>> module supporting a wide range of serial interfaces including I2C. The
>> driver supports FIFO mode and DMA mode of transfer and switches modes
>> dynamically depending on the size of the transfer.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> ---
>>  drivers/i2c/busses/Kconfig         |  13 +
>>  drivers/i2c/busses/Makefile        |   1 +
>>  drivers/i2c/busses/i2c-qcom-geni.c | 650 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 664 insertions(+)
>
> [...]
>
>> +/*
>> + * Hardware uses the underlying formula to calculate time periods of
>> + * SCL clock cycle. Firmware uses some additional cycles excluded from the
>> + * below formula and it is confirmed that the time periods are within
>> + * specification limits.
>
> I was hoping for more than just "oh, and there's a fudge factor", but
> I guess this is the best I'm going to get?
>
>
>> +static int geni_i2c_probe(struct platform_device *pdev)
>> +{
>> +       struct geni_i2c_dev *gi2c;
>> +       struct resource *res;
>> +       u32 proto, tx_depth;
>> +       int ret;
>> +
>> +       gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
>> +       if (!gi2c)
>> +               return -ENOMEM;
>> +
>> +       gi2c->se.dev = &pdev->dev;
>> +       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(gi2c->se.base))
>> +               return PTR_ERR(gi2c->se.base);
>> +
>> +       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
>> +       if (IS_ERR(gi2c->se.clk)) {
>> +               ret = PTR_ERR(gi2c->se.clk);
>> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
>> +                                                       &gi2c->clk_freq_out);
>> +       if (ret) {
>> +               /* Clock frequency not specified, so default to 100kHz. */
>> +               dev_info(&pdev->dev,
>> +                       "Bus frequency not specified, default to 100kHz.\n");
>
> If you happen to spin again, can you remove the comment since it's
> obvious from the string in the print?  It looks a lot like this code:
>
> /* Print hello, world */
> printf("hello, world\n");
>
>
> In any case, that's a pretty minor nit, so I'll add:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ...assuming that the bindings and "geni" code get Acked / landed
> somewhere.  Ideally let's not land this before the geni code lands
> since if the geni API changes for some reason it'll cause us grief.

The bindings and "geni" code have landed in Andy's tree, so whenever
you get a chance it would be super if you could land this i2c driver
(assuming it looks good to you).  I know at least a few people have
been poking at this and it seems to work for basic transfers.

Thanks!

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
