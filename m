Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 866B97D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 17:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbeLRRaI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Dec 2018 12:30:08 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:46657 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbeLRRaD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Dec 2018 12:30:03 -0500
Received: by mail-yw1-f66.google.com with SMTP id t13so6980559ywe.13
        for <linux-doc@vger.kernel.org>; Tue, 18 Dec 2018 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gUey7Zbt0/b42GYcDqdXluKToQHKpjhH7c7i9g2qAPQ=;
        b=07Kj4DIqpm3qGJrMz5nve9A4ZGGKM2wV5SM0fLcyYiPgFD383RDtI8GCbLnKYpyJoZ
         q5M2bWJ3BpkxaIxeWrO5JRbJWvzXmWeeVWkWgOqzfCJRoaatMVkheQb6JRb4hQ6o2RCj
         riUiEFXdQNyx3l7nlOT0N+p3h2zjL97Gekt3+IHb/HgCJWBQAiM0kXdlWRgrrWU2bxyC
         tyDnlJcu86Ue/BYguoXWsyZIbmRCO7foD9F/e3bn4JOquWM1/Q1nN68kk3vLxvbEMYbq
         qfpfNF94PtsWNp+xoBJJfF6BBd4AEZijMnkieXM6lzH+GWo0q3OGRSyPrEIoxKG2jCba
         ShTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gUey7Zbt0/b42GYcDqdXluKToQHKpjhH7c7i9g2qAPQ=;
        b=X1jhWsoMqdbu0gP6fD9YgxJRguYUJTArGM8jCCBEhQOGvCZ1McIzHJHbxiu2OvbwjZ
         tbo2nCcH4lcIy+HBO6Cxqi4VWXiLMYZw5033aucAlmSFjAHdQHHYFQLO7mEj+3iFRfPv
         JALK93w4iPEf3Y7bRuB5ZSSN004kyaTSvoAxmumsdeZp2bNJe96MnQcoh29aUJh6T9dH
         LjS31ieq1LX7iR3r7DdJocB64FRLZi0mdjDZUzT5KbpMuDsuCu3/XtGoFPvKdTocXWew
         Vi0IdRFu1ItWrfvlZmKEfz7V6sA5BDf05YNGLiaoqHx1+dV0ZRD4YI+LJ02uvMWsU4I6
         csgg==
X-Gm-Message-State: AA+aEWbGG4drD5lCsrn2mDeBteR75AAETG9Abj5xI+lqPJHCfLuAUfS0
        zDZROg7t1C3MxS3wQuxpjXfcBw==
X-Google-Smtp-Source: AFSGD/VJ8mToi8jB+b4MstqcYsknuunF3B8wM6GlqGohCYMZs/EtHDS1Yz68V7FkHOCaIF7F6xRCuw==
X-Received: by 2002:a81:29cc:: with SMTP id p195mr19043540ywp.407.1545154202149;
        Tue, 18 Dec 2018 09:30:02 -0800 (PST)
Received: from localhost ([2620:10d:c091:200::4:4329])
        by smtp.gmail.com with ESMTPSA id n10sm3803576ywc.48.2018.12.18.09.30.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 09:30:01 -0800 (PST)
Date:   Tue, 18 Dec 2018 12:30:00 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com, axboe@kernel.dk,
        dennis@kernel.org, Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com
Subject: Re: [PATCH 6/6] psi: introduce psi monitor
Message-ID: <20181218173000.GA4733@cmpxchg.org>
References: <20181214171508.7791-1-surenb@google.com>
 <20181214171508.7791-7-surenb@google.com>
 <20181217162223.GD2218@hirez.programming.kicks-ass.net>
 <CAJuCfpHGsDnE-eAHY1QnX949stA3cvNA=078q1swqVnz95aJfg@mail.gmail.com>
 <20181218104622.GB15430@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218104622.GB15430@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 18, 2018 at 11:46:22AM +0100, Peter Zijlstra wrote:
> On Mon, Dec 17, 2018 at 05:21:05PM -0800, Suren Baghdasaryan wrote:
> > On Mon, Dec 17, 2018 at 8:22 AM Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > How well has this thing been fuzzed? Custom string parser, yay!
> > 
> > Honestly, not much. Normal cases and some obvious corner cases. Will
> > check if I can use some fuzzer to get more coverage or will write a
> > script.
> > I'm not thrilled about writing a custom parser, so if there is a
> > better way to handle this please advise.
> 
> The grammar seems fairly simple, something like:
> 
>   some-full = "some" | "full" ;
>   threshold-abs = integer ;
>   threshold-pct = integer, { "%" } ;
>   threshold = threshold-abs | threshold-pct ;
>   window = integer ;
>   trigger = some-full, space, threshold, space, window ;
> 
> And that could even be expressed as two scanf formats:
> 
>  "%4s %u%% %u" , "%4s %u %u"
> 
> which then gets your something like:
> 
>   char type[5];
> 
>   if (sscanf(input, "%4s %u%% %u", &type, &pct, &window) == 3) {
>   	// do pct thing
>   } else if (sscanf(intput, "%4s %u %u", &type, &thres, &window) == 3) {
>   	// do abs thing
>   } else return -EFAIL;
> 
>   if (!strcmp(type, "some")) {
>   	// some
>   } else if (!strcmp(type, "full")) {
>   	// full
>   } else return -EFAIL;
> 
>   // do more

We might want to drop the percentage notation.

While it's somewhat convenient, it's also not unreasonable to ask
userspace to do a simple "threshold * win / 100" themselves, and it
would simplify the interface spec and the parser.

Sure, psi outputs percentages, but only for fixed window sizes, so
that actually saves us something, whereas this parser here needs to
take a fractional anyway. The output is also in decimal notation,
which is necessary for granularity. And I really don't think we want
to add float parsing on top of this interface spec.

So neither the convenience nor the symmetry argument are very
compelling IMO. It might be better to just not go there.
