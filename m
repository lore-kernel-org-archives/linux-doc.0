Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB5EC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 05:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiJSFvj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 01:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiJSFvi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 01:51:38 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C486A5509A
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 22:51:37 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id b81so7887720vkf.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFGd93jrtvQiqJNlNhKuSpttJ7R1kimxCliY9JMGiO8=;
        b=rJov42dEZxyrkHBKooMuGFtyzEjE4ZBDyIxL72lQMhBaeYY6i92BmHDEPO0B0wqlwm
         aHK68k7QphWmEUwpaLnaps9i4e3xGcwIIfdVeqpqI4bwpxCvaJ6jyRCjyxHdJj23NVqh
         kk3/vJ/JyO2IT5LGQcCJVw4BXWRWy1cVROSxF1Xx+u/d83nJLOT6iVZVMttVgUQdV/NM
         dCxMC78eZgziUDScLpEiAcir1junGES6X7m/KrNQaxvtB0F9K7ZcETXi6YtMinZhkTTk
         3XHZ9UpInXF+eLXMQU8g3z4I165lKqAAsi+inDQCuy6iOSF5zZ2fq/E3OttwUDjXVOR3
         vFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFGd93jrtvQiqJNlNhKuSpttJ7R1kimxCliY9JMGiO8=;
        b=WpcGUkku+ZLITiGOZWtcCM800u6hlwJTbixMAk8hHdHZMcoqn4SeyFLHfBFsWAsR8N
         k1j82MPyTspJx0edKK39SxVqChfe1kACXAM7BBMEea/N8Asr2bSdhopOKjiMIOkSGIxg
         nZburdSFEAoLHxBC6ZPP0NzpOtTWj5AQL4fLEcTJY/70MTbN+P6aDDIgIYqfp4hkOUgf
         gepamtj4kcJeiWMsSxFrIVwT6pQyQ93H33X1gmyKtT9G/Uy4apXtTdNfsn2pMDzR8zRK
         7xAmaw11leUT7aRu6IOhDagCM25l6TQ3UHlfTFKDooZUp6Eyd6jlIh+HEHHaGQ7solOe
         4wZA==
X-Gm-Message-State: ACrzQf0b8Y8gHl5hABV7149JNnVULNwGCgsBbyX6WOoj2Wb7am/cJxtU
        4BhSEKoEcwnWyi+9ssMBSxWtiPxYLqdJyMPjJ9Mx5g==
X-Google-Smtp-Source: AMsMyM4guPNgQoa7KlximIDZAmk9KlZ4Y4bJcH4mqoVFcaNoTZPJTr8XAHHByaU++HZ+c2XUuSu3ELrJpZlkGkFLxYw=
X-Received: by 2002:a1f:988c:0:b0:3aa:cf0a:e0f7 with SMTP id
 a134-20020a1f988c000000b003aacf0ae0f7mr3164429vke.24.1666158696774; Tue, 18
 Oct 2022 22:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220815071332.627393-9-yuzhao@google.com>
 <Y0go8wWtdcyH1+Ch@hirez.programming.kicks-ass.net>
In-Reply-To: <Y0go8wWtdcyH1+Ch@hirez.programming.kicks-ass.net>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 18 Oct 2022 23:51:00 -0600
Message-ID: <CAOUHufa9+FTO3Pv-5jC-e3S5goPsUGu-5KcPVHa4bWb0X+d2ug@mail.gmail.com>
Subject: Re: [PATCH v14 08/14] mm: multi-gen LRU: support page table walks
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
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

On Thu, Oct 13, 2022 at 9:04 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Aug 15, 2022 at 01:13:27AM -0600, Yu Zhao wrote:
> > +     for (i = pmd_index(start), addr = start; addr != end; i++, addr = next) {
> > +             pmd_t val = pmd_read_atomic(pmd + i);
> > +
> > +             /* for pmd_read_atomic() */
> > +             barrier();
>
> Please clarify the above. This is an entirely inadequate ordering
> comment.

If it's acceptable, I'll copy what we have in
pmd_none_or_clear_bad_unless_trans_huge():

        pmd_t pmdval = pmd_read_atomic(pmd);

       /* See pmd_none_or_trans_huge_or_clear_bad for info on barrier */
#ifdef CONFIG_TRANSPARENT_HUGEPAGE
        barrier();
#endif

        if (pmd_none(pmdval))
                return 1;

pmd_read_atomic() should have a built-in READ_ONCE() in the first
place. If we have to use pmd_read_atomic(), it means we are not under
PMD PTL. So we can also race with pte_alloc(), regardless of THP
split. In this case, compiler reordering probably won't cause any real
damage, but technically not having barrier() is still a bug and will
trigger KCSAN warnings, I think.
