Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F354E7E897
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Apr 2018 13:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751434AbeDDNEJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Apr 2018 09:04:09 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:38232 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750853AbeDDNEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Apr 2018 09:04:06 -0400
Received: by mail-wr0-f194.google.com with SMTP id m13so22552643wrj.5
        for <linux-doc@vger.kernel.org>; Wed, 04 Apr 2018 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=daCG/P8nKej1ZgtEXWfngcjvo3jOA4/Eh96ZTDhtA+4=;
        b=ZhdfQsyVLHZDgvLpmFrgCjfiuNxGIz5N42ruXNYRVYcFStPsXeVyYDi6NJ33cHlYw7
         wpvQh3xAVZUbFwBAYMh2aLUE0COZ9OLq/aELDqDCr7Vsxs1wo07Mc5uEwWNhaNKIya3k
         ymcL/uZsXGjpGWNJIuEXgXqO4sIaSKG+Jrf0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=daCG/P8nKej1ZgtEXWfngcjvo3jOA4/Eh96ZTDhtA+4=;
        b=L1yJx84VSmdI3XD0rm/R/jNUrP7F+Oc1LtgQCDGeMNO1phSrAWnDS+TirSyNV6AL/h
         hxB5i/NT4WMKX6IfAeCJsJbpBMcxHBL5WXBFUkv4CN29Mesbwcxgp9ItO2Xu0R9O9kUR
         ViohNdeQhZ5CkCrBWy935Chbq9XAn8G0jJI8w7fXRz8wj0cUqmZfrEpYrSPoHLR7J9jQ
         2JVv48NrsrjozFtnJ7Ey/qhwlaqV3FsaYBiqAW+UXQQ0lLnsL7uevEJe5Zo8GztwWaTm
         aX/CeM5TByKudfuaKz4D+AZAGHKFgmb6ZWeUSIC766Z2SuLe1iDt/zKOwaeQER3TjApw
         n8EA==
X-Gm-Message-State: AElRT7EAzglBbbNzzQtNYDuB1eRcEh/dO/k5oLOo0poFEOlB96+z7e4I
        66upn5dh95+HAHbdqXPE8zaS8w5+
X-Google-Smtp-Source: AIpwx4/CCx2Ivq9QSpf7ODb5HW61fahwwB+gNnn2GQLEcE0gSz5SYh3fNVKiH22bHGlMgULD2aeWnQ==
X-Received: by 10.223.176.237 with SMTP id j42mr13525031wra.25.1522847045246;
        Wed, 04 Apr 2018 06:04:05 -0700 (PDT)
Received: from andrea ([213.209.242.222])
        by smtp.gmail.com with ESMTPSA id k14sm6092425wrc.62.2018.04.04.06.04.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Apr 2018 06:04:04 -0700 (PDT)
Date:   Wed, 4 Apr 2018 15:03:57 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH 0/3] Documentation/features: Provide and apply
 "features-refresh.sh"
Message-ID: <20180404130357.GA9125@andrea>
References: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180404045632.uniwfrl32bjmsn5g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180404045632.uniwfrl32bjmsn5g@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 04, 2018 at 06:56:32AM +0200, Ingo Molnar wrote:
> 
> * Andrea Parri <andrea.parri@amarulasolutions.com> wrote:
> 
> > In Ingo's words [1]:
> > 
> >   "[...]  what should be done instead is to write a script that refreshes
> >    all the arch-support.txt files in-place. [...]
> > 
> >    It's OK for the script to have various quirks for weirdly implemented
> >    features and exceptions: i.e. basically whenever it gets a feature wrong,
> >    we can just tweak the script with quirks to make it all work out of box.
> > 
> >    [...]  But in the end there should only be a single new script:
> > 
> >      Documentation/features/scripts/features-refresh.sh
> > 
> >    ... which operates on the arch-support.txt files and refreshes them in
> >    place, and which, after all the refreshes have been committed, should
> >    produce an empty 'git diff' result."
> > 
> >   "[...]  New features can then be added by basically just creating a
> >    header-only arch-support.txt file, such as:
> > 
> >      triton:~/tip/Documentation/features> cat foo/bar/arch-support.txt
> >      #
> >      # Feature name:          shiny new fubar kernel feature
> >      #         Kconfig:       ARCH_USE_FUBAR
> >      #         description:   arch supports the fubar feature
> >      #
> > 
> >    And running Documentation/features/scripts/features-refresh.sh would
> >    auto-generate the arch support matrix. [...]
> >  
> >    This way we soft- decouple the refreshing of the entries from the
> >    introduction of the features, while still making it all easy to keep
> >    sync and to extend."
> > 
> > This RFC presents a first attempt to implement such a feature/script, and
> > applies it script on top of Arnd's:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git arch-removal
> > 
> > Patch 1/3 provides the "features-refresh.sh" script.  Patch 2/3 removes the
> > "BPF-JIT" feature file and it creates header-only files for "cBPF-JIT" and
> > "eBPF-JIT".  Patch 3/3 presents the results of running the script; this run
> > also printed to standard output the following warnings:
> > 
> >   WARNING: '__HAVE_ARCH_STRNCASECMP' is not a valid Kconfig
> >   WARNING: 'Optimized asm/rwsem.h' is not a valid Kconfig
> >   WARNING: '!ARCH_USES_GETTIMEOFFSET' is not a valid Kconfig
> >   WARNING: '__HAVE_ARCH_PTE_SPECIAL' is not a valid Kconfig
> > 
> > (I'm sending these patches with empty commit messagges, for early feedback:
> >  I'll fill in these messages in subsequent versions if this makes sense...)
> > 
> > Cheers,
> >   Andrea
> > 
> > Andrea Parri (3):
> >   Documentation/features: Add script that refreshes the arch support status files in place
> >   Documentation/features/core: Add arch support status files for 'cBPF-JIT' and 'eBPF-JIT'
> >   Documentation/features: Refresh and auto-generate the arch support status files in place
> 
> Ok, this series is really impressive at its RFC stage already!
> 
> Beyond fixing those warnings, I'd also suggest another change: please make the 
> new BPF features patch the last one, so that the 'refresh' patch shows how much 
> original bit-rot we gathered recently.
> 
> The 'new features' patch should then also include the result of also running the 
> script, i.e. a single patch adding the base fields and the generated parts as 
> well. That will be the usual development flow anyway - people won't do two-part 
> patches just to show which bits are by hand and which are auto-generated.

Yes, I'll do.

Let me ask some hints about the warnings, as I'm not sure how to 'fix' them;
we have:

  a) __HAVE_ARCH_STRNCASECMP
     __HAVE_ARCH_PTE_SPECIAL

  b) Optimized asm/rwsem.h

  c) !ARCH_USES_GETTIMEOFFSET  

For (c), I see two options:

  1. replace that with 'ARCH_USES_GETTIMEOFFSET' (and update the status
     matrix accordingly)

  2. add logics/code to the script to handle simple boolean expressions
     (mmh, this could get nasty really soon... let's say: limiting to a
     leading '!', to start with ;)

For (a), I realize that 'grep-ing' the macros in arch-specific _sources_
does serve the purpose of producing the hard-coded status matrices; but
is this a reasonable approach? (e.g., can produce 'false-positives'?)

What could it be a suitable solution for (b)? are there Kconfig options
which I could in place of that expression? some other suggestion?

Thanks,
  Andrea


> 
> Thanks,
> 
> 	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
