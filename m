Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0E2C2D0A8
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 20:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA3CB2176B
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 20:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kYcTwQwW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgIWUyl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 16:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgIWUyl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 16:54:41 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FF9C0613CE
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 13:54:41 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t7so371432pjd.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aK2OP1WSrHtWE6Ww4bs+X3aVUzVJGpCVpz2gRcHtwA0=;
        b=kYcTwQwWMqftdxwhzWWgowTZfimTD7KqRn1l9YrD90w9ex31KHZLiIHTvhuLGG4vxT
         2qxQyiHIs3uikG4ZbHrKEUFuOazl+d1TBrTT0Jnbe2g36MGHQBpdVPhU5j8pdkJcUsFA
         ENeTY3YOtFGC5d9p0ZHaVx+EcExvEVXsKqWL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aK2OP1WSrHtWE6Ww4bs+X3aVUzVJGpCVpz2gRcHtwA0=;
        b=hM88min07iL4UmxHJzYE7I6F9Nxy/8MXNGX8olUdTHre9WfgcCo/90vBQVQoJT9Jlc
         gwyFNzMJRVoAS8il7o2c6mqkNG+i8dvNkBdzZ6SJY0rKrIZDjZJLfTTwhbbGrIIeZXle
         /HXIt9v6F4BLkcJ6U2X/NAP2M/e8bCrKW3UGrN2sB/viNBbPSMrtExaqOKoxFYhafj+y
         KB91aKOJla9YIETsxtgtrFi8QITWNYoCkCoswEBm7YTLjL6ROrtLhHEeM3U7UYCO0wX2
         S4KZn5XA/QVXT6K8q6zdA1IitzBQg9Cr6ZJ6pZUdgz/x9pV3vT/5dmxW3owqm8O7TNlU
         mbXQ==
X-Gm-Message-State: AOAM53076f8hFo6vIfnoI5Q5v67eA2RdPLSJeLmSCMXBLupVkMHkxdvi
        bR8yD9kdQD9vYWzhvHGr00H4wQ==
X-Google-Smtp-Source: ABdhPJw0q2ghXSmmnijYZ6myPLm27BfHwbtqDByFX1uiHKkHZPtlQ7zUJIY6tyEaoFCMKKilQgaB4Q==
X-Received: by 2002:a17:902:6b05:b029:d2:8b5:14 with SMTP id o5-20020a1709026b05b02900d208b50014mr1518642plk.80.1600894480529;
        Wed, 23 Sep 2020 13:54:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o15sm656685pgi.74.2020.09.23.13.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:54:39 -0700 (PDT)
Date:   Wed, 23 Sep 2020 13:54:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] counters: Introduce counter and counter_atomic
Message-ID: <202009231351.2D6AC4010E@keescook>
References: <cover.1600816121.git.skhan@linuxfoundation.org>
 <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
 <202009231152.5023C4656F@keescook>
 <20200923193448.GE199068@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923193448.GE199068@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 23, 2020 at 09:34:48PM +0200, Greg KH wrote:
> On Wed, Sep 23, 2020 at 12:04:08PM -0700, Kees Cook wrote:
> > On Tue, Sep 22, 2020 at 07:43:30PM -0600, Shuah Khan wrote:
> > > Introduce Simple atomic and non-atomic counters.
> > > 
> > > There are a number of atomic_t usages in the kernel where atomic_t api
> > > is used strictly for counting and not for managing object lifetime. In
> > > some cases, atomic_t might not even be needed.
> > 
> > Thank you for working on a counter API! I'm glad to see work here,
> > though I have some pretty significant changes to request; see below...
> > 
> > > 
> > > The purpose of these counters is twofold: 1. clearly differentiate
> > > atomic_t counters from atomic_t usages that guard object lifetimes,
> > > hence prone to overflow and underflow errors. It allows tools that scan
> > > for underflow and overflow on atomic_t usages to detect overflow and
> > > underflows to scan just the cases that are prone to errors. 2. provides
> > > non-atomic counters for cases where atomic isn't necessary.
> > > 
> > > Simple atomic and non-atomic counters api provides interfaces for simple
> > > atomic and non-atomic counters that just count, and don't guard resource
> > > lifetimes. Counters will wrap around to 0 when it overflows and should
> > > not be used to guard resource lifetimes, device usage and open counts
> > > that control state changes, and pm states.
> > > 
> > > Using counter_atomic to guard lifetimes could lead to use-after free
> > > when it overflows and undefined behavior when used to manage state
> > > changes and device usage/open states.
> > > 
> > > Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> > 
> > I would really like these APIs to be _impossible_ to use for object
> > lifetime management. To that end, I would like to have all of the
> > *_return() functions removed. It should be strictly init, inc, dec,
> > read.
> > 
> > > +There are a number of atomic_t usages in the kernel where atomic_t api
> > > +is used strictly for counting and not for managing object lifetime. In
> > > +some cases, atomic_t might not even be needed.
> > 
> > Why even force the distinction? I think all the counters should be
> > atomic and then there is no chance they will get accidentally used in
> > places where someone *thinks* it's safe to use a non-atomic. So,
> > "_atomic" can be removed from the name and the non-atomic implementation
> > can get removed. Anyone already using non-atomic counters is just using
> > "int" and "long" anyway. Let's please only create APIs that are always
> > safe to use, and provide some benefit over a native time.
> 
> For "statistics", why take the extra overhead for an atomic variable
> just to be able to show to a debugging file the number of USB packets
> have been sent through the system (a current use of an atomic variable
> for some odd reason...)
> 
> And really, a "int" should be pretty safe to write from multiple places,
> you aren't going to get "tearing" on any processors that run Linux,
> worst case you get a stale value when reading them.
> 
> So I would argue that the default for a counter be just an int, not
> atomic, as odds are, most atomics are not really needed for this type of
> thing at all.

If the atomicity isn't needed, then they can just use an int. ;)

I think the _counter_ type should be robust. We're specifically looking
at replacing the users who are already using atomic_t for counting. The
idea is to separate all the atomic_t doing ref counting into refcount_t
and all the atomic_t doing statistics into "struct counter", and then
what's left can meaningfully be reasoned about. i.e. "why is this a raw
atomic)t?"

But creating "struct counter" with a non-atomic API doesn't make sense
to me. And it certainly doesn't make sense for replacing existing
atomic_t statistics use cases.

-- 
Kees Cook
