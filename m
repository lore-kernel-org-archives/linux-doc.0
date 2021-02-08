Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAF5C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 17:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22D8B64E5D
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 17:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhBHRhZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbhBHRfV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 12:35:21 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB2FC061788
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 09:34:30 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id gx20so9202221pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 09:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QAxmqoEOSrSGuDIGX8UTYzw6McBlWP+GhOSfkix9wjk=;
        b=GYKgxaI9CMbwk19YePl5gkV9bFRlQlO+2w4ie9BtNOhNrbyAWWGR+Y+3iewmYreiwM
         AcuaTVg0YMEGW4+If05PFEmmP6byd2Bkvgc1rEpIl0waXziJKxojCrDTvk3Hfr7DekQs
         voaohLE/fiu8RgJr439mqQRGm+BCqa6PHfvgWCQbZmdP429FcFuKdNCn4mBJ8ODJ+l6e
         EKAgGIRwR1p2R6y5+ueeLFMmmpRsnQaL/S1Bdgs5YX1wL9gx7fOCDK6QPr9JkG7cxIrU
         SxT+REOCJhe/o6zBXD/r/iTjFvGjblVd5gt6hhApMm6ZhSpxt5obkRlAjOGkCN9LAMuW
         as7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QAxmqoEOSrSGuDIGX8UTYzw6McBlWP+GhOSfkix9wjk=;
        b=VSR+uNxPjTP9UHgfe4VJ0wdw02GWYgiyep877S6MI/aNq1gdgo1+wrzsH4ZWEPCvR6
         JvzIJZSf/7vyTRfNqDuXPPdELyLSAXUj7w4ThPHfzSiVNpevKguhByHH8Ck0uf43g6/K
         bJmkURQIVcmysi1vX0gvrnB1xIHBHX+eMEoRRDDQUr1/M7PyALtDfkvQdYnaSX3Nq041
         RQDT+FNQ6eE0y+6HS13WLSjKEcnJqL6F8eNqfWw8D+Cb6q8Tk98Yoy6p5iFnxtMTVIrK
         NDxfUjP5sVNwFYN7eT4ZU5pR8iHUZdsP6G2eYRaYK33l96s7heFmXMJ/8PJUqOaCdk6v
         dVQQ==
X-Gm-Message-State: AOAM531N+eT7tGGspAwFPYTpvUQCpnnqf5saU1k4Yr3l6O+X2gzXgf/H
        CkHdBtujlFzkLwToFnvbI0UyLQ==
X-Google-Smtp-Source: ABdhPJxAHbPUbnYUWT4fo9NEUczHKy8t+ddayCH4TfZBjZgySsIvYVhlFut7hHzwwykqsbkh6CuQoQ==
X-Received: by 2002:a17:90b:4a0b:: with SMTP id kk11mr18055807pjb.95.1612805669921;
        Mon, 08 Feb 2021 09:34:29 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id f127sm14038890pgc.48.2021.02.08.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 09:34:28 -0800 (PST)
Date:   Mon, 8 Feb 2021 10:34:26 -0700
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
Subject: Re: [PATCH v3 2/8] tools headers UAPI: Update tools' copy of
 linux/coresight-pmu.h
Message-ID: <20210208173426.GA2077938@xps15>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-3-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206150833.42120-3-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 06, 2021 at 11:08:27PM +0800, Leo Yan wrote:
> To get the changes in the commit:
> 
>   "coresight: etm-perf: Clarify comment on perf options".
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  tools/include/linux/coresight-pmu.h | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
> index b0e35eec6499..5dc47cfdcf07 100644
> --- a/tools/include/linux/coresight-pmu.h
> +++ b/tools/include/linux/coresight-pmu.h
> @@ -10,11 +10,18 @@
>  #define CORESIGHT_ETM_PMU_NAME "cs_etm"
>  #define CORESIGHT_ETM_PMU_SEED  0x10
>  
> -/* ETMv3.5/PTM's ETMCR config bit */
> -#define ETM_OPT_CYCACC  12
> -#define ETM_OPT_CTXTID	14
> -#define ETM_OPT_TS      28
> -#define ETM_OPT_RETSTK	29
> +/*
> + * Below are the definition of bit offsets for perf option, and works as
> + * arbitrary values for all ETM versions.
> + *
> + * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
> + * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
> + * directly use below macros as config bits.
> + */
> +#define ETM_OPT_CYCACC		12
> +#define ETM_OPT_CTXTID		14
> +#define ETM_OPT_TS		28
> +#define ETM_OPT_RETSTK		29
>  
>  /* ETMv4 CONFIGR programming bits for the ETM OPTs */
>  #define ETM4_CFG_BIT_CYCACC	4
> -- 
> 2.25.1
> 
