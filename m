Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CAEC6FA86
	for <linux-doc@archiver.kernel.org>; Sun, 18 Sep 2022 20:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiIRUkk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Sep 2022 16:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiIRUkj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Sep 2022 16:40:39 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B1212AE6
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 13:40:37 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id m66so28008962vsm.12
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 13:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=p2Y379zqkwz40ZL+4t+CIYoyTLObybL6KsnvdRTVh1w=;
        b=CMNhyAKgueFSnC433vb3wgkwkZ42HQt3WLZ7GEF7I05l0r8US1a01hlcGjTQD3g+9t
         l9jySJJ5TxbFOfF26oa5qfDzWv0DyyH7toXvocwOzifhitj8LL8/H8Y00rk46phggwDD
         fMvc7Kepq2m/8Fook+KqkCu5EYAnqjUbxe/OJhCKYXZyMRArlDl/8TqZkEbBR6kNWjOw
         c40mmBnBNstVSwKQKDTwHGRhb3BQIJT7orXgWM9d5bnQZ0/G61ntKz3yyNdnWhB8ciXq
         8v/SghhHV2PDK4CivHHzGBNJ9TB+5ZPfPo3r5de5YDKmLkZJKIH6vaCSQSBEDEAbWVNk
         KScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=p2Y379zqkwz40ZL+4t+CIYoyTLObybL6KsnvdRTVh1w=;
        b=NtI8rwgjF/O11ZUZ9Z/Xw7DLeHIXF53vrAV2lI3isblbtpM5m+3OdC06nd8w77zwEl
         M0PwH3HWZhk7B9+mhe57iMp0hGHenj1rZCMxwd+1ulrbcX25H7BgbFdat16wSyqQI/Bh
         VAJvU+y9PytIyNOFm2JJyz6Sp+T+Gk7cQo3XARbtxLdZfeMVGB0hHhSiJJxl0eqVF7aG
         ml4Cpz1rgp/aP+oW7y5QoVZbuyuQqhTl5wPSPk3+mIiVZyP4IQun4D+cktk0F2jWKjnM
         5Eo9cK0ZiYwKPGNfBs4sc3iywNr263EIQZPwTpOy2uQjKwxu5fA/FfOwTGg9blAhoHwF
         6j4Q==
X-Gm-Message-State: ACrzQf3Q8FtuSFlFKNaNUk9/eVkdlq8T9wrZGfs8vQH9Ach2sGIUtPkI
        eO6iJoMMmqfWygrX9lwmaRvAhbNZIIQ23+gjv56dtg==
X-Google-Smtp-Source: AMsMyM5zsVVinbCD1mPksNskV06acgMEYCscCac9teY2zIOIGR1JAkwN86Uoa+vkhuhs7gR4TmsSqOguAcLBmI9QjPg=
X-Received: by 2002:a05:6102:3309:b0:39a:e5eb:8508 with SMTP id
 v9-20020a056102330900b0039ae5eb8508mr1821685vsc.65.1663533636994; Sun, 18 Sep
 2022 13:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220911170814.f6a32b40e64397a61b1f8daf@linux-foundation.org>
 <CAOUHufZk-u0S+FyDEdxw1nehBKz_G_GG_3_LAzqyssx21Wd4Jw@mail.gmail.com>
In-Reply-To: <CAOUHufZk-u0S+FyDEdxw1nehBKz_G_GG_3_LAzqyssx21Wd4Jw@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Sun, 18 Sep 2022 14:40:01 -0600
Message-ID: <CAOUHufZzDCezgeeAj6M3WqOQKJYxQ_4jNCD8itU0+J6JE_fV4g@mail.gmail.com>
Subject: Re: [PATCH v14 00/14] Multi-Gen LRU Framework
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
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

On Thu, Sep 15, 2022 at 11:56 AM Yu Zhao <yuzhao@google.com> wrote:
>
> On Sun, Sep 11, 2022 at 6:08 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > I'd like to move mglru into the mm-stable branch late this week.
> >
> > I'm not terribly happy about the level of review nor the carefulness of
> > the code commenting (these things are related) and I have a note here
> > that "mm: multi-gen LRU: admin guide" is due for an update and everyone
> > is at conference anyway.  But let's please try to push things along anyway.
>
> Thanks for the heads-up. Will add as many comments as I can and wrap
> it up by the end of tomorrow.

I've posted v15 which can replace what mm-unstable currently has.
Apologies for the delay: an unexpected lockdep warning from the maple
tree forced me to restart all the tests [1].

Let me also post the incremental patches after this email, in case you
strongly prefer to add them on top of v14.

[1] https://lore.kernel.org/r/CAOUHufZabH85CeUN-MEMgL8gJGzJEWUrkiM58JkTbBhh-jew0Q@mail.gmail.com/
