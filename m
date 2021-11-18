Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BB2C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 16:42:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF9E661B29
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 16:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhKRQpY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 11:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbhKRQpY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 11:45:24 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9755C061574
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 08:42:23 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so7012668pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 08:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xE1tYIaRVomoPkVirKP1ld+mCROeZfiYINcc8cGYc/8=;
        b=xiG2Kqp5yU33888s/IkyHXmIBLiUC4CPD4REKXHpkzcgmIjRIsFLKP/8BgW/z3s8WV
         8/rLBZp5kGFHZNf6wufGoLfyXnAfnt2m+eC8FfKR38MwjHH82chiYGBNEkKKIYh3j9vD
         xmNBkZE1q0czAoXzSQ4a42iHZxwmxfq/H1bpDJh/67QvCiwbPDhteitNe0oxKcC42sKQ
         pVvFfwEAQYUuTK15eSD9MKWz30S02b6Y1pQfoul5PXNTg581b07rZ9Fm24GagqLKTcjM
         lEdOmVr796NrnAz+TMBjLDIy3pd0F/jpdnHg3j8vjuHUgntxOnHE7G3Z5Z6dUN/yke5M
         b4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xE1tYIaRVomoPkVirKP1ld+mCROeZfiYINcc8cGYc/8=;
        b=M0Wcm+wcpjwIXgUcalgxQiqoKRRiCSGoZsrZMR2F4+y2tSnuPu0esYttVlNCfBn0dL
         UEAgnjT+otzg70EBEi7yOIE2CN9Dg9el5yWI3cYw6+VQZaYXmaZtMMN5+Kfq9iBWubXa
         O72WYKhMwEdKnXHbehd3FENthscAqxSfHhdtd7zHZWfh0mhynPIbTFs1/h6I/et00i7c
         3Y6Vff0VNZ2pYdTpVnTqT7mvytdcAhZdKkW3mYiYWhwyNByKUylbwHn9VsGYUGgwvvUn
         u1D3ZfbT+Gv5u6+KhEuPXA6+mDgvUJs2camX1K267m7tjL3bViTU7L7ViifnN8ymQW4T
         EQgQ==
X-Gm-Message-State: AOAM530mSR5XlIPHFOMbczqh+EmCwgBZceQiZzrgi9VhZEf43YR/1ra2
        Pcz5FJkosRx23iR0dKoHO0iEfdjR36JiAQ==
X-Google-Smtp-Source: ABdhPJzAy/KGbUaQTIZvXiGRrnI/TWJBdZ5s+YYWDaE/N7hitmsAL+lZLiJMF3VgZr0mGGlJ7D66mw==
X-Received: by 2002:a17:90b:3718:: with SMTP id mg24mr12009518pjb.109.1637253743169;
        Thu, 18 Nov 2021 08:42:23 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id rm1sm9429409pjb.3.2021.11.18.08.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 08:42:22 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:42:19 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, corbet@lwn.net, suzuki.poulose@arm.com
Subject: Re: [PATCH] Documentation: coresight: Fix documentation issue
Message-ID: <20211118164219.GA2530497@p14s>
References: <20211117164220.14883-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117164220.14883-1-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 17, 2021 at 04:42:20PM +0000, Mike Leach wrote:
> Fix the description of the directories and attributes used
> in cs_etm as used by perf.
> 
> Drop the references to the 'configurations' sub-directory which
> had been removed in an earlier version of the patchset.
> 
> Fixes: f71cd93d5ea4 ("Documentation: coresight: Add documentation for CoreSight config")
> Reported-by: German Gomex <german.gomez@arm.com>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../trace/coresight/coresight-config.rst         | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

I have applied this patch.

Thanks,
Mathieu

> 
> diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
> index a4e3ef295240..6ed13398ca2c 100644
> --- a/Documentation/trace/coresight/coresight-config.rst
> +++ b/Documentation/trace/coresight/coresight-config.rst
> @@ -211,19 +211,13 @@ also declared in the perf 'cs_etm' event infrastructure so that they can
>  be selected when running trace under perf::
>  
>      $ ls /sys/devices/cs_etm
> -    configurations  format  perf_event_mux_interval_ms  sinks  type
> -    events  nr_addr_filters  power
> +    cpu0  cpu2  events  nr_addr_filters		power  subsystem  uevent
> +    cpu1  cpu3  format  perf_event_mux_interval_ms	sinks  type
>  
> -Key directories here are 'configurations' - which lists the loaded
> -configurations, and 'events' - a generic perf directory which allows
> -selection on the perf command line.::
> +The key directory here is 'events' - a generic perf directory which allows
> +selection on the perf command line. As with the sinks entries, this provides
> +a hash of the configuration name.
>  
> -    $ ls configurations/
> -    autofdo
> -    $ cat configurations/autofdo
> -    0xa7c3dddd
> -
> -As with the sinks entries, this provides a hash of the configuration name.
>  The entry in the 'events' directory uses perfs built in syntax generator
>  to substitute the syntax for the name when evaluating the command::
>  
> -- 
> 2.17.1
> 
