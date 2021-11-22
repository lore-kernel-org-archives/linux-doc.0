Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC36DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 16:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbhKVQ6x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 11:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbhKVQ6x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 11:58:53 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91CDC061574
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 08:55:46 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v23so14328528pjr.5
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 08:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I2553qIarNCernYxctB9Y2Bml9LBby9Liqv9fMDtgek=;
        b=KeY5meRgskub//iJ88X3zunTLCkP58+KjHhfAsr+mdPPkWukZJP9IPS53yoJSVluWO
         3wM7Jd/a6lJ5cVH1A5T7h6SHq5dULMNGVwGOBqHA2niQW6U0M4eDlpaJ/8NRcmyjHGjf
         ENcfT+F8EJHcTJuCMgqhcQzWZrdoTHLgSHu2A4Igj13ZJaxfLlf3KQTmfnBKxV/u9/eL
         vCZHMAzSvT1K/MLgNU2AoFa7TN0y+q8ZnIxquEQb9qqU0p5Np6csvFtxqCi4pUGZSUfO
         Q0hD6NZok7fNPHl4Ng0/XJJkJprw6UfjUIiVpdjUUc+JyfSxABsySTcjt4mcP8yk4Qe5
         X1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I2553qIarNCernYxctB9Y2Bml9LBby9Liqv9fMDtgek=;
        b=GcjU+v8DcBly3QOwJuuHJvRmqK9TCPmBfSww23h1WwoE55AoWYhHWYWGMIFiyNtav4
         +ip4hI+sfau15boPeu6aZfMwzSYcGDt+/HdLctqfVuQ66UDMtF5ryRJ5GT91PnREYnNE
         cwW8k2sjBN1ALhWKGqIHBV+uS/qY8ke3KIeNE37UjbOQfCewXegl99RNzzrr6gwn8TYE
         rdmiBBj5hHTrsQ71chY28oUVGHcM2Hojh0OVi9LJLcuiCVkcyoKfoEl3XvsO6Tubbk6C
         KXXAZN9Ctvlv8c0RSsCdaaipSUpdZB89Lwd85NHIbdp4zG/3tMHbcggrX9Ctv0PUAcEi
         HGrw==
X-Gm-Message-State: AOAM530V1HDcYU6cHm2ivQ6xCs7EewnhpXnaK6adhqTb62ZeVayho+8L
        J7v53Ei610AQPS/83Iz3CGaX0g==
X-Google-Smtp-Source: ABdhPJzUwrqI0/KscLQnAHPw/g9rf2SzkqyHYWV9FenVsX0THxmmH0BwLicTMdiGkQAc2QWHVr5GHw==
X-Received: by 2002:a17:903:2082:b0:142:7dff:f7dc with SMTP id d2-20020a170903208200b001427dfff7dcmr109500313plc.46.1637600146462;
        Mon, 22 Nov 2021 08:55:46 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id h186sm9078461pfg.59.2021.11.22.08.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 08:55:45 -0800 (PST)
Date:   Mon, 22 Nov 2021 09:55:43 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, corbet@lwn.net, suzuki.poulose@arm.com
Subject: Re: [PATCH] Documentation: coresight: Fix documentation issue
Message-ID: <20211122165543.GB2686563@p14s>
References: <20211117164220.14883-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117164220.14883-1-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Good day Mike,

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

I have applied your patch.

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
