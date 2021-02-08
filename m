Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17FDC433DB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 20:52:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EDD064E6C
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 20:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbhBHUwb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 15:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbhBHUu5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 15:50:57 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AA7C061788
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 12:50:12 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id n10so11013393pgl.10
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 12:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u6IfnsP0ojYs9bBbfSN2AV8/9g+W1u8UiUTHBbYsgGw=;
        b=cQv3mgr+I3zhCFT27jgZlHwYAXYJDwaroszbLx6QqDLwyQmnVlY0Y0Glw2obdc57RY
         udJk04djvd1MFHz9FBcHt/iqZedYUoUUzeuT6QF2XYi+TcmKbWvwAnYJ+tr/rcaKXmMG
         QrBlFD3pRbnv0o0a3c44rv8+cT9PBbUYScAPifaZ1yTZUBcCiX4anhoJKeDGjAlSrVkU
         Mfw5srtAIVv1V9A1IeiXMWshduuQIvFB4L+bUsq98GaxRlUODGV7s9OwPztTQtcxUl5p
         R3tMFconIN91aGS5dVVjbko+vG16iqfboSDn3y/xCIw15+FbNcxec6KX2jBIZWkqQ8PP
         lOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u6IfnsP0ojYs9bBbfSN2AV8/9g+W1u8UiUTHBbYsgGw=;
        b=kSIMsq5xK6kq9VvawvIwyxVfJkth9f17XLD6cKjeRHXGD3pEavmZpvsrYLam9Dw9KJ
         gYICDNPSSNFQBMXFAjJmaqywDcShBW8lnJpZYnV0gjrKCTq44ype62MOA1ZXngyd4FJf
         +Wv/e39x1py8/a2uhzV2oi8/qQZnBGjDvirERWT9e7h4yRZEvbUWpLdbP5I8xUcOQoUF
         IWvTZwqNenMksYJvuF+QyViocBJEArowwaYGzhSjkZ1+SLuo6rYw3U0gvUvpXxX88aM3
         xPDI2mcpNZnJ4BdWWFuXAeVNO2gNCkBLF9eETJPPVLY3g7ujak1Q7w0b32+/xc2OTnvo
         pH9A==
X-Gm-Message-State: AOAM532p71Juc03sTv3wimuJOwT3upXgZ+1heJUnsRoC3832WdQPMeUH
        aY4t0AuNe1oB8WmmYHuJOfo5HA==
X-Google-Smtp-Source: ABdhPJwxIcjG3H2Xj53pz2Rdq3hRXSSTEx1KT0ox4L+e0zlymbOJcMAKaks/kgaUcljk1dDsbkcayw==
X-Received: by 2002:aa7:94a2:0:b029:1b8:eba7:773e with SMTP id a2-20020aa794a20000b02901b8eba7773emr19587102pfl.51.1612817411612;
        Mon, 08 Feb 2021 12:50:11 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o4sm164662pjs.57.2021.02.08.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 12:50:11 -0800 (PST)
Date:   Mon, 8 Feb 2021 13:50:09 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] Documentation: coresight: Add PID tracing
 description
Message-ID: <20210208205009.GF2077938@xps15>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-9-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206150833.42120-9-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 06, 2021 at 11:08:33PM +0800, Leo Yan wrote:
> After support the PID tracing for the kernel in EL1 or EL2, the usage
> gets more complicated.
> 
> This patch gives description for the PMU formats of contextID configs,
> this can help users to understand how to control the knobs for PID
> tracing when the kernel is in different ELs.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

As I indicated I have picked up the kernel patches in this set and there should
be a new patchset sent to Arnaldo.  The only thing left is this patch and I will
give time to Mike and Suzuki to look at it before I add it to my tree.

Thanks,
Mathieu

> ---
>  Documentation/trace/coresight/coresight.rst | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 0b73acb44efa..169749efd8d1 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -512,6 +512,38 @@ The --itrace option controls the type and frequency of synthesized events
>  Note that only 64-bit programs are currently supported - further work is
>  required to support instruction decode of 32-bit Arm programs.
>  
> +2.2) Tracing PID
> +
> +The kernel can be built to write the PID value into the PE ContextID registers.
> +For a kernel running at EL1, the PID is stored in CONTEXTIDR_EL1.  A PE may
> +implement Arm Virtualization Host Extensions (VHE), which the kernel can
> +run at EL2 as a virtualisation host; in this case, the PID value is stored in
> +CONTEXTIDR_EL2.
> +
> +perf provides PMU formats that program the ETM to insert these values into the
> +trace data; the PMU formats are defined as below:
> +
> +  "contextid1": Available on both EL1 kernel and EL2 kernel.  When the
> +                kernel is running at EL1, "contextid1" enables the PID
> +                tracing; when the kernel is running at EL2, this enables
> +                tracing the PID of guest applications.
> +
> +  "contextid2": Only usable when the kernel is running at EL2.  When
> +                selected, enables PID tracing on EL2 kernel.
> +
> +  "contextid":  Will be an alias for the option that enables PID
> +                tracing.  I.e,
> +                contextid == contextid1, on EL1 kernel.
> +                contextid == contextid2, on EL2 kernel.
> +
> +perf will always enable PID tracing at the relevant EL, this is accomplished by
> +automatically enable the "contextid" config - but for EL2 it is possible to make
> +specific adjustments using configs "contextid1" and "contextid2", E.g. if a user
> +wants to trace PIDs for both host and guest, the two configs "contextid1" and
> +"contextid2" can be set at the same time:
> +
> +  perf record -e cs_etm/contextid1,contextid2/u -- vm
> +
>  
>  Generating coverage files for Feedback Directed Optimization: AutoFDO
>  ---------------------------------------------------------------------
> -- 
> 2.25.1
> 
