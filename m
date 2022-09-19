Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9146DC54EE9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 07:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiISHrZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 03:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiISHrY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 03:47:24 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7F8E011
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 00:47:23 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id h1so29000058vsr.11
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/PHn/Gy1a7Z+hal+yCvtIZwC3G1JXzF/DO5kcVpMiD8=;
        b=R39TUR+nAZX0EE3zHANcCb8nSL7JSWQTAqMiM3Xj0VBqlLdYrRPEannkRiveUCVme2
         Gz2o17BQy3pzGWez3hzSsVLEDOPMLjsDMrXQCoPo2u3VyGY349D26HlN/kA/j11+mJ/a
         rP1XTwRvZmPKyMrXkDjxwEXkIkILdlCW9RuxsRKwqsR972sosD0xKZ8VLnPElMHTksrD
         R3UQ2wYEAA714lnJ5CRWcgmSNJmyM0x2j0l0ofsgmh/Wk5TUj2J9rWTwCmwaasD2YLQX
         z9BL6+opPgrKot7ukyZgJliMDPNEQLeRLpxkyYW8xGM1wewacWRi9RVHwJEBP9GT1D2h
         helw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/PHn/Gy1a7Z+hal+yCvtIZwC3G1JXzF/DO5kcVpMiD8=;
        b=3//n4B+moErnSe/7u/697vo6H2KfXX9FHK6RUJtmEH8JTRBPoOMiR/Uudq8eg6+OKd
         99h8QtBo08LAMOZpdNAB7hsFiOH0Hi4KdLWb0xsdx9zXGqQ6ycp3TlDH1ZQXKAf2Bmf2
         tDCkcpM5Cm1czO4+GCjcG+Xrw3JlzwMKOSf9uUmUdhj6eZC+ep+loGdrOMpH7Le0bKMv
         4r9cZHEyN3oi0tOTuiYDe6Moo4jKmRN6x9lp1hpTgOa+ha1XmmnG1uUcpZmvUccID3Rc
         buJ3SCgQHhpGFyKpiRH8bUf1C96VOvI1m5eItK9+Y/MOETMSD8GRC55dAcNoICDSQghV
         TVAg==
X-Gm-Message-State: ACrzQf3vsCHdPRNT6DQz6si9xmkhqXrsCmcjp5ol5/fW5z8Srjq+KEi7
        rgF26RkpZpODOidJ+ykELmjeGtVK7GsXRfnurkjZ2A==
X-Google-Smtp-Source: AMsMyM5kzWxsrb1erQ/kENmbGcrdrrVyrIbHnsZUERsw8iN39Sfc16M2lW+166PtbhuTm5MT0p+ybX7Oneo/SRerxQE=
X-Received: by 2002:a05:6102:3309:b0:39a:e5eb:8508 with SMTP id
 v9-20020a056102330900b0039ae5eb8508mr2347637vsc.65.1663573642253; Mon, 19 Sep
 2022 00:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220918080010.2920238-1-yuzhao@google.com> <YyfPO8rVujtUzEwt@debian.me>
 <20220918221956.04beefd36e3622490059e537@linux-foundation.org>
In-Reply-To: <20220918221956.04beefd36e3622490059e537@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 19 Sep 2022 01:46:46 -0600
Message-ID: <CAOUHufazxWcUcj5joPeA6NabvyvA0G7cuJdQPBCLj2v_YOo2Sw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v15 00/14] Multi-Gen LRU Framework
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
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
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 18, 2022 at 11:20 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 19 Sep 2022 09:08:59 +0700 Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> > The base commit is on what tree? Or I have to wait for rebasing this
> > series on top of latest mm-unstable.
>
> I pushed this series out in mm-unstable several hours ago.

Thanks. The last patch from this series (design doc) seems to be
missing in mm-unstable.
