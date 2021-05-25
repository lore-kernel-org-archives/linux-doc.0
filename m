Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48742C2B9F8
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 13:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C7D56141C
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 13:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhEYNCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 May 2021 09:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbhEYNCE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 May 2021 09:02:04 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00953C06138A
        for <linux-doc@vger.kernel.org>; Tue, 25 May 2021 06:00:33 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id v8so30286360qkv.1
        for <linux-doc@vger.kernel.org>; Tue, 25 May 2021 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y28saWW4RbQx7WFyioP30Xg1gnMSgGnjvex8TrgoAmQ=;
        b=SmfdiXxkr36Ea/32dUzc9goah/P/GDAmfDbfC23QxapWU+TYijU+tfipqVELo7UnNb
         kCjW74Q30JDB5fgFGsHqgJCEmxBDKG9IApVbKABuX/KOwPBR0S9vlJjymq+MrMGk51h3
         6ydpK/iuWp9N2XdHcbwhGAfcdpizobjsabPIpm0tzrNvmu9Bxekatij9qaP2uru6JWkm
         9Q/bdYcBQsR1yN1XYUK+IHclcbpDWwfEhDxrstMqMj+GfnNWOoDjxxvTrZpSn3pYUBV+
         tBirFOf/cNxOyaXXED4cDuzfXDrAdEmlM6leYVvOPcAJrsNxmqDTUvm5putYq5K3bzNj
         AP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y28saWW4RbQx7WFyioP30Xg1gnMSgGnjvex8TrgoAmQ=;
        b=tFR2rppOeZ1hvZKeH/CQznV19yjEM21fBKBPNLiwhRfHTwRmrk5qdpmAHMLSxbf+ro
         SixTKH7gyeJmCRHzvAZ21j2Brwkoa+0PvmTub6bGjJOc5qBbnqS/43lgBIn2elM2IhT8
         xDjUHrhSpDCV4QSgORWdJD3+tHOADl0PfV7KkiESxwkqKbUzXuAoorUCthmw8peY4IOQ
         0FrxtyItS7HV/ciIgTywzu778kS4pVBBdN2rzeclg7LLTP7ZIA9pxAk34c/FGMc1AzLK
         Q2E/gr5MVkeJwGnuHUfMSErkUPLsB21yfX4EdEPgjPl27qNI4ce3deRoYXJdWS1Kjr4d
         uo2g==
X-Gm-Message-State: AOAM532hydQsiU9AhKaErcbMb4opEMA6xjKK2f5JBZNeAy0B+4cIqyUw
        ZuzG1k91+ySpDqcrDvW9FGHP1Q==
X-Google-Smtp-Source: ABdhPJweYIK4QVt1oGBJstiLAQCOmbfbqmVA42aSLZNXQ/Hhy/JZ23PoCnqA1TrO1jkKqaIdstwAUA==
X-Received: by 2002:a37:9a44:: with SMTP id c65mr23489338qke.152.1621947632397;
        Tue, 25 May 2021 06:00:32 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:4f4e])
        by smtp.gmail.com with ESMTPSA id o5sm4565264qkl.25.2021.05.25.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:00:31 -0700 (PDT)
Date:   Tue, 25 May 2021 09:00:30 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     tj@kernel.org, lizefan.x@bytedance.com, mingo@redhat.com,
        peterz@infradead.org, shakeelb@google.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        minchan@kernel.org, corbet@lwn.net, bristot@redhat.com,
        paulmck@kernel.org, rdunlap@infradead.org,
        akpm@linux-foundation.org, tglx@linutronix.de, macro@orcam.me.uk,
        viresh.kumar@linaro.org, mike.kravetz@oracle.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 1/1] cgroup: make per-cgroup pressure stall tracking
 configurable
Message-ID: <YKz07nx3E8UEo1xa@cmpxchg.org>
References: <20210524195339.1233449-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524195339.1233449-1-surenb@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 24, 2021 at 12:53:39PM -0700, Suren Baghdasaryan wrote:
> PSI accounts stalls for each cgroup separately and aggregates it at each
> level of the hierarchy. This causes additional overhead with psi_avgs_work
> being called for each cgroup in the hierarchy. psi_avgs_work has been
> highly optimized, however on systems with large number of cgroups the
> overhead becomes noticeable.
> Systems which use PSI only at the system level could avoid this overhead
> if PSI can be configured to skip per-cgroup stall accounting.
> Add "cgroup_disable=pressure" kernel command-line option to allow
> requesting system-wide only pressure stall accounting. When set, it
> keeps system-wide accounting under /proc/pressure/ but skips accounting
> for individual cgroups and does not expose PSI nodes in cgroup hierarchy.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
