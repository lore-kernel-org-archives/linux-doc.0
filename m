Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D099FC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 13 Mar 2021 08:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 971A264F1A
	for <linux-doc@archiver.kernel.org>; Sat, 13 Mar 2021 08:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhCMInN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Mar 2021 03:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233559AbhCMImn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Mar 2021 03:42:43 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F6CC061762
        for <linux-doc@vger.kernel.org>; Sat, 13 Mar 2021 00:42:43 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id g4so17395148pgj.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Mar 2021 00:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pVXzAavbWQCIuyim7qVlCD+k9KLwZXY4SN3cSaFtD94=;
        b=sfbmW7mEOQ/RXDel1aRVFFwUIRa7HH9D1Wbsazud96yTVFornNkX3AWSXhpMW5KqPk
         uG/HMVGvbQlAKET251HGuLZeWYK7XGbrOgTrpeBhiiUo9qJ6p+Z24NMQAKwLlXaRlyc5
         cmceVTE6Xila1p6ZIDv+9DDmLZk5sV2gRPVqyfew6CjpfnCsMMdFLHIxMVwdFL2xlRTo
         HuAy4FlSocHDH24ieAJoQqLkvdNO42anbX7hD06lII9aK3MCAa5Co3nOp87LYXiV9eOh
         JyeX22DIgw8nMbkR4NPJDJrjzKMHYWwg3tD9KNWc9W+GBg5HBVPISgCgKoGL7fwFsu57
         Othw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pVXzAavbWQCIuyim7qVlCD+k9KLwZXY4SN3cSaFtD94=;
        b=uB1FlSxXECD/WN7fUyyzix3pjeXd6ZX6FMSxdKWYio+a0/S65Q+LpptKxxSyyD9pHf
         kodCfHNlEkkd4bKMAmMdlZUWJ6jILTpwAQZMZzFH79YJAW0h5TQDMZmfXYPr6YTPrGJ7
         pkKWTlqvpptY1PQZrTlEu7iuBf+RpUV/wTDBmHwRa/Oiuw32E8YbAKd5Ieml31JGwrhg
         0TtIyFSRFDiuCkLoqyb8vglRuOENuhSPtCoNcSRNHg9jXnDu02qlyg3RQyCDZNQIu8Zl
         DXPjn07evtZ1BoBJnFLgfrFTFU+CBwqDtDwm276zVR6UW+wSbV+cBG/YZCxHXxsgduD/
         X0rg==
X-Gm-Message-State: AOAM533I5sQ5p0GdmRZm7Y153Q6WgyNxvamtZjfUvQxsXkZNVRliqnKc
        1oWvkNN9Jm5JONJdxGnYBUAteA==
X-Google-Smtp-Source: ABdhPJwClrJYe1/6OfrldTxrl8D09eR8P+9mHwokjr9mcjKpjcs5o0H1wsuB3bOHVBEWDVdulWqcNA==
X-Received: by 2002:a63:6982:: with SMTP id e124mr15526357pgc.46.1615624962566;
        Sat, 13 Mar 2021 00:42:42 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:70ad:d592:e701:79d3])
        by smtp.gmail.com with ESMTPSA id q5sm7412514pfk.219.2021.03.13.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 00:42:41 -0800 (PST)
Date:   Sat, 13 Mar 2021 00:42:39 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v9 2/4] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210313084239.GB1172642@x1>
References: <20210302053059.1049035-1-drew@beagleboard.org>
 <20210302053059.1049035-3-drew@beagleboard.org>
 <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 12, 2021 at 02:57:54PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 02.03.21 06:30, Drew Fustini wrote:
> 
> Hi folks,
> 
> > Add "pinmux-select" to debugfs which will activate a pin function for a
> > given pin group:
> > 
> >    echo "<group-name function-name>" > pinmux-select
> > 
> > The write operation pinmux_select() handles this by checking that the
> > names map to valid selectors and then calling ops->set_mux().
> 
> I've already been playing with similar idea, but for external muxes.
> For example, some boards have multiple SIM slots that can be switched
> via some gpio pin.
> 
> Not sure whether traditional pinmux would be a good match for that.
> 
> 
> --mtx
> 

Thank you for your comment.  I am interested in understanding other
use cases.

Linus can hopefully correct me, but I think this is covered by section
"Drivers needing both pin control and GPIOs" in pinctl.rst [1]. The
driver could be both a GPIO consumer and pinctrl consumer and then be
able to call pinctrl_select_state() and devm_gpio_request().

Thank you,
Drew

[1] https://www.kernel.org/doc/html/latest/driver-api/pinctl.html
