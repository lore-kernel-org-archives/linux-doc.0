Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 370097D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Aug 2019 21:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388945AbfHGVzw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Aug 2019 17:55:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40208 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388620AbfHGVzw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Aug 2019 17:55:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so42870980pgj.7
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2019 14:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fPDNifyL3Y36NBVemhHSXF79qGomK0S4tenrlniMG8c=;
        b=iLFial3WG2Y7hC5RmH/BPZMbk7K/mSRsub86lIBJhU4yCFb7muLzqQlM2Rw/ElKGgC
         SFjKYwdRoliyNAlbyClW8nV7pvHzWz0n8BGIO7Li2Qvwc3w0FvMgmdrCGjAVrSK9JbBy
         BL0fPr4WaEXa+YoPzJ+O512HUakd8rmUXyXUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fPDNifyL3Y36NBVemhHSXF79qGomK0S4tenrlniMG8c=;
        b=Xsxwfm24lUR4c3dpgceA5woMEDS9Ft/lFn4K1w4PESTEs7pR27knjVA6oaVGm1j0AP
         0zWedRTglJa0PCNtFWqicI+PSNXe5LI1H0W6Aq+099tO7CAywVQWVb4ltDfaSgqUAMZc
         2Q/4Rrew026WHDUBNtieaRX0RnOAwct5r5JhvWR1tiCZZbj017ORzJ8SCnKCaTa92Vwj
         Sc2Ev3BzBMZ4RMtmzaA19qO1n/Z67ZFFR3KPci3kl/Yx+FwlpcpNvJGaNy8FBJg6dDt1
         Ugv5HecN/3NZN7oLOucMsrilSSwuGJLekQjVZmRVdV0snVGLDWLMjD8IL7JAlv1PqR57
         Zdqg==
X-Gm-Message-State: APjAAAURw5G5JtdBDms3IJKaXNDgJuvafBCOCLbjHa3ocbUixTnjAQzs
        Qi0uCinanznkOnImMNqBHEWg6w==
X-Google-Smtp-Source: APXvYqxtYbX1J2T4gE/+OoiVyWtnb2A4+C1faUKsGzqUpJz/BeHl7Ul7v7RUi0zJvoSnKkCTeSkNNg==
X-Received: by 2002:aa7:9afc:: with SMTP id y28mr11421501pfp.252.1565214951446;
        Wed, 07 Aug 2019 14:55:51 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id z4sm79672843pgp.80.2019.08.07.14.55.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 14:55:50 -0700 (PDT)
Date:   Wed, 7 Aug 2019 17:55:49 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Brendan Gregg <bgregg@netflix.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Hansen <chansen3@cisco.com>, dancol@google.com,
        fmayer@google.com, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, minchan@kernel.org,
        namhyung@google.com, paulmck@linux.ibm.com,
        Robin Murphy <robin.murphy@arm.com>,
        Roman Gushchin <guro@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, surenb@google.com,
        Thomas Gleixner <tglx@linutronix.de>, tkjos@google.com,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 1/6] mm/page_idle: Add per-pid idle page tracking
 using virtual index
Message-ID: <20190807215549.GB14622@google.com>
References: <20190807171559.182301-1-joel@joelfernandes.org>
 <20190807130402.49c9ea8bf144d2f83bfeb353@linux-foundation.org>
 <20190807204530.GB90900@google.com>
 <20190807135840.92b852e980a9593fe91fbf59@linux-foundation.org>
 <20190807213105.GA14622@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807213105.GA14622@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 07, 2019 at 05:31:05PM -0400, Joel Fernandes wrote:
> On Wed, Aug 07, 2019 at 01:58:40PM -0700, Andrew Morton wrote:
> > On Wed, 7 Aug 2019 16:45:30 -0400 Joel Fernandes <joel@joelfernandes.org> wrote:
> > 
> > > On Wed, Aug 07, 2019 at 01:04:02PM -0700, Andrew Morton wrote:
> > > > On Wed,  7 Aug 2019 13:15:54 -0400 "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:
> > > > 
> > > > > In Android, we are using this for the heap profiler (heapprofd) which
> > > > > profiles and pin points code paths which allocates and leaves memory
> > > > > idle for long periods of time. This method solves the security issue
> > > > > with userspace learning the PFN, and while at it is also shown to yield
> > > > > better results than the pagemap lookup, the theory being that the window
> > > > > where the address space can change is reduced by eliminating the
> > > > > intermediate pagemap look up stage. In virtual address indexing, the
> > > > > process's mmap_sem is held for the duration of the access.
> > > > 
> > > > So is heapprofd a developer-only thing?  Is heapprofd included in
> > > > end-user android loads?  If not then, again, wouldn't it be better to
> > > > make the feature Kconfigurable so that Android developers can enable it
> > > > during development then disable it for production kernels?
> > > 
> > > Almost all of this code is already configurable with
> > > CONFIG_IDLE_PAGE_TRACKING. If you disable it, then all of this code gets
> > > disabled.
> > > 
> > > Or are you referring to something else that needs to be made configurable?
> > 
> > Yes - the 300+ lines of code which this patchset adds!
> > 
> > The impacted people will be those who use the existing
> > idle-page-tracking feature but who will not use the new feature.  I
> > guess we can assume this set is small...
> 
> Yes, I think this set should be small. The code size increase of page_idle.o
> is from ~1KB to ~2KB. Most of the extra space is consumed by
> page_idle_proc_generic() function which this patch adds. I don't think adding
> another CONFIG option to disable this while keeping existing
> CONFIG_IDLE_PAGE_TRACKING enabled, is worthwhile but I am open to the
> addition of such an option if anyone feels strongly about it. I believe that
> once this patch is merged, most like this new interface being added is what

s/most like/most likely/

> will be used more than the old interface (for some of the usecases) so it
> makes sense to keep it alive with CONFIG_IDLE_PAGE_TRACKING.
> 
> thanks,
> 
>  - Joel
> 
