Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E02567D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 22:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392376AbfGWWXp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 18:23:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44278 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbfGWWXp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jul 2019 18:23:45 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so20106835pgl.11
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2019 15:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4dVf29ZcpSVwk+wf2XXFiYUsmnLURtHLTcUwHGDctgs=;
        b=mKfQrgZH4urgsDsGJ7VgdXJjU2+ey7ZEBJRkId+E9EA2DwPgMTfd0w3mx0YpvYbDBk
         6Hxb19kjJn2P4LmT8RVunb3SWGwQWWhltD9hoYDBYN3DpVaNH6GaaQ4HA2jd3H5zko8v
         YS4q7hEUaVQPsvfTWmeAQMxIusbVsmM4WuUU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4dVf29ZcpSVwk+wf2XXFiYUsmnLURtHLTcUwHGDctgs=;
        b=mroQj5rr6exP7ev+hjvncBeJi3nLINOL+xb35IcmoeB00yJ65k1VqcAo4LaDrGDYak
         SgVbHt4j2pcfI1Q5smiZPAhWF3YtlaJWh8i/RuxdW5ADWltOtpU1o8/x/24uzHjDaeTj
         9/q92BGC9UwgnFZJqqa9xfQwIgslyaIPzvEToFvwgCsC0OzPbafHClGG1cTQOYrNep8A
         KMQxtlv6KNB4Qo53LJ4Nk55e2fPx4svIFRJDAiQ3gq9UhKrR+5dMlaZrQ5a4UyUxBPdW
         k9ULbWpbzezM21eL5m1yaZ5ZhfmBw5Xol5leLECFJTJr2xQKMkAWuGau3D7DqwCBTwJ1
         4Adg==
X-Gm-Message-State: APjAAAVa48Y9XKgaN3St+lg757o9b+8hG9fAMErn9pWtmOSpd0Ev1xhf
        HNpJ90dApu+0pL8PJWIPdWPHng==
X-Google-Smtp-Source: APXvYqy9WkSt/8srF0QZ3mt1p4nRA9Uc/JH89PMYcwm6549t32se0npxhWekUjS1CiDtbevVGfSTOQ==
X-Received: by 2002:a17:90a:974b:: with SMTP id i11mr83444934pjw.21.1563920624498;
        Tue, 23 Jul 2019 15:23:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u16sm42936978pjb.2.2019.07.23.15.23.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2019 15:23:43 -0700 (PDT)
Date:   Tue, 23 Jul 2019 15:23:42 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Solar Designer <solar@openwall.com>
Cc:     Sasha Levin <sashal@kernel.org>, corbet@lwn.net, will@kernel.org,
        peterz@infradead.org, gregkh@linuxfoundation.org,
        tyhicks@canonical.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/security-bugs: provide more information
 about linux-distros
Message-ID: <201907231520.D659BD32@keescook>
References: <20190717231103.13949-1-sashal@kernel.org>
 <201907181457.D61AC061C@keescook>
 <20190719003919.GC4240@sasha-vm>
 <201907181833.EF0D93C@keescook>
 <20190719084215.GA24691@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719084215.GA24691@openwall.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 19, 2019 at 10:42:15AM +0200, Solar Designer wrote:
> - The reporter having been directed to post from elsewhere (and I
> suspect this documentation file) without being aware of list policy.

Perhaps specify "linux-distros@" without a domain, so it's more clear?
Or re-split the Wiki into two pages to avoid confusion?

> - The reporter not mentioning (and sometimes not replying even when
> asked) whether they're also coordinating with security@k.o or whether
> they want someone on linux-distros to help coordinate with security@k.o.
> (Maybe this is something we want to write about here.)

Yeah, that seems useful to include in both places.

> - The Linux kernel bug having been introduced too recently to be of much
> interest to distros.

Right; that'd be good to add as well. I see a lot of panic on twitter,
for example, about bugs that only ever existed in -rc releases.

> > Sending to the distros@ list risks exposing Linux-only flaws to non-Linux
> > distros.
> 
> Right.
> 
> > This has caused leaks in the past
> 
> Do you mean leaks to *BSD security teams or to the public?  I'm not
> aware of past leaks to the public via the non-Linux distros present on
> the distros@ list.  Are you?

I don't know the origin of the leaks, but it only happened when distros@
was used instead of linux-distros@. I think this happened with DirtyCOW,
specifically.

-- 
Kees Cook
