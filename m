Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 295F57DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Apr 2018 15:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752068AbeDEPSJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Apr 2018 11:18:09 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36937 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750835AbeDEPSG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Apr 2018 11:18:06 -0400
Received: by mail-wm0-f68.google.com with SMTP id r131so8184511wmb.2;
        Thu, 05 Apr 2018 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SvEHqPahVk8hiG8yd+DYmASqVFdnmuIuOO0oaUQ3+co=;
        b=fzrB3OAzJ+brcajRioMzYUTMCREiaXPkZpKCVj2se761I5T7bciH4lZERY/2XySuWp
         baA4FChwR2Fg/SKkxQ2pOkbOmCF4VLC9KhLqLlMFzstDbHBmSxAslJsuGTlA/IgE/GbD
         6R6S2tta//i2a9gZ/PVVq4ALx69yllDBHL/xslrRSqGaOrZR4qvXyAfHCdaZOr8zdDyO
         Oqk4jSC6+k3ragNF4uRS6sd3QqtuvdlbDTUb6xbuzq+TM2af+UanGqWF2XSjPiJvQJxA
         uGKBEvUHU3fr0M63lIaHCJtqjBCqLUDUEH7r0xEQlGqI6FmHd0ayyDXc24hxD3cIj0oe
         JgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=SvEHqPahVk8hiG8yd+DYmASqVFdnmuIuOO0oaUQ3+co=;
        b=tH1u75D67be+ffKdqatbetPw7/taPv4Lp1ZkoyCtfhl+GSrJiRJttfMCkpRwGqKJqK
         Grdco7Nza42qquqSER1GAGhfvq2NN3Hniy79tC/yrMSE8O9Yg2BBscBSlXsJIE2kowIr
         hDowbjpqp/4gU01JPYZNLPeLqrWD+F/1AQQoPNIBJdRQ5FmVBZf9tKWTpc5bn5Lf73Q8
         GjuS3bRY5dwecZdm8p3MNTHjzHdsd/Ah3fREEaIrYz03QsBAF/jj1529cFT1psbchM8X
         qgbY5PACt07Iv6MW8biKNBf4GbchVj31Rae+DOPcPHGpGJUyoZ0lTkmQTqIJgP2CNnu3
         nWCg==
X-Gm-Message-State: ALQs6tBFQLAohjqZL3lyGN6QrH+zXHLQsadaeKtI5Misrg4jeTiS3Id5
        zfPE9qBMXGdC/r2uQWFn1xTPlg==
X-Google-Smtp-Source: AIpwx4/ib85py1rQ7AiYMt7OQWVT1ZSFs2knXtH1jscumu7FhhxIcBVcAL3lSaRvwaZYSTujAoAwnQ==
X-Received: by 10.28.50.130 with SMTP id y124mr10015882wmy.22.1522941485103;
        Thu, 05 Apr 2018 08:18:05 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id z16sm11635997wrc.70.2018.04.05.08.18.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Apr 2018 08:18:04 -0700 (PDT)
Date:   Thu, 5 Apr 2018 17:18:02 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH 0/3] Documentation/features: Provide and apply
 "features-refresh.sh"
Message-ID: <20180405151802.uvceareck465inqs@gmail.com>
References: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180404045632.uniwfrl32bjmsn5g@gmail.com>
 <20180404130357.GA9125@andrea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180404130357.GA9125@andrea>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


* Andrea Parri <andrea.parri@amarulasolutions.com> wrote:

> On Wed, Apr 04, 2018 at 06:56:32AM +0200, Ingo Molnar wrote:
> > 
> > * Andrea Parri <andrea.parri@amarulasolutions.com> wrote:
> > 
> > > In Ingo's words [1]:
> > > 
> > >   "[...]  what should be done instead is to write a script that refreshes
> > >    all the arch-support.txt files in-place. [...]
> > > 
> > >    It's OK for the script to have various quirks for weirdly implemented
> > >    features and exceptions: i.e. basically whenever it gets a feature wrong,
> > >    we can just tweak the script with quirks to make it all work out of box.
> > > 
> > >    [...]  But in the end there should only be a single new script:
> > > 
> > >      Documentation/features/scripts/features-refresh.sh
> > > 
> > >    ... which operates on the arch-support.txt files and refreshes them in
> > >    place, and which, after all the refreshes have been committed, should
> > >    produce an empty 'git diff' result."
> > > 
> > >   "[...]  New features can then be added by basically just creating a
> > >    header-only arch-support.txt file, such as:
> > > 
> > >      triton:~/tip/Documentation/features> cat foo/bar/arch-support.txt
> > >      #
> > >      # Feature name:          shiny new fubar kernel feature
> > >      #         Kconfig:       ARCH_USE_FUBAR
> > >      #         description:   arch supports the fubar feature
> > >      #
> > > 
> > >    And running Documentation/features/scripts/features-refresh.sh would
> > >    auto-generate the arch support matrix. [...]
> > >  
> > >    This way we soft- decouple the refreshing of the entries from the
> > >    introduction of the features, while still making it all easy to keep
> > >    sync and to extend."
> > > 
> > > This RFC presents a first attempt to implement such a feature/script, and
> > > applies it script on top of Arnd's:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git arch-removal
> > > 
> > > Patch 1/3 provides the "features-refresh.sh" script.  Patch 2/3 removes the
> > > "BPF-JIT" feature file and it creates header-only files for "cBPF-JIT" and
> > > "eBPF-JIT".  Patch 3/3 presents the results of running the script; this run
> > > also printed to standard output the following warnings:
> > > 
> > >   WARNING: '__HAVE_ARCH_STRNCASECMP' is not a valid Kconfig
> > >   WARNING: 'Optimized asm/rwsem.h' is not a valid Kconfig
> > >   WARNING: '!ARCH_USES_GETTIMEOFFSET' is not a valid Kconfig
> > >   WARNING: '__HAVE_ARCH_PTE_SPECIAL' is not a valid Kconfig
> > > 
> > > (I'm sending these patches with empty commit messagges, for early feedback:
> > >  I'll fill in these messages in subsequent versions if this makes sense...)
> > > 
> > > Cheers,
> > >   Andrea
> > > 
> > > Andrea Parri (3):
> > >   Documentation/features: Add script that refreshes the arch support status files in place
> > >   Documentation/features/core: Add arch support status files for 'cBPF-JIT' and 'eBPF-JIT'
> > >   Documentation/features: Refresh and auto-generate the arch support status files in place
> > 
> > Ok, this series is really impressive at its RFC stage already!
> > 
> > Beyond fixing those warnings, I'd also suggest another change: please make the 
> > new BPF features patch the last one, so that the 'refresh' patch shows how much 
> > original bit-rot we gathered recently.
> > 
> > The 'new features' patch should then also include the result of also running the 
> > script, i.e. a single patch adding the base fields and the generated parts as 
> > well. That will be the usual development flow anyway - people won't do two-part 
> > patches just to show which bits are by hand and which are auto-generated.
> 
> Yes, I'll do.
> 
> Let me ask some hints about the warnings, as I'm not sure how to 'fix' them;
> we have:
> 
>   a) __HAVE_ARCH_STRNCASECMP
>      __HAVE_ARCH_PTE_SPECIAL
> 
>   b) Optimized asm/rwsem.h
> 
>   c) !ARCH_USES_GETTIMEOFFSET  
> 
> For (c), I see two options:
> 
>   1. replace that with 'ARCH_USES_GETTIMEOFFSET' (and update the status
>      matrix accordingly)
> 
>   2. add logics/code to the script to handle simple boolean expressions
>      (mmh, this could get nasty really soon... let's say: limiting to a
>      leading '!', to start with ;)

Yeah, so the problem here is that the feature is the _lack_ of legacy 
ARCH_USES_GETTIMEOFFSET, so we cannot just invert the check - the output would be 
rather confusing ...

Negating the switch in the kernel would force us to add a "arch uses modern 
timekeeping" flag to every other architecture - not a very good solution.

I'd suggest adding support for a simple '!' operator with very strict syntax - 
nothing more. (This would also be useful for (b), see below.)

> For (a), I realize that 'grep-ing' the macros in arch-specific _sources_
> does serve the purpose of producing the hard-coded status matrices; but
> is this a reasonable approach? (e.g., can produce 'false-positives'?)

I'd suggest removing both :-)

- strncasecmp() is an insignificant API and no arch has optimized it so far.
- __HAVE_ARCH_PTE_SPECIAL is really a hardware detail.

> What could it be a suitable solution for (b)? are there Kconfig options
> which I could in place of that expression? some other suggestion?

Yes, !RWSEM_GENERIC_SPINLOCK expresses this equivalently. If you implement the NOT 
operator for ARCH_USES_GETTIMEOFFSET then it would handle this one as well.

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
