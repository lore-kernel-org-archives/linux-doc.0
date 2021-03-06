Return-Path: <SRS0=F2iX=IE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC18C433DB
	for <linux-doc@archiver.kernel.org>; Sat,  6 Mar 2021 03:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 795FA65013
	for <linux-doc@archiver.kernel.org>; Sat,  6 Mar 2021 03:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhCFDF4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 22:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhCFDFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 22:05:19 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4961C061760
        for <linux-doc@vger.kernel.org>; Fri,  5 Mar 2021 19:05:18 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id q204so3370353pfq.10
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 19:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C3NLEHrnsN9ERk6AvvzJ5QN+B7qHrtPpBVa7hDiDUzw=;
        b=M1kxf5FFuBGbYf80LTez2uwZPcP1lv5lFoZXNRisoDLzEBxL3joYrkfG8RN+5hpe/9
         6Xz7y+vW23H60eGxTsn2ds+KgMAqSgEcZvR/Pv1INKDfQAowaHJBxE54hwq8JNFDwMDJ
         5NV0/J8ns3/MUu+sGdP3OapdxbpgsWQjwL5r47oU6Ixee4nV8BO5zi3OA0Lx0Hrk9jXI
         8S0uzY/xMqmEaOhc8vWhKZED4i3M3oWVFxScA3dgqmWmUpGbg7fbNQeZ4G2wgT4ai38r
         dk93z8mOfi0wNDipeanuJEid7/vsPzDKgi6hKIA8v4Pokh0za8FlmQawRsv6ZWFBqm3i
         2YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C3NLEHrnsN9ERk6AvvzJ5QN+B7qHrtPpBVa7hDiDUzw=;
        b=QgQwr/1W46bS92ShyYWHV5XAaWz20ZbWZLFn7M6XBMlNY438GjvKIMXFcIaPBYLMus
         CVV0rdKDB/h9X/OUUVGn8JTrBlv9Ku9/WjOuuwHoTPjwcsOlVa25ctYQZP0/+IGgCXlc
         t0DmMfjG2LfOZaRdZ0/v0GMVfjKmCuHvKfCdL5br3GriV3qBio7cM0vssYOKej6sGFIR
         6I+KdzHvmqQspE2KRUhIcpwKje9UGVP+u2xnOCRnU4eNLWKfUxcUfNurcOnpDrcts09n
         zwq59W9GNzgV9t0MRSDZmRxWucW6y3N0An4Xh5c9NeQKbFjEnGvwkc/UKeZOWvmvEnnb
         H92w==
X-Gm-Message-State: AOAM532BgUNVvL2Z0OSlXoeph7PuauhCsX5LdgNcEiVeN9JX07v9+QXp
        IAzqG5bnEeUWCUZsfiBhM/rQew==
X-Google-Smtp-Source: ABdhPJxPKR48rF0f9k74bRjzyzQ9501I3wZwxWa7o8VClbp2FhAkOOqOgBOKFQr1/IEEE1joJwICrA==
X-Received: by 2002:a63:e5d:: with SMTP id 29mr11134045pgo.450.1614999918067;
        Fri, 05 Mar 2021 19:05:18 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([103.136.125.226])
        by smtp.gmail.com with ESMTPSA id j35sm3929857pgj.45.2021.03.05.19.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 19:05:17 -0800 (PST)
Date:   Sat, 6 Mar 2021 11:05:12 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
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
Message-ID: <20210306030512.GD5478@leoy-ThinkPad-X240s>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-5-leo.yan@linaro.org>
 <20210208204641.GE2077938@xps15>
 <20210209015855.GA54680@leoy-ThinkPad-X240s>
 <YEJqiNkIsNWS0E2G@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEJqiNkIsNWS0E2G@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Arnaldo,

On Fri, Mar 05, 2021 at 02:29:44PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Tue, Feb 09, 2021 at 09:58:55AM +0800, Leo Yan escreveu:
> > On Mon, Feb 08, 2021 at 01:46:41PM -0700, Mathieu Poirier wrote:
> > > On Sat, Feb 06, 2021 at 11:08:29PM +0800, Leo Yan wrote:
> > > > From: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > > 
> > > > When set option with macros ETM_OPT_CTXTID and ETM_OPT_TS, it wrongly
> > > > takes these two values (14 and 28 prespectively) as bit masks, but
> > > > actually both are the offset for bits.  But this doesn't lead to
> > > > further failure due to the AND logic operation will be always true for
> > > > ETM_OPT_CTXTID / ETM_OPT_TS.
> > > > 
> > > > This patch defines new independent macros (rather than using the
> > > > "config" bits) for requesting the "contextid" and "timestamp" for
> > > > cs_etm_set_option().
> > > > 
> > > > [leoy: Extract the change as a separate patch for easier review]
> > > 
> > > This should go just above your name - see below.
> 
> I fixed this up and added this patch to my perf/urgent branch, for
> v5.12, since the kernel bits are upstream and this is a fix.

Yeah, it makes sense to pick this patch into perf/urgent branch since
it's a fixing patch.

Actually, this patch has been merged into the tmp.perf/core branch [1],
after you move it to the perf/urgent branch, I can confirm all other
patches for perf tool in this series have been merged into the
tmp.perf/core branch.

Thanks,
Leo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=tmp.perf/core&id=8c559e8d68630d64d932bada633705f6551427df
