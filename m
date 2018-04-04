Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4BE37DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Apr 2018 04:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750938AbeDDE4i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Apr 2018 00:56:38 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45597 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbeDDE4h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Apr 2018 00:56:37 -0400
Received: by mail-wr0-f195.google.com with SMTP id u11so20651832wri.12;
        Tue, 03 Apr 2018 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gZuSr9sxE3U3g0tWKUdeH+xkNPGuv/C9IcvmJ7cJrjY=;
        b=S2VP6g3e6L3QQfBZAwfyQh5aaNdzcKneJW2H5GxLsC/qRqM9XIndAqvpw1RgptiC0F
         Ki8HC1GvPvkHSD1yEzzmqb98ZtxdFQMEHzI90Ljc8Jb+uY6QoHQ85m7pwhNvoyqCbunh
         cSsNVGZFzUaH25AttflScqRXsB4sI7VraRrGzh/5DWOD5PdSxLwMERvM+ikGILkUshG+
         rLLbuR040DkqY8pXXWGBIxxjBfI14D6u2ldenoSX6xtw5L//b7UneM1L6oeN65tMaqFz
         iV6ldOB0uAj/aQee/F4FrOpSR1MC+O8gRmolgg25eWlZh1QSuUVFyzp6+yEQluj45/70
         t92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gZuSr9sxE3U3g0tWKUdeH+xkNPGuv/C9IcvmJ7cJrjY=;
        b=d8EI+/qgzta1zHVIHPW16JKTqI0DCAkvoF1Hfv9NYcZ2j7fHBoZsAzatC5EelfuGsI
         sCDvZhVlou0iHVMjdK0bxR0JQlhtA53lcqwvVtt5+B48do+dFBX2XaeMVJ4HdG6uNFAy
         TitmQU2wrx/n8jyA/55QeHIuUV41GWtLYR+od4Gl7wkz9VX4fx1NQpQNDyt8xbCJ6QYa
         pI1uwYmYcTcmhE1vAAi8ZgCRZPv/1DouM27o2f6nyQReWTJxyF3F2YkvE2xHRbYybzCv
         OeDD7uh/B7iwhpzGlTe/JxnEFN8TdTyZ8QOEpEa6OrcoNLGIlN+ips+N0uh4H1EbURhB
         iUMQ==
X-Gm-Message-State: AElRT7HaKGZPkRKZoDyVZnNkmwtwzlQ99WuB4Jgbf79BMPFyhceDrQIk
        dAC5fquBXwytzt5tbRhVi8ia2g==
X-Google-Smtp-Source: AIpwx4+F8gdQ7PbsPFU5fts9zIqQsblSHp1LNizfdav2BLK4NpwB0xjKmiw1hp1nntzUGrQAWgoWDw==
X-Received: by 10.223.130.246 with SMTP id 109mr12359039wrc.45.1522817795672;
        Tue, 03 Apr 2018 21:56:35 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id t142sm3000967wmt.12.2018.04.03.21.56.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Apr 2018 21:56:35 -0700 (PDT)
Date:   Wed, 4 Apr 2018 06:56:32 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH 0/3] Documentation/features: Provide and apply
 "features-refresh.sh"
Message-ID: <20180404045632.uniwfrl32bjmsn5g@gmail.com>
References: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


* Andrea Parri <andrea.parri@amarulasolutions.com> wrote:

> In Ingo's words [1]:
> 
>   "[...]  what should be done instead is to write a script that refreshes
>    all the arch-support.txt files in-place. [...]
> 
>    It's OK for the script to have various quirks for weirdly implemented
>    features and exceptions: i.e. basically whenever it gets a feature wrong,
>    we can just tweak the script with quirks to make it all work out of box.
> 
>    [...]  But in the end there should only be a single new script:
> 
>      Documentation/features/scripts/features-refresh.sh
> 
>    ... which operates on the arch-support.txt files and refreshes them in
>    place, and which, after all the refreshes have been committed, should
>    produce an empty 'git diff' result."
> 
>   "[...]  New features can then be added by basically just creating a
>    header-only arch-support.txt file, such as:
> 
>      triton:~/tip/Documentation/features> cat foo/bar/arch-support.txt
>      #
>      # Feature name:          shiny new fubar kernel feature
>      #         Kconfig:       ARCH_USE_FUBAR
>      #         description:   arch supports the fubar feature
>      #
> 
>    And running Documentation/features/scripts/features-refresh.sh would
>    auto-generate the arch support matrix. [...]
>  
>    This way we soft- decouple the refreshing of the entries from the
>    introduction of the features, while still making it all easy to keep
>    sync and to extend."
> 
> This RFC presents a first attempt to implement such a feature/script, and
> applies it script on top of Arnd's:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git arch-removal
> 
> Patch 1/3 provides the "features-refresh.sh" script.  Patch 2/3 removes the
> "BPF-JIT" feature file and it creates header-only files for "cBPF-JIT" and
> "eBPF-JIT".  Patch 3/3 presents the results of running the script; this run
> also printed to standard output the following warnings:
> 
>   WARNING: '__HAVE_ARCH_STRNCASECMP' is not a valid Kconfig
>   WARNING: 'Optimized asm/rwsem.h' is not a valid Kconfig
>   WARNING: '!ARCH_USES_GETTIMEOFFSET' is not a valid Kconfig
>   WARNING: '__HAVE_ARCH_PTE_SPECIAL' is not a valid Kconfig
> 
> (I'm sending these patches with empty commit messagges, for early feedback:
>  I'll fill in these messages in subsequent versions if this makes sense...)
> 
> Cheers,
>   Andrea
> 
> Andrea Parri (3):
>   Documentation/features: Add script that refreshes the arch support status files in place
>   Documentation/features/core: Add arch support status files for 'cBPF-JIT' and 'eBPF-JIT'
>   Documentation/features: Refresh and auto-generate the arch support status files in place

Ok, this series is really impressive at its RFC stage already!

Beyond fixing those warnings, I'd also suggest another change: please make the 
new BPF features patch the last one, so that the 'refresh' patch shows how much 
original bit-rot we gathered recently.

The 'new features' patch should then also include the result of also running the 
script, i.e. a single patch adding the base fields and the generated parts as 
well. That will be the usual development flow anyway - people won't do two-part 
patches just to show which bits are by hand and which are auto-generated.

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
