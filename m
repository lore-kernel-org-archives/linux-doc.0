Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F582C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 01:59:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA81264E42
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 01:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhBIB7v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 20:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhBIB7s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 20:59:48 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BB5C061786
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 17:59:08 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id fa16so681289pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 17:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IfhGG5EFiF0+GV+cXx/c1hFmnHr7EDLtq1/XLJ8Wrqw=;
        b=Jb86j9QXa47sQXQPZMFKIS6GO/j/tpp7DNNjLp7FiLlvZfMGz2BF8Y9cWJgnmPGEyf
         RKPyfFKtylW0GKsgl/J43mzsL9rO4f7WcGzQkFTz6iwMs5kYT4oisj3encefwLZfyl+9
         MmFRqGbdc2eyEWr19Le16H1qVZrIC518kjatEDtY0Kplu8XhMzGxrIYEc5DEiAK+gbpn
         0FjmJpcbshb55HO403qGIPNSx8iCYU536AabTz+HniBQh7Ju/Pv8m5mSALtV5M6PC+rM
         hY2Z/vtbWSQHThyOOWRP8S9YwQe1Dsw2DgMjUXXbBw+mYwpVlrhSVuV3qxrNSZr24Rz8
         TTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IfhGG5EFiF0+GV+cXx/c1hFmnHr7EDLtq1/XLJ8Wrqw=;
        b=NhwiohJEz4jxAiZBomKabgIS41bmQWp6R4F/X+tx4KNBKRunWize7665bNSkI1BycX
         vhYnfJle/5hKwPapbwWGM5qcvXdEdowywLT5Tm9SNdjjRlqX8hiSdkYTOH97QNjaf3ZN
         iGTbO7NEYjTuET0UMReuY9nVOGkLky9PcF3DDcytdOGhEKqk1fKxL/13siHQ/z4cwYRP
         VVNB0rilUcsgAmkFDgdeIl3ckw9gmYF9RWDsitBBIgtV6XnxNx5ayznmEjDVuetPvrdc
         aGscb62mWvUyvUMv/U2N+Wo4U0dg1MPnxi/MdIALmv/i3ywq9l46Uxjh+NxZba7bw88Y
         QSGw==
X-Gm-Message-State: AOAM532yBCy8tfsfgFxO4NBW4Mi4glm15Evnk57B2+Gw7vVb+KxTTKv3
        z0JJGXPOQs/qxWMYjuxtRA7QGw==
X-Google-Smtp-Source: ABdhPJwilBT/p4PwScBoN7sJjtCO4XCBK8l7i0c62IBmgxUh2caNLJYPIxyvl5DOanOztniAJyYOVA==
X-Received: by 2002:a17:903:2305:b029:df:c991:8c49 with SMTP id d5-20020a1709032305b02900dfc9918c49mr19696460plh.8.1612835948392;
        Mon, 08 Feb 2021 17:59:08 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([198.44.243.100])
        by smtp.gmail.com with ESMTPSA id h10sm19090046pfn.213.2021.02.08.17.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 17:59:07 -0800 (PST)
Date:   Tue, 9 Feb 2021 09:58:55 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
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
Message-ID: <20210209015855.GA54680@leoy-ThinkPad-X240s>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-5-leo.yan@linaro.org>
 <20210208204641.GE2077938@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208204641.GE2077938@xps15>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 08, 2021 at 01:46:41PM -0700, Mathieu Poirier wrote:
> On Sat, Feb 06, 2021 at 11:08:29PM +0800, Leo Yan wrote:
> > From: Suzuki K Poulose <suzuki.poulose@arm.com>
> > 
> > When set option with macros ETM_OPT_CTXTID and ETM_OPT_TS, it wrongly
> > takes these two values (14 and 28 prespectively) as bit masks, but
> > actually both are the offset for bits.  But this doesn't lead to
> > further failure due to the AND logic operation will be always true for
> > ETM_OPT_CTXTID / ETM_OPT_TS.
> > 
> > This patch defines new independent macros (rather than using the
> > "config" bits) for requesting the "contextid" and "timestamp" for
> > cs_etm_set_option().
> > 
> > [leoy: Extract the change as a separate patch for easier review]
> 
> This should go just above your name - see below.
> 
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
>  Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>  [Extract the change as a separate patch for easier review]
>  Signed-off-by: Leo Yan <leo.yan@linaro.org>
>  Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
> > ---
> >  tools/perf/arch/arm/util/cs-etm.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> > index bd446aba64f7..c25c878fd06c 100644
> > --- a/tools/perf/arch/arm/util/cs-etm.c
> > +++ b/tools/perf/arch/arm/util/cs-etm.c
> > @@ -156,6 +156,10 @@ static int cs_etm_set_timestamp(struct auxtrace_record *itr,
> >  	return err;
> >  }
> >  
> > +#define ETM_SET_OPT_CTXTID	(1 << 0)
> > +#define ETM_SET_OPT_TS		(1 << 1)
> > +#define ETM_SET_OPT_MASK	(ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS)
> > +
> 
> I would much rather see this fixed with the BIT() macro as it is done in the
> rest of this set than defining new constant.
> 
> With the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> I have picked up the kernel portion of this set.  I suggest you fix the above
> and send another revision to Arnaldo with my RBs.

Will do this.  Thanks for suggestion, Mathieu.

Leo

[...]
