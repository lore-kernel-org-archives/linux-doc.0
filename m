Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97681C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 21:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5755164E63
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 21:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhBPVyC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Feb 2021 16:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhBPVxy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Feb 2021 16:53:54 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFE7C061756
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 13:53:14 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id p21so1476519pgl.12
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 13:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=0zls66CbYUnShNIJgPu/UgmV9jANuDUd31/IHtthW64=;
        b=rslZrRF79usj1wpjXVj2FLVT6ukeUqIXfYp5xeWcRAHSl9cQ0Fb2JHM2/VQtacubdv
         0jDyyHeGdw6FoQDPKyx172wGjZ6ol9M0R32Bmyv+r005q0S1f94nj8WnQpqd5p19nBjz
         zmrlTX/nbqP1cM/ECqSaNioNZ/IYivwB+q2uiXTB0QixjmFBaug0ley9QJW7pjYXUNHT
         MHCYLkoUTgbovleuh8cFnsmQhpmdcGCbuyLYfpnC5jJPNNvi7xpCq4ibT2w2WOxV7yNo
         lk93w1kHnbjWL8c1TF8WOgtA+bfPVUpqkgQ7pXgieOh+yyIFhkDM4JWUJvtzrYpn8zob
         S1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=0zls66CbYUnShNIJgPu/UgmV9jANuDUd31/IHtthW64=;
        b=q+SP1RLBEe5x0wNIk4ENgRXZjRTQReNQkoGdPOI28cXfiq1PCcTF0twM2yD+Slo/YZ
         iM10kRgazRmODeUh+12GS/DhmGWQpoIWFpIP/UXzTs4yY0Kgc+f+ZZ4FeGnUd9udtnCC
         YNwrY5/nSpPm1GR6+51OqJvBja2rhRvhBucVYEPynWsvtabRuC1wOm54julT7oMNPVo/
         +NB0/YUBkdWxCIjQqDE3oVWOj14cxGwEWgf4GtbAYEoEeqsq/W5UoTmzbll8xxR/+ael
         6yvgYF5VlsPgxn9Cow+KWAvmZNKd8HfSW5p5GyVUNquvKzVJZIBsv97JteTMWe0KHv8h
         wDHg==
X-Gm-Message-State: AOAM533/R/4fvPN4mW4ZEjZt+vmi1cIR1H82BichoeHgdRnqE25aip7M
        WJ2Yu2/rmkYgxG9hQdhaLTguAg==
X-Google-Smtp-Source: ABdhPJxC689jqS6tAFrfu2ZGe+vHaTBYjgdgmtIWwLu49NzPMD60eQHIUluGYkitUp9ffvlSS1L3wA==
X-Received: by 2002:a05:6a00:1a08:b029:1cd:404e:a70c with SMTP id g8-20020a056a001a08b02901cd404ea70cmr21540920pfv.33.1613512393866;
        Tue, 16 Feb 2021 13:53:13 -0800 (PST)
Received: from [2620:15c:17:3:984e:d574:ca36:ce3c] ([2620:15c:17:3:984e:d574:ca36:ce3c])
        by smtp.gmail.com with ESMTPSA id w11sm106603pge.28.2021.02.16.13.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 13:53:13 -0800 (PST)
Date:   Tue, 16 Feb 2021 13:53:12 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
To:     Michal Hocko <mhocko@suse.com>
cc:     Eiichi Tsukata <eiichi.tsukata@nutanix.com>, corbet@lwn.net,
        mike.kravetz@oracle.com, mcgrof@kernel.org, keescook@chromium.org,
        yzaikin@google.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        felipe.franciosi@nutanix.com
Subject: Re: [RFC PATCH] mm, oom: introduce vm.sacrifice_hugepage_on_oom
In-Reply-To: <YCt+cVvWPbWvt2rG@dhcp22.suse.cz>
Message-ID: <b821f4de-3260-f6e2-469f-65ccfa699bb7@google.com>
References: <20210216030713.79101-1-eiichi.tsukata@nutanix.com> <YCt+cVvWPbWvt2rG@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 16 Feb 2021, Michal Hocko wrote:

> > Hugepages can be preallocated to avoid unpredictable allocation latency.
> > If we run into 4k page shortage, the kernel can trigger OOM even though
> > there were free hugepages. When OOM is triggered by user address page
> > fault handler, we can use oom notifier to free hugepages in user space
> > but if it's triggered by memory allocation for kernel, there is no way
> > to synchronously handle it in user space.
> 
> Can you expand some more on what kind of problem do you see?
> Hugetlb pages are, by definition, a preallocated, unreclaimable and
> admin controlled pool of pages.

Small nit: true of non-surplus hugetlb pages.

> Under those conditions it is expected
> and required that the sizing would be done very carefully. Why is that a
> problem in your particular setup/scenario?
> 
> If the sizing is really done properly and then a random process can
> trigger OOM then this can lead to malfunctioning of those workloads
> which do depend on hugetlb pool, right? So isn't this a kinda DoS
> scenario?
> 
> > This patch introduces a new sysctl vm.sacrifice_hugepage_on_oom. If
> > enabled, it first tries to free a hugepage if available before invoking
> > the oom-killer. The default value is disabled not to change the current
> > behavior.
> 
> Why is this interface not hugepage size aware? It is quite different to
> release a GB huge page or 2MB one. Or is it expected to release the
> smallest one? To the implementation...
> 
> [...]
> > +static int sacrifice_hugepage(void)
> > +{
> > +	int ret;
> > +
> > +	spin_lock(&hugetlb_lock);
> > +	ret = free_pool_huge_page(&default_hstate, &node_states[N_MEMORY], 0);
> 
> ... no it is going to release the default huge page. This will be 2MB in
> most cases but this is not given.
> 
> Unless I am mistaken this will free up also reserved hugetlb pages. This
> would mean that a page fault would SIGBUS which is very likely not
> something we want to do right? You also want to use oom nodemask rather
> than a full one.
> 
> Overall, I am not really happy about this feature even when above is
> fixed, but let's hear more the actual problem first.

Shouldn't this behavior be possible as an oomd plugin instead, perhaps 
triggered by psi?  I'm not sure if oomd is intended only to kill something 
(oomkilld? lol) or if it can be made to do sysadmin level behavior, such 
as shrinking the hugetlb pool, to solve the oom condition.

If so, it seems like we want to do this at the absolute last minute.  In 
other words, reclaim has failed to free memory by other means so we would 
like to shrink the hugetlb pool.  (It's the reason why it's implemented as 
a predecessor to oom as opposed to part of reclaim in general.)

Do we have the ability to suppress the oom killer until oomd has a chance 
to react in this scenario?
