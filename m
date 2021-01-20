Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4663C433E6
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 15:38:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CB5F23381
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 15:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387480AbhATOvu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbhATOaP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 09:30:15 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7B8C061757
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 06:29:33 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id b2so25977192edm.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 06:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aWKyefarMbYIm9jBTqpiNhh/6bAejOIVblFl9gQry+g=;
        b=hBG5Ou0+aFLFtMuylp824skZ3YhwWPOzMPQdaY4BvFxy9bB80kYsRcBjcdtUjxaXVP
         CsPfqCtighWVowwnBb+hg+kemkOdx9nwUspExzovcd38OMWJDsXLfTc54Wbt6tSIe2ax
         ETqrU1ivUmJMLtMpGJbfj+vg6KISY2kF6n61a3YTQ4GacMaMVo2ZOGPSJK9ulTPFocob
         KSjeVtDkQlfDeAWUypUAXnZKOASD4PayXH5XSOCvsQ+qNysWynFwXILGR6TKrLQHrcUN
         ucwW11P780+wH+Qmbvv7kQMqw6A4J7/ZvL9RWjIaBBz9U0nMJ2gSRD6egPM8VUPlhdRM
         LZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aWKyefarMbYIm9jBTqpiNhh/6bAejOIVblFl9gQry+g=;
        b=BmncVa2Ob/BliXafM9tWq1PmUEYx1UNlRszRF54AoUectjPxl5kW3TW2bW2zhRxMed
         ndnNEzA+rolTDmRmKE9pMeyd7fFJsgaqVGQFH87dyrL1vD49oVnuSVX+kkMh7lJjV/q8
         JPXT0M4I0tJRbUoRBcnCRWYcSf87NLlSWwCT0NE+xSvW+bcv5uaWIW0dCgiF7+CIdjef
         LJf2vnyze7YxqGYTcht34RBwcCjHycfWBwNEq5FMXYHWYohWwzZUKNKWY59I/uWXF20G
         BeQot0GeZHpQ6P97StGx2dU2R8a2qoh/J4HXFKCcB41YFD2aLpp4HWDk1nGfrNW9bZfS
         x+gg==
X-Gm-Message-State: AOAM531ZEoOTN+bMhMuFsPhmPPkG9mWY3jjrzATzBKP5reSnCjdrcCme
        tJMTYISg+JF74Yba7R6Op1FJeR8h96N+cCcTlDuF+g==
X-Google-Smtp-Source: ABdhPJwze6NV/ha3BievmTANJDfno2T0aPGGSxEhsUs5hyBy6ils0rshJXhBgBEdw1VCARcVcYQzhHidUQdPuFxOACE=
X-Received: by 2002:a50:934a:: with SMTP id n10mr7450794eda.26.1611152972587;
 Wed, 20 Jan 2021 06:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
 <20210120014333.222547-11-pasha.tatashin@soleen.com> <20210120132223.GH4605@ziepe.ca>
In-Reply-To: <20210120132223.GH4605@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 20 Jan 2021 09:28:56 -0500
Message-ID: <CA+CK2bAcbLzWTC3b=FqtSODG2ZWEK56AoWAQKnPWbJTzn3w6+g@mail.gmail.com>
Subject: Re: [PATCH v6 10/14] memory-hotplug.rst: add a note about
 ZONE_MOVABLE and page pinning
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 20, 2021 at 8:22 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jan 19, 2021 at 08:43:29PM -0500, Pavel Tatashin wrote:
> > +.. note::
> > +   Techniques that rely on long-term pinnings of memory (especially, RDMA and
> > +   vfio) are fundamentally problematic with ZONE_MOVABLE and, therefore, memory
> > +   hot remove. Pinned pages cannot reside on ZONE_MOVABLE, to guarantee that
> > +   memory can still get hot removed - be aware that pinning can fail even if
> > +   there is plenty of free memory in ZONE_MOVABLE. In addition, using
> > +   ZONE_MOVABLE might make page pinning more expensive, because pages have to be
> > +   migrated off that zone first.
>
> Just to point out, if anyone is using RDMA/etc with hotplug memory,
> this series is likekly going to be a major regression for those users.

Right: one is because we now prohibit pinning any pages in a movable
zone, second reason is because we now check every page during
migration that fixes an existing bug.


>
> Jason
