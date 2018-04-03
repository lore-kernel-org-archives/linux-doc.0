Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F3C287DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 18:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751685AbeDCSsh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Apr 2018 14:48:37 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34775 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752881AbeDCSsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Apr 2018 14:48:22 -0400
Received: by mail-oi0-f68.google.com with SMTP id u141-v6so16949591oif.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Apr 2018 11:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nXDrQwF0q6LeQarRkeKP9D/ocOebnm0oJylWUsVyEu8=;
        b=LSMlKOMkS23rnAtB9pR3bzy2IQqPlcZhIXwJHv+UGjWTNBOkZCxcOZj+MK97bAnJrL
         IXJ4NkSj+vZgWABamK4IP4auCcAqCVdykU5rnkyTKt/AcZLuaD3U8cSOt7eWV2jGaVgh
         K3CSwBUHjVXj+MM3dqLW0A04F67NBqXKf1+kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXDrQwF0q6LeQarRkeKP9D/ocOebnm0oJylWUsVyEu8=;
        b=KsEQJjNi00Zne0vetL+7X7A6jhijm5f1o643Ciyf8VE5MrRRPzV2nol+DOkVms8ptP
         IyHAn05UtHt2VMuZMgMVmrPz6PgpU31YPCaLHio0cWN/DzzhoKTflxLg0bwAusWpNteT
         IUwKvXc3UTSCtVtNyjsquT2O7/I1KDq8g+KhiNg8ssLH9fBsoVwmTQHCcitxPrMsAvqH
         oUpkRefhOWWLKgThxHlrt9xdswHXNuIFJd3o1/EXqQaaQZuXQmSSgzHEP0CFKTOucc3e
         P1JpDcB72KzEgjZIZ0PiIMp1xjiVo7wMgtKJx0gL+YB5MFPAEuhML95Vt30CWIKOKHLy
         6Ffg==
X-Gm-Message-State: ALQs6tAQ6M/uFCO0ks4CTYEKOpw+FNQOGbzYhD3pV2rZdip48B1NdFmk
        J+t9NWc7stY+w/NbjNXhD8ZQi3n4qFw=
X-Google-Smtp-Source: AIpwx4+dzBBThbXN2LZBk63/80oTCpBkWsl6A39RB4i64AbCqKVmMGD8riVPQ9O8xmsfEtfB7Jwu1A==
X-Received: by 2002:aca:4e85:: with SMTP id c127-v6mr7519285oib.10.1522781301261;
        Tue, 03 Apr 2018 11:48:21 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id y2-v6sm1046047otg.71.2018.04.03.11.48.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Apr 2018 11:48:19 -0700 (PDT)
Received: by mail-oi0-f51.google.com with SMTP id q71-v6so16939068oic.6
        for <linux-doc@vger.kernel.org>; Tue, 03 Apr 2018 11:48:19 -0700 (PDT)
X-Received: by 2002:aca:b103:: with SMTP id a3-v6mr7649450oif.135.1522781298776;
 Tue, 03 Apr 2018 11:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org> <1522429700-13083-3-git-send-email-kramasub@codeaurora.org>
In-Reply-To: <1522429700-13083-3-git-send-email-kramasub@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 03 Apr 2018 18:47:43 +0000
X-Gmail-Original-Message-ID: <CAE=gft4SVRy8DMUYpjq3Pvv6r8wMzKr=MOqqPZJNnVONc6ruQA@mail.gmail.com>
Message-ID: <CAE=gft4SVRy8DMUYpjq3Pvv6r8wMzKr=MOqqPZJNnVONc6ruQA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] soc: qcom: Add GENI based QUP Wrapper driver
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, wsa@the-dreams.de, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, acourbot@chromium.org,
        swboyd@chromium.org, Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 10:08 AM Karthikeyan Ramasubramanian <
kramasub@codeaurora.org> wrote:

> This driver manages the Generic Interface (GENI) firmware based Qualcomm
> Universal Peripheral (QUP) Wrapper. GENI based QUP is the next generation
> programmable module composed of multiple Serial Engines (SE) and supports
> a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. This
> driver also enables managing the serial interface independent aspects of
> Serial Engines.

> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>   drivers/soc/qcom/Kconfig        |   9 +
>   drivers/soc/qcom/Makefile       |   1 +
>   drivers/soc/qcom/qcom-geni-se.c | 748
++++++++++++++++++++++++++++++++++++++++
>   include/linux/qcom-geni-se.h    | 425 +++++++++++++++++++++++
>   4 files changed, 1183 insertions(+)
>   create mode 100644 drivers/soc/qcom/qcom-geni-se.c
>   create mode 100644 include/linux/qcom-geni-se.h


Reviewed-by: Evan Green <evgreen@chromium.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
