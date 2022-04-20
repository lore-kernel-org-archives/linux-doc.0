Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EE1C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Apr 2022 00:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358621AbiDTAxu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 20:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358599AbiDTAxt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 20:53:49 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F0E2316D
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 17:51:05 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id a127so169836vsa.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 17:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7H+ruNwzO0FOIHU2htbNl3Kgc9iK+Bls9V1N1i8rMc=;
        b=OnOMTCYq6051btEbQdA/SW6lBMQiN41PdkjZlZG9x+F5Z2Fp5ZPf9z3O5FGQD5I3Bt
         Aqu7Ir9V4PuJOLUX9+z0nt4ZBEu7ggItdDaVZUwN89XoqjYFb6VBywYIUchsvFvvv1rI
         bzHI8BCjqL8SdtnES04F7vRBggnpY9MAgIO8xVKkizf12bGKssGMk4bSgP8B4IH1yS/E
         zfYNJ3dwvbrKbqzRglxjYZA35Q1DlfsX8LSRzy0XMy7bChgH6VA+85s9R9/TGye6bm4a
         jnN+Ldnj+yMwk7NhkcyubqFwa4NQNmZS+LtzcgI5ImpG+dVAsJIIVacqu1rkoYOv3lfv
         mT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7H+ruNwzO0FOIHU2htbNl3Kgc9iK+Bls9V1N1i8rMc=;
        b=hP/d770mJH5GligpyRjE+TL73TdthKwLI1OXntOs3JMt107hi0k/ksE6eoWb7prZia
         mje26MSv4hrIACbjhRdSSAkQaF/1xAxYqP6bH6J1NDsHWeHgdTRDHE9MIMVHzTXhx5/t
         rl2kdJiQWLekdzlmmaqzUIQ5/9LScDgss7qE5dMBeQFlDiijNqdfRokixO2jFTKmFOhy
         TvHGQuRWV2Jqaw+0g6rhxFfDpI/xBS6iR3wAY0RQepS4EVEKSv0gDTjMILihazDOuw2W
         NHmMstjTvo8x9apw9H5RTRDeWCoMBYSim9/jDS2dfVJ0eG5auVWWGiJ/CRUaTksBOTX+
         orrw==
X-Gm-Message-State: AOAM530tiC5NTZtvF4PJGOKYeXvPHuevkzJzPhcRvMd9mYBr0ts7C9KA
        MegEcnHbyGGfE0Od0UJiXJD/b9Hxc2loDvliPgsd4w==
X-Google-Smtp-Source: ABdhPJwuEo0eOW39/zOg7eYcPPJSP/xsmVyuFfGg9nS0PhO8HBJcxJV/zMegVDXjYoxfbeDFOkSb45wsppx48DRHipM=
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id
 v12-20020a05610205cc00b003209bd23823mr5664333vsf.81.1650415864537; Tue, 19
 Apr 2022 17:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220413220636.dd33898d36156bc7339f04e9@linux-foundation.org>
In-Reply-To: <20220413220636.dd33898d36156bc7339f04e9@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 19 Apr 2022 18:50:28 -0600
Message-ID: <CAOUHufb5OiJr41+z0aUTZsShVhH30=YVoEVv39Li53jOin4hRw@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] Multi-Gen LRU Framework
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
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
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 13, 2022 at 11:06 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> The code uses
>
>         struct lru_gen_mm_walk *walk
>
> in some places and
>
>         struct mm_walk *walk
>
> in others.  This is already driving me nuts.  Can we please use
> different identifiers for different types?

Sorry.

Going with "struct lru_gen_mm_walk *args", unless there are objections.

("struct mm_walk *walk" is an existing convention so I don't think I
should change that.)
