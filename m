Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE69CD37AA
	for <linux-doc@archiver.kernel.org>; Fri, 15 Sep 2023 21:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237424AbjIOVOL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 17:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238083AbjIOVNg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:13:36 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51831CD4
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:13:05 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-271d9823cacso2094423a91.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694812385; x=1695417185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZHk7vThpLpskZtqajJEmCcHKvsPyXWDUd5X6GjbEhM=;
        b=oc7I+p+6FvfuU9el2G07pmZZeSF2QT32N24IMQTgseIYtZ+zm+hxwT+p5D7B239YdE
         JgNQ6SKWIt1wCWtz2CjTxBLR7cOFgHfhDt97dVKoIwWoohYv6zLWXU0Jb1UZV8uCrnMb
         qMRhQEU3J+aoYsqOLIesAlKpcVBPW9rqGgMRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694812385; x=1695417185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZHk7vThpLpskZtqajJEmCcHKvsPyXWDUd5X6GjbEhM=;
        b=IgsfFUsNffGD+pq7t5RAXpXmWodDSyyhQSNNkdacMntCwVlSi2FXQ/sRQsVYva9M9R
         vSC5NphYJkkKqVy4UNddDP9VZactrcQ4JhY4c7cpcWQpfJRq+Os7bVGGNtYIjJC7lH57
         tkD4t1aId1z2+Y+ljKTXORnhgH1/6wiazn5dod/7VMKpT7T1fWM8Odg39XcI5TcdqW5i
         ZyvVRY76u3BU2jW6Hg1f/1/+MmxqQwtPNLTtIRTXqIBaX2r6BCfYQn370E8KBLp6I4UL
         VpYiqzQ3168HtnNSTeBS11SePCKBvUasjN4kD9j2WVzPl/afQWySz9mt9fRoItOlguq7
         q7Bw==
X-Gm-Message-State: AOJu0Yy2dhEoqIQj8eIfJE2vhZhwVKAG9ogxipVbhavLfeF3wQ0f1KHY
        zxyAxloXT+1QGWw980jfy5n8ig==
X-Google-Smtp-Source: AGHT+IHm6HySe6IHe1hP6qL3CE05/JQnD5U2WP+Yncfwbd9pJNQNoXCcc43i0dypm9WA1Axo89FeCA==
X-Received: by 2002:a17:90b:1952:b0:268:14a0:f8a with SMTP id nk18-20020a17090b195200b0026814a00f8amr2739464pjb.39.1694812384792;
        Fri, 15 Sep 2023 14:13:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ie18-20020a17090b401200b0026971450601sm3428843pjb.7.2023.09.15.14.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 14:13:04 -0700 (PDT)
Date:   Fri, 15 Sep 2023 14:13:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     cl@linux.com, penberg@kernel.org, rientjes@google.com,
        iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com, ardb@google.com
Subject: Re: [RFC PATCH 10/14] x86: Create virtual memory region for SLUB
Message-ID: <202309151410.E65B8300F@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-11-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-11-matteorizzo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:29AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> SLAB_VIRTUAL reserves 512 GiB of virtual memory and uses them for both
> struct slab and the actual slab memory. The pointers returned by
> kmem_cache_alloc will point to this range of memory.

I think the 512 GiB limit may be worth mentioning in the Kconfig help
text.

And in the "640K is enough for everything" devil's advocacy, why is 512
GiB enough here? Is there any greater risk of a pathological allocation
pattern breaking a system any more (or less) than is currently possible?
> 
> Signed-off-by: Jann Horn <jannh@google.com>

But, yes, I'm still a fan, and I think it interacts well here with the
rest of the KASLR initialization:

Reviewed-by: Kees Cook <keescook@chromium.org>

Have you tried to make this work on arm64? I imagine it should be
roughly as easy?

-- 
Kees Cook
