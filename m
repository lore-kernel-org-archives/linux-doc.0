Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52ABC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  6 Apr 2022 10:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240475AbiDFKli (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Apr 2022 06:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345449AbiDFKkB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 06:40:01 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C65F4F9165
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 00:05:15 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id m17so1237310ilj.13
        for <linux-doc@vger.kernel.org>; Wed, 06 Apr 2022 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8brfd4/xj9n/UUbz1QgkS/+4GSIqfRVY8lKR+Ve02ZQ=;
        b=JdmbHxbY+8JX8cz01LU1ksij0DZUUY5x8192E1h/BvzuCqmGoiCxSLWZGq/eUFalNQ
         FvgdOGyW7HR22BregNT2UoSHD0vPqGHLrJwx1aDv9q7U873nHfCuf78RsyUSc+ZcGqrt
         ARFSoeUGxNOaJsAmv9OWIFVADgnLvreKjzgQ+X/UgBgUjdshdt69STvqXE9ryra9YXcz
         tlOgUvoN7+ICqARPWqV/H1thtHogeFL8pChzPVxluHKwcdyMd31i0hpCMkVFNkPxtF4+
         fsNuURlQa2SOtu4YVpsWQIIbmR0826UtJrMtvsmG4M6irpThm4Ca+kXyxBahGpgu1NTy
         WtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8brfd4/xj9n/UUbz1QgkS/+4GSIqfRVY8lKR+Ve02ZQ=;
        b=ZaMUc4JyW9t1W6DZHQGN/85TGxa98uIv/ufRCV6WMI+TTwHrOEzaZ1S2k3g03fuqFo
         TwWeLGirWd3uykY2EN2lPU8gXveuBUAVlg24nTAp0KPJ51tiuQit08AONky5BwhkEvdn
         WZAEBpmUxXdDGG2Q561ZGOuXHoWy5gUiEzwH/TNeUBCIMzrLW2UYj3LvqiJK6KZv0Ar7
         alOpROTg9A3rGJCTD+sNk4m6e1dBrNgDthLyY11BkSh15NVq63hIxD13QDyGZBgGzkfx
         1Q5NxejO5XeJF+jKNVbmCndoZzYiaJVnVHusclS8yGdtcFgnKkR6dXz5L81gjueFNlFS
         MxOw==
X-Gm-Message-State: AOAM533om3c59jXQte744xKWGdrqS45B9HXQEOJCs1QuoCRfl1gtWqdK
        SnDCMz4tqrfQ2Pd9z6uq8utQ5TM0uA21atqow52S4g==
X-Google-Smtp-Source: ABdhPJyrivXGrt8+ghdHPltEhU5fpHsONeQ1s+2axYkZ4w0Kr/omf9D2IlBFQgtQEsUmDyutKX0N/t/HwMpd6fu5qzY=
X-Received: by 2002:a92:cd8b:0:b0:2c9:ded9:f20d with SMTP id
 r11-20020a92cd8b000000b002c9ded9f20dmr3307152ilb.300.1649228714777; Wed, 06
 Apr 2022 00:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220331084151.2600229-1-yosryahmed@google.com>
 <YkcEMdsi9G5y8mX4@dhcp22.suse.cz> <CAAPL-u_i-Mp-Bo7LtP_4aJscY=1JHG_y1H_-A7N_HRAgtz+arg@mail.gmail.com>
 <87y20nzyw4.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAAPL-u8wjtBRE7KZyZjoQ0eTJecnW35uEXAE3KU0M+AvL=5-ug@mail.gmail.com>
 <87o81fujdc.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAAPL-u_6XqQYtLAMNFvEo+0XU2VR=XYm0T9btL=g6rVVW2h93w@mail.gmail.com>
 <87bkxfudrk.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAAPL-u_FVEVE+wTBNYfDibLVKsRuOwEnpigYYRiZ2MbeUs1u8w@mail.gmail.com>
 <877d82vi13.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <877d82vi13.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Wei Xu <weixugc@google.com>
Date:   Wed, 6 Apr 2022 00:05:03 -0700
Message-ID: <CAAPL-u8u77yazFpc2R216j6ObAiANb0Lfxt7DcT9P=3eg60u9Q@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        Yosry Ahmed <yosryahmed@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Cgroups <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Thelen <gthelen@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 5, 2022 at 11:32 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> Wei Xu <weixugc@google.com> writes:
>
> > On Tue, Apr 5, 2022 at 7:50 PM Huang, Ying <ying.huang@intel.com> wrote:
> >>
> >> Wei Xu <weixugc@google.com> writes:
> >>
> >> > On Tue, Apr 5, 2022 at 5:49 PM Huang, Ying <ying.huang@intel.com> wrote:
> >> >>
> >> >> Wei Xu <weixugc@google.com> writes:
> >> >>
> >> >> > On Sat, Apr 2, 2022 at 1:13 AM Huang, Ying <ying.huang@intel.com> wrote:
> >> >> >>
> >> >> >> Wei Xu <weixugc@google.com> writes:
> >> >> >>
> >> >> >> > On Fri, Apr 1, 2022 at 6:54 AM Michal Hocko <mhocko@suse.com> wrote:
> >> >> >> >>
> >> >> >> >> On Thu 31-03-22 08:41:51, Yosry Ahmed wrote:
> >> >> >> >> > From: Shakeel Butt <shakeelb@google.com>
> >> >> >> >> >
> >> >> >>
> >> >> >> [snip]
> >> >> >>
> >> >> >> >> > Possible Extensions:
> >> >> >> >> > --------------------
> >> >> >> >> >
> >> >> >> >> > - This interface can be extended with an additional parameter or flags
> >> >> >> >> >   to allow specifying one or more types of memory to reclaim from (e.g.
> >> >> >> >> >   file, anon, ..).
> >> >> >> >> >
> >> >> >> >> > - The interface can also be extended with a node mask to reclaim from
> >> >> >> >> >   specific nodes. This has use cases for reclaim-based demotion in memory
> >> >> >> >> >   tiering systens.
> >> >> >> >> >
> >> >> >> >> > - A similar per-node interface can also be added to support proactive
> >> >> >> >> >   reclaim and reclaim-based demotion in systems without memcg.
> >> >> >> >> >
> >> >> >> >> > For now, let's keep things simple by adding the basic functionality.
> >> >> >> >>
> >> >> >> >> Yes, I am for the simplicity and this really looks like a bare minumum
> >> >> >> >> interface. But it is not really clear who do you want to add flags on
> >> >> >> >> top of it?
> >> >> >> >>
> >> >> >> >> I am not really sure we really need a node aware interface for memcg.
> >> >> >> >> The global reclaim interface will likely need a different node because
> >> >> >> >> we do not want to make this CONFIG_MEMCG constrained.
> >> >> >> >
> >> >> >> > A nodemask argument for memory.reclaim can be useful for memory
> >> >> >> > tiering between NUMA nodes with different performance.  Similar to
> >> >> >> > proactive reclaim, it can allow a userspace daemon to drive
> >> >> >> > memcg-based proactive demotion via the reclaim-based demotion
> >> >> >> > mechanism in the kernel.
> >> >> >>
> >> >> >> I am not sure whether nodemask is a good way for demoting pages between
> >> >> >> different types of memory.  For example, for a system with DRAM and
> >> >> >> PMEM, if specifying DRAM node in nodemask means demoting to PMEM, what
> >> >> >> is the meaning of specifying PMEM node? reclaiming to disk?
> >> >> >>
> >> >> >> In general, I have no objection to the idea in general.  But we should
> >> >> >> have a clear and consistent interface.  Per my understanding the default
> >> >> >> memcg interface is for memory, regardless of memory types.  The memory
> >> >> >> reclaiming means reduce the memory usage, regardless of memory types.
> >> >> >> We need to either extending the semantics of memory reclaiming (to
> >> >> >> include memory demoting too), or add another interface for memory
> >> >> >> demoting.
> >> >> >
> >> >> > Good point.  With the "demote pages during reclaim" patch series,
> >> >> > reclaim is already extended to demote pages as well.  For example,
> >> >> > can_reclaim_anon_pages() returns true if demotion is allowed and
> >> >> > shrink_page_list() can demote pages instead of reclaiming pages.
> >> >>
> >> >> These are in-kernel implementation, not the ABI.  So we still have
> >> >> the opportunity to define the ABI now.
> >> >>
> >> >> > Currently, demotion is disabled for memcg reclaim, which I think can
> >> >> > be relaxed and also necessary for memcg-based proactive demotion.  I'd
> >> >> > like to suggest that we extend the semantics of memory.reclaim to
> >> >> > cover memory demotion as well.  A flag can be used to enable/disable
> >> >> > the demotion behavior.
> >> >>
> >> >> If so,
> >> >>
> >> >> # echo A > memory.reclaim
> >> >>
> >> >> means
> >> >>
> >> >> a) "A" bytes memory are freed from the memcg, regardless demoting is
> >> >>    used or not.
> >> >>
> >> >> or
> >> >>
> >> >> b) "A" bytes memory are reclaimed from the memcg, some of them may be
> >> >>    freed, some of them may be just demoted from DRAM to PMEM.  The total
> >> >>    number is "A".
> >> >>
> >> >> For me, a) looks more reasonable.
> >> >>
> >> >
> >> > We can use a DEMOTE flag to control the demotion behavior for
> >> > memory.reclaim.  If the flag is not set (the default), then
> >> > no_demotion of scan_control can be set to 1, similar to
> >> > reclaim_pages().
> >>
> >> If we have to use a flag to control the behavior, I think it's better to
> >> have a separate interface (e.g. memory.demote).  But do we really need b)?
> >>
> >
> > I am fine with either approach: a separate interface similar to
> > memory.reclaim, but dedicated to demotion, or multiplexing
> > memory.reclaim for demotion with a flag.
> >
> > My understanding is that with the "demote pages during reclaim"
> > support, b) is the expected behavior, or more precisely, pages that
> > cannot be demoted may be freed or swapped out.  This is reasonable.
> > Demotion-only can also be supported via some arguments to the
> > interface and changes to demotion code in the kernel.  After all, this
> > interface is being designed to be extensible based on the discussions
> > so far.
>
> I think we should define the interface not from the current
> implementation point of view, but from the requirement point of view.
> For proactive reclaim, per my understanding, the requirement is,
>
>   we found that there's some cold pages in some workloads, so we can
>   take advantage of the proactive reclaim to reclaim some pages so that
>   other workload can use the freed memory.
>
> For proactive demotion, per my understanding, the requirement could be,
>
>   We found that there's some cold pages in fast memory (e.g. DRAM) in
>   some workloads, so we can take advantage of the proactive demotion to
>   demote some pages so that other workload can use the freed fast
>   memory.  Given the DRAM partition support Tim (Cced) is working on.
>
> Why do we need something in the middle?

Maybe there is some misunderstanding.  As you said, demotion is to
free up fast memory.  If pages on fast memory cannot be demoted, but
can still be reclaimed to free some fast memory, it is useful, too.
Certainly, we can also add the support and configure the policy to
only demote, not reclaim, from fast memory in such cases.

In any case, we will not reclaim from slow memory for demotion, if
that is the middle thing you refer to.  This is why nodemask is
proposed for memory.reclaim to support the demotion use case.  With a
separate memory.demote interface and memory tiering topology among
NUMA nodes being well defined by the kernel and shared with the
userspace, we can omit the nodemask argument.

> Best Regards,
> Huang, Ying
>
> >> > The question is then whether we want to rename memory.reclaim to
> >> > something more general.  I think this name is fine if reclaim-based
> >> > demotion is an accepted concept.
> >>
> >> Best Regards,
> >> Huang, Ying
