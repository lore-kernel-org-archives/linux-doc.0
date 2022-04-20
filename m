Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C45C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Apr 2022 00:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348003AbiDTAmm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 20:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347984AbiDTAmk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 20:42:40 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDCA11C0A
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 17:39:54 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id j16so157883vsv.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 17:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KT16lddZpOeYEOzxjkpuLBwqew5J7d3LxwdLjYYWCDQ=;
        b=sctCgxK1K3o1FcCO7rvQr3ADGC+2y/q5zKIjHhpp8W+eXKQaq+DYjntlCpz7UR9H81
         Tv5YrcqPtfHJzmdKz9P80FH3XA7nIEBfI2SwjV9PwgwTIyvcDxCDY/ahHe4b9Y29ubQS
         ZZuUKsJTeqbluvdFLtz6CwI3+FWQY4RjkNiEQhQrJtX5EFCjClPp+ZSEkCiY6TejT/m/
         2n+FES1CNoeKXkI9nvvM9uUg3IBqLEA2B/SjcEQ/TTR6KJM4SXYQXXBaJN8W8BDSXgZX
         rUmsCxlXsk1u1leLF4gcOGUcacKgrve+KnL4WN1a7FtjdIBjU8L11UzWS8weJnlr8/qd
         63gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KT16lddZpOeYEOzxjkpuLBwqew5J7d3LxwdLjYYWCDQ=;
        b=llxId3wBbL9mktk0p9N1Vt9eCeH3niXHrziHmgssDP+ii1FgdkIX2B7lBAAieewFwY
         VAU/WFcS7qw4gYJqutePwVW3fz18Tj8I2yS4rTptE1noK+hnIFYo6YwzqjijpY6e78B4
         eDoz29RRx62Smzrp4hIlzvE9ofxQ8AEg71RwM8LjHCJ+bGDz2V2JmAuSCGfbBmA8sekr
         Mur/kUf6BYX6FlfXiuaxZRRUV7oi/qBOTC/3VdSqi6vHbetabPqWDH7+/VmDWEpyujsR
         7/hSo/rblDKtStfCS0kd3L9/Djt8fEzbH3jx+QddD+2ebQgg5KNEfdrfc/BajioVR5Rx
         7U2w==
X-Gm-Message-State: AOAM533O34+MClLfmx8WYNeVj+IOMgifQca28vBHD9hYPdlmrFgdxUgL
        dl8NI3Hw174/TECOcny/e53sO3G328fjUpQnLJhpJw==
X-Google-Smtp-Source: ABdhPJxtK3l4fn9+QFdiu0rNZ2xlRrzY2+o6YQzD7NeHRc8+S6Z7hXRtCYNygpfogrJcYbf8Hrjskc6cyluLwGUtJnM=
X-Received: by 2002:a05:6102:5113:b0:32a:76b1:e1bc with SMTP id
 bm19-20020a056102511300b0032a76b1e1bcmr622157vsb.41.1650415193573; Tue, 19
 Apr 2022 17:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-6-yuzhao@google.com>
 <20220411191615.a34959bdcc25ef3f9c16a7ce@linux-foundation.org> <20220412070616.GT2731@worktop.programming.kicks-ass.net>
In-Reply-To: <20220412070616.GT2731@worktop.programming.kicks-ass.net>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 19 Apr 2022 18:39:17 -0600
Message-ID: <CAOUHufbUyTL-xx1RBovfSh+CrK7mBHGOouvyQBjy1RX1f3dkzw@mail.gmail.com>
Subject: Re: [PATCH v10 05/14] mm: multi-gen LRU: groundwork
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 12, 2022 at 1:06 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Apr 11, 2022 at 07:16:15PM -0700, Andrew Morton wrote:
>
> > > +{
> > > +   int gen;
> > > +   unsigned long old_flags, new_flags;
> > > +
> > > +   do {
> > > +           new_flags = old_flags = READ_ONCE(folio->flags);
> > > +           if (!(new_flags & LRU_GEN_MASK))
> > > +                   return false;
> > > +
> > > +           VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
> > > +           VM_BUG_ON_FOLIO(folio_test_unevictable(folio), folio);
> > > +
> > > +           gen = ((new_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> > > +
> > > +           new_flags &= ~LRU_GEN_MASK;
> > > +           /* for shrink_page_list() */
> > > +           if (reclaiming)
> > > +                   new_flags &= ~(BIT(PG_referenced) | BIT(PG_reclaim));
> > > +           else if (lru_gen_is_active(lruvec, gen))
> > > +                   new_flags |= BIT(PG_active);
> > > +   } while (cmpxchg(&folio->flags, old_flags, new_flags) != old_flags);
>
> Also; please use the form:
>
>         unsigned long new, old = READ_ONCE(folio->flags);
>
>         do {
>                 new = /* something */ old;
>         } while (!try_cmpxchg(&folio->flags, &old, new))

Sweet. Thanks.

A related question: if I pass new = old to try_cmpxchg(), does it know
that and avoid an unnecessary atomic op?
