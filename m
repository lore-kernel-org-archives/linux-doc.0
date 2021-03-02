Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3242C4160E
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C54E160241
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580418AbhCBSDB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1839218AbhCBQGJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 11:06:09 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45097C06178A
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 07:56:08 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id 2so5999948qtw.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 07:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tNdOP429TQBqbFjtRfcboNnC/yDVMr5sai/pD5T/IRg=;
        b=IlpWwYdHCRDOk3kWpi+d9K5sL2BkH9JZ1CEz1ZKimdPVIRwTuGRq3u8IVkuopTydJj
         arkp2Jdxkb6AEwpjHEzEBCdWsa3q3RVDDAD6bSnR4o1EyuK4taQfQjgDPmaAJ9E1rc7M
         d4jHzAyynuq2BzJCokhaQdMM8AN7WuMyNhHQlCWn80oKplc03XM+gFnGwD3Z51x4lbml
         2TCJwmgtS2OfBFJdEHlD5w8ufPSSU3VTgvHICNQAxeKAsegXHKO2hfv/m04PEbTEcSNF
         E3mw5ycnDw+JDvecUfy1I1YGGLn5VeegekbNe2l96F37r1kFSVfRi5rflI3VL2KtZugd
         9xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tNdOP429TQBqbFjtRfcboNnC/yDVMr5sai/pD5T/IRg=;
        b=diMXELIWrcss7X0e3NyfBJcRPupuDxe8bSfXAHUUj9TNvJ4LMN10n7CfHwt+XhUByg
         r8z9YJNYlquyh8PAxASVvUa1E/Wqs9d02cfhyIku9RfjBsv+44Nxo7ABnD390ADKdGdD
         70dmg3tic8YbDj+cqxAdr4Nynmcb/i99ZaqC2EW+jrQeFd7eetOrJkfxUDr0tFy14xb4
         3Nk1tcuH1Ptd9N1xmoaZ/dI8825IvWR6s3jS3xP4JsrunfwkUwLVRzPceeKFQyPFLOnw
         zFVKGDyHl5rcHALmChszg92iVqeaDPuS/FIN0F+nTprfFBZdG0wYF/jlNfxCQrgPwDrt
         /JMA==
X-Gm-Message-State: AOAM530qKaRKeK2kqzneoejyTCXVvhs8aScCwDPewN7WdkI7CNORSEc3
        lfZiJYJcvyog3bTLbtJwZ5gOyA==
X-Google-Smtp-Source: ABdhPJyOfWYuIhZl4tG2VoD6q45/j1mxf/N5hHiy8YupUY6yiNz/e3N1wA6PcoAeeK96MehQQtO/QA==
X-Received: by 2002:ac8:7392:: with SMTP id t18mr17887295qtp.104.1614700567462;
        Tue, 02 Mar 2021 07:56:07 -0800 (PST)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
        by smtp.gmail.com with ESMTPSA id o7sm1251394qkb.104.2021.03.02.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 07:56:06 -0800 (PST)
Date:   Tue, 2 Mar 2021 10:56:05 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     pintu@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, jaewon31.kim@samsung.com,
        yuzhao@google.com, shakeelb@google.com, guro@fb.com,
        mchehab+huawei@kernel.org, xi.fengfei@h3c.com,
        lokeshgidra@google.com, nigupta@nvidia.com, famzheng@amazon.com,
        andrew.a.klychkov@gmail.com, bigeasy@linutronix.de,
        ping.ping@gmail.com, vbabka@suse.cz, yzaikin@google.com,
        keescook@chromium.org, mcgrof@kernel.org, corbet@lwn.net,
        pintu.ping@gmail.com
Subject: Re: [PATCH] mm: introduce clear all vm events counters
Message-ID: <YD5gFYalXJh0dMLn@cmpxchg.org>
References: <1614595766-7640-1-git-send-email-pintu@codeaurora.org>
 <YD0EOyW3pZXDnuuJ@cmpxchg.org>
 <419bb403c33b7e48291972df938d0cae@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <419bb403c33b7e48291972df938d0cae@codeaurora.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 02, 2021 at 04:00:34PM +0530, pintu@codeaurora.org wrote:
> On 2021-03-01 20:41, Johannes Weiner wrote:
> > On Mon, Mar 01, 2021 at 04:19:26PM +0530, Pintu Kumar wrote:
> > > At times there is a need to regularly monitor vm counters while we
> > > reproduce some issue, or it could be as simple as gathering some
> > > system
> > > statistics when we run some scenario and every time we like to start
> > > from
> > > beginning.
> > > The current steps are:
> > > Dump /proc/vmstat
> > > Run some scenario
> > > Dump /proc/vmstat again
> > > Generate some data or graph
> > > reboot and repeat again
> > 
> > You can subtract the first vmstat dump from the second to get the
> > event delta for the scenario run. That's what I do, and I'd assume
> > most people are doing. Am I missing something?
> 
> Thanks so much for your comments.
> Yes in most cases it works.
> 
> But I guess there are sometimes where we need to compare with fresh data
> (just like reboot) at least for some of the counters.
> Suppose we wanted to monitor pgalloc_normal and pgfree.

Hopefully these would already be balanced out pretty well before you
run a test, or there is a risk that whatever outstanding allocations
there are can cause a large number of frees during your test that
don't match up to your recorded allocation events. Resetting to zero
doesn't eliminate the risk of such background noise.

> Or, suppose we want to monitor until the field becomes non-zero..
> Or, how certain values are changing compared to fresh reboot.
> Or, suppose we want to reset all counters after boot and start capturing
> fresh stats.

Again, there simply is no mathematical difference between

	reset events to 0
	run test
	look at events - 0

and

	read events baseline
	run test
	look at events - baseline

> Some of the counters could be growing too large and too fast. Will there be
> chances of overflow ?
> Then resetting using this could help without rebooting.

Overflows are just a fact of life on 32 bit systems. However, they can
also be trivially handled - you can always subtract a ulong start
state from a ulong end state and get a reliable delta of up to 2^32
events, whether the end state has overflowed or not.

The bottom line is that the benefit of this patch adds a minor
convenience for something that can already be done in userspace. But
the downside is that there would be one more possible source of noise
for kernel developers to consider when looking at a bug report. Plus
the extra code and user interface that need to be maintained.

I don't think we should merge this patch.
