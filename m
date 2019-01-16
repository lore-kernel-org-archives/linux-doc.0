Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09DB07D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Jan 2019 19:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbfAPT1s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Jan 2019 14:27:48 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:46171 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730165AbfAPT1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jan 2019 14:27:47 -0500
Received: by mail-yw1-f68.google.com with SMTP id t13so2837696ywe.13
        for <linux-doc@vger.kernel.org>; Wed, 16 Jan 2019 11:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WiVtpIOuEwH4DhBlsSM5aJC00b41A66MDpCmjW42bSs=;
        b=cuMu4RiAnGXx2I+SUKExjCnU+aFOY/M6XwCvtAb5DrpByPtxk2pa4v5MavdkB+jxr5
         vIFRDzdZVnLY62BzGNnvFt8620kZQA7tU36sJCp3WdWGSkpe9urA+idxSp6llrqwX6IK
         385vnuqHJMXf5xvzdhZh70oiei31K9tsZ2USDFYJriBloD1IQNqjSx57DlElEfMeDi37
         BhVLkctMRe/eiNKD5P92BvaziOx0fYopaziptyNkL64zKIds37UablJmBAK+YyZ5AeOk
         4fj9W71/L5V9Vtoa3ea6i4/PydI+RaQG6mJqL9NFlzyh2y0HEx9b9s5DbFh2tG3I5wgE
         Rtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WiVtpIOuEwH4DhBlsSM5aJC00b41A66MDpCmjW42bSs=;
        b=nj/e/XZXBxYaU78qQo6Hn3mL5SoCmBjePA44N2zp28M8omooiJl2ggms6U1Uvpeymk
         i2mIV3gVYR3Pu12SnYfUwMrNlifnkZ4QvenHJcOtXVVK6gfZBjUKx8nefzulyKwpVg0g
         0XNEDMPZ1w4eH4jU7nW/eqhU63U5b7HZbDvJUWQcnN1UpM/zndmQfdfukmnsVLfMwC7U
         D4IiiApqLmvPG6LRhZOkhdm4LiPHDcJzvqe4IHsEOZR0EXLruiokpciLj93LX8rzYOOP
         ZoXjGTeBOE/P626q9xNQT0va8sgZIcCf9KYAZrpTz5db4W9IaB7TFfbzF88hWRR/na6i
         OEvw==
X-Gm-Message-State: AJcUukfR9ROu14Mq+JRTBIgdpEbUr1g0OjwX2EGlYGCzJlCuPTY+nB+O
        O2dekbcVosmE6BO7A569g+dw5w==
X-Google-Smtp-Source: ALg8bN54lKz4Rfui9Ro7yclSWXYNLMya8zLffHzCSz8mJ0Id7XnuXXGkGLvBDwrWMC/ciyKylDOBAw==
X-Received: by 2002:a0d:d54e:: with SMTP id x75mr6638846ywd.308.1547666866398;
        Wed, 16 Jan 2019 11:27:46 -0800 (PST)
Received: from localhost ([2620:10d:c091:200::5:ddb4])
        by smtp.gmail.com with ESMTPSA id f10sm5419601ywb.26.2019.01.16.11.27.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 11:27:45 -0800 (PST)
Date:   Wed, 16 Jan 2019 14:27:44 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com, axboe@kernel.dk,
        dennis@kernel.org, Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com
Subject: Re: [PATCH v2 5/5] psi: introduce psi monitor
Message-ID: <20190116192744.GA1576@cmpxchg.org>
References: <20190110220718.261134-1-surenb@google.com>
 <20190110220718.261134-6-surenb@google.com>
 <20190114102137.GB14054@worktop.programming.kicks-ass.net>
 <CAJuCfpGUWs0E9oPUjPTNm=WhPJcE_DBjZCtCiaVu5WXabKRW6A@mail.gmail.com>
 <20190116132446.GF10803@hirez.programming.kicks-ass.net>
 <CAJuCfpEJW6Uq4GSGEGLKOM4K7ySHUeTGrSUGM1+EJSQ16d8SJg@mail.gmail.com>
 <20190116191728.GA1380@cmpxchg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116191728.GA1380@cmpxchg.org>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 16, 2019 at 02:17:28PM -0500, Johannes Weiner wrote:
> On Wed, Jan 16, 2019 at 09:39:13AM -0800, Suren Baghdasaryan wrote:
> > On Wed, Jan 16, 2019 at 5:24 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, Jan 14, 2019 at 11:30:12AM -0800, Suren Baghdasaryan wrote:
> > > > For memory ordering (which Johannes also pointed out) the critical point is:
> > > >
> > > > times[cpu] += delta           | if g->polling:
> > > > smp_wmb()                     |   g->polling = polling = 0
> > > > cmpxchg(g->polling, 0, 1)     |   smp_rmb()
> > > >                               |   delta = times[*] (through goto SLOWPATH)
> > > >
> > > > So that hotpath writes to times[] then g->polling and slowpath reads
> > > > g->polling then times[]. cmpxchg() implies a full barrier, so we can
> > > > drop smp_wmb(). Something like this:
> > > >
> > > > times[cpu] += delta           | if g->polling:
> > > > cmpxchg(g->polling, 0, 1)     |   g->polling = polling = 0
> > > >                               |   smp_rmb()
> > > >                               |   delta = times[*] (through goto SLOWPATH)
> > > >
> > > > Would that address your concern about ordering?
> > >
> > > cmpxchg() implies smp_mb() before and after, so the smp_wmb() on the
> > > left column is superfluous.
> > 
> > Should I keep it in the comments to make it obvious and add a note
> > about implicit barriers being the reason we don't call smp_mb() in the
> > code explicitly?
> 
> I'd keep 'em out if they aren't actually in the code. But I'd switch
> 
> 	delta = times[*]
> 
> in this comment to to
> 
> 	get_recent_times() // implies smp_mb()

Actually, I might have been mistaken about this. The seqcount locking
does an smp_rmb() and an smp_wmb(), and that orders reads and writes
respectively, but doesn't necessarily order reads against writes.

So I think we need an explicit smp_mb() after all.
