Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E71C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 20:50:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7740A64DED
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 20:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhBHUuL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 15:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbhBHUrA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 15:47:00 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26B4C06178C
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 12:46:44 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u11so8462736plg.13
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 12:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nydmi+Z7dBjgeCcCDgZoX6CcBj+BLGtfo85qqn1BPpg=;
        b=sN9kwECThWrCOEMJbhZDr20zfKqu4hiYVFCtMtzV/d4T8agGwPvkVRAm1jaVsnFLMA
         zq0S4sxSVtrXfCovi0X2W4vzVWUQXpiMXrgUKX/Loo0bgfm2e3HUwVocjvQCtTsyDzGN
         w7z/Jmljowu0s1/nqJ2y5xmnJwYZ7tsiUv452/U+5D89C6uoOIeo4ToFm2xVlqJWrCTc
         sDTzf0q8aBUjyp/jSW1j5BC6qelbYAZ6AGQ1EB1ooSi7VEIKfx11C18yCs4hLt+omeAn
         mOmclgiZrT4XlADRZQSlmoHUBMUfEQ9kZYvQF5Tutgl1Yc/3QUv9sG0st5eNuG3cBtmP
         +Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nydmi+Z7dBjgeCcCDgZoX6CcBj+BLGtfo85qqn1BPpg=;
        b=SjExlPHFT+vWFrXsVjv3Zn30kYWajEWAPnrUnXNx7KbQN48mQVx3Ind/ivQFLp8BH1
         409kAUPhiXvT+R1Tk90AaEYEV1uKO68n3k8JagD3mWrx9Tegpge6kf4QDLl9v5/UrG6m
         Pujo8BAGWTh7nCa+3O2YMjMtbgFHcIqLgcnO9ZyAynF5sHP3ov6+4MNnp6mLWoNk/HOx
         smSCnVksjZodbsX/ssekacTEzFHgHCv26oszfNNhKJy5Nj8u7QeUiSUQXr1pbivxHJqE
         bSiPXOB2pQtBjfrEj3aplhJnEITLD5KxhKlNF/pgcOt6mGzp26FYDSUODi/w8kLZ7+RE
         YYyg==
X-Gm-Message-State: AOAM532mwSHFVMW88fWgPSxSen4HDOP0uExkd1caAbcYGMDQKFdugeAf
        epbCd39Dw8MsN0dGPeqA91yqcw==
X-Google-Smtp-Source: ABdhPJxT8tmoBFSFsgvBkPIWKmaKICYyejFedyDus9d4qQqOPYyHjB6zplHhLeIiABk8big74avaow==
X-Received: by 2002:a17:90b:83:: with SMTP id bb3mr615336pjb.162.1612817204210;
        Mon, 08 Feb 2021 12:46:44 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t25sm6741032pgo.87.2021.02.08.12.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 12:46:43 -0800 (PST)
Date:   Mon, 8 Feb 2021 13:46:41 -0700
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
Subject: Re: [PATCH v3 4/8] perf cs-etm: Fix bitmap for option
Message-ID: <20210208204641.GE2077938@xps15>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-5-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206150833.42120-5-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 06, 2021 at 11:08:29PM +0800, Leo Yan wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> When set option with macros ETM_OPT_CTXTID and ETM_OPT_TS, it wrongly
> takes these two values (14 and 28 prespectively) as bit masks, but
> actually both are the offset for bits.  But this doesn't lead to
> further failure due to the AND logic operation will be always true for
> ETM_OPT_CTXTID / ETM_OPT_TS.
> 
> This patch defines new independent macros (rather than using the
> "config" bits) for requesting the "contextid" and "timestamp" for
> cs_etm_set_option().
> 
> [leoy: Extract the change as a separate patch for easier review]

This should go just above your name - see below.

> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

 Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
 [Extract the change as a separate patch for easier review]
 Signed-off-by: Leo Yan <leo.yan@linaro.org>
 Reviewed-by: Mike Leach <mike.leach@linaro.org>

> ---
>  tools/perf/arch/arm/util/cs-etm.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> index bd446aba64f7..c25c878fd06c 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -156,6 +156,10 @@ static int cs_etm_set_timestamp(struct auxtrace_record *itr,
>  	return err;
>  }
>  
> +#define ETM_SET_OPT_CTXTID	(1 << 0)
> +#define ETM_SET_OPT_TS		(1 << 1)
> +#define ETM_SET_OPT_MASK	(ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS)
> +

I would much rather see this fixed with the BIT() macro as it is done in the
rest of this set than defining new constant.

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

I have picked up the kernel portion of this set.  I suggest you fix the above
and send another revision to Arnaldo with my RBs.

>  static int cs_etm_set_option(struct auxtrace_record *itr,
>  			     struct evsel *evsel, u32 option)
>  {
> @@ -169,17 +173,17 @@ static int cs_etm_set_option(struct auxtrace_record *itr,
>  		    !cpu_map__has(online_cpus, i))
>  			continue;
>  
> -		if (option & ETM_OPT_CTXTID) {
> +		if (option & ETM_SET_OPT_CTXTID) {
>  			err = cs_etm_set_context_id(itr, evsel, i);
>  			if (err)
>  				goto out;
>  		}
> -		if (option & ETM_OPT_TS) {
> +		if (option & ETM_SET_OPT_TS) {
>  			err = cs_etm_set_timestamp(itr, evsel, i);
>  			if (err)
>  				goto out;
>  		}
> -		if (option & ~(ETM_OPT_CTXTID | ETM_OPT_TS))
> +		if (option & ~(ETM_SET_OPT_MASK))
>  			/* Nothing else is currently supported */
>  			goto out;
>  	}
> @@ -406,7 +410,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>  		evsel__set_sample_bit(cs_etm_evsel, CPU);
>  
>  		err = cs_etm_set_option(itr, cs_etm_evsel,
> -					ETM_OPT_CTXTID | ETM_OPT_TS);
> +					ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS);
>  		if (err)
>  			goto out;
>  	}
> -- 
> 2.25.1
> 
