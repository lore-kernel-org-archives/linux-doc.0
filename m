Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 30F927DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 23:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751490AbeCWXic (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 19:38:32 -0400
Received: from mail-vk0-f44.google.com ([209.85.213.44]:39423 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751600AbeCWXia (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Mar 2018 19:38:30 -0400
Received: by mail-vk0-f44.google.com with SMTP id f6so8269808vkh.6
        for <linux-doc@vger.kernel.org>; Fri, 23 Mar 2018 16:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=DL4ONeOxEo5d7Z/ZAIH6Bd0NJz1jm0mgx/YufAUTubc=;
        b=arH/whaGUjLK2h30D9ji8LeyRf0OBtkg/yJUcNJxBArH8JCUodNZaQI+0N5yJmE7ec
         1xR8LHjPS5AJkFSnLwE7qr6eNw1KPR20GTEn+uCvooL+lEtDQ98m7BbYDx7e8ZlFfonQ
         YY9I3ZcOHMRkIbCMo/nzbwuviMGPOb7CBBNrTC24yjcbdR/2soCZ1mYcUSOy2rdOkAk5
         8htsYR0rdxZju5ckT1sANSbncWv1dvt4Vp9SD6JumC0Yw5HVFLmGazCmGB0yfDJA7HxA
         BLARN8MWC1+98mTh6AgdbxX4PzJppuRKDMZLDijb+EBsIE2yvnwzhXaEcFqmBWjw1qXo
         gZew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=DL4ONeOxEo5d7Z/ZAIH6Bd0NJz1jm0mgx/YufAUTubc=;
        b=RODH/fPh7MLjAMkp7WwCi53b2iOUHV0BsbS5oSZd5/+wrSqhSi/NJr0FirnXMi4fIu
         YCvvnEPKh1F9PUTwDDSAknL7LrxKUsejTWdk1HI2dlHhcw7hPwV7hQN09Z2neQkcmvg9
         WcvZR60XI/BjK4ks4EQfgOf38x1nbniMTfAg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=DL4ONeOxEo5d7Z/ZAIH6Bd0NJz1jm0mgx/YufAUTubc=;
        b=ULpZYbwUxzIONbQ3A/OI8vuJcEVEN+Yrz31GBSwWyxSfvti0ONjy4jozX8W3KAZeD7
         dfQ0lRE6iD89Rgio8CZi3qr+9s7HvdJ0WhuP/VtICHXWoutVYDEuTAsPyP1ujApBt+TJ
         vERMoPy1ni1xjxekkhB4LeqmccoVERmpQRa+xGr8FqrPHe/DrJnKVanFQT8dQPVn0MSj
         6W0a6sqPWyMcLitb30U/Ct1fX1+rs57mJed1P1APzYB5wd7+3SjGO6Kv9AipJgj16eJW
         ASs3aboBNjsJzmlFpx7Kvp1FqWBIPLYYghATrYm7LXoCz7XL6VXMHMg4mlD1FEyitrgC
         AEMA==
X-Gm-Message-State: AElRT7GNeLvAua0yA/uJTKddqv2k4ZJd/jD50HsTor5cL/yjY8Z4mTXC
        myYndQZONN1GFH+xjmhOwCBKCFZ1jxTL7ayBBbYKgA==
X-Google-Smtp-Source: AG47ELt4ahI5OHJWVP5sA1SomWja07h8NNIrU4UZPa+wHMmqzWSNOt4Ko2Z5X20vmsa2+yWdeBEZkrP/SS3FDiTdHBg=
X-Received: by 10.31.140.5 with SMTP id o5mr19899297vkd.157.1521848309085;
 Fri, 23 Mar 2018 16:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.180.195 with HTTP; Fri, 23 Mar 2018 16:38:28 -0700 (PDT)
In-Reply-To: <1521836461-6515-6-git-send-email-kramasub@codeaurora.org>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org> <1521836461-6515-6-git-send-email-kramasub@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Mar 2018 16:38:28 -0700
X-Google-Sender-Auth: OWnF8g9Qxdh7soFOZBOZ3AdSBCs
Message-ID: <CAD=FV=U46kXNfV4D3=kO6+nd6NNzuBDAEHeGJ4nJdN_255Vy7Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: sdm845: Add support for an instance of
 I2C controller
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, evgreen@chromium.org,
        acourbot@chromium.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Mar 23, 2018 at 1:21 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> +                       i2c10: i2c@a88000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0xa88000 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               pinctrl-names = "default", "sleep";
> +                               pinctrl-0 = <&qup_i2c10_default>;
> +                               pinctrl-1 = <&qup_i2c10_sleep>;
> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +                               clock-frequency = <400000>;

Please move the clock-frequency to the board file.  Not all devices on
all boards will support 400 kHz, so we should be at 100 kHz by default
and boards should explicitly say that they support 400 kHz.

Other than that things look good to me and you can add my Reviewed-by tag.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
