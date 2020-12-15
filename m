Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F276EC4361B
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 17:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A685822ADC
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 17:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgLOR3w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Dec 2020 12:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730449AbgLOR3p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 12:29:45 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E6AC0617A6
        for <linux-doc@vger.kernel.org>; Tue, 15 Dec 2020 09:29:05 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id k4so21922463edl.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Dec 2020 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VeOwIZnD1d1CtAtOQLOWOLhM2A2wCecJ+qK1dyLboTU=;
        b=I96T4pSs/iDVCNO7aKjW2AuZwWdxEU4n91uXkED0FYIBHx0CVqEOOvQXv4kyHisS+A
         gnUtMYosW3bZnF2XVpR+v4DZTcvdLJC3svqRUoIJYTCHB5iE37EAGzkWAWhYaQpy3/Sv
         m96dzGoXG6KSM79QFPjc6zvwIu6CJA7IXqKG0ZnS0D/3pUm8IbEWu46Zs+kc1ktqd4Bw
         gbaxJoc/+fwc7jzPPY1ZRrYpVboVgiSrJ2HG0KqeEI6jSQhXxYxow+OQSOeJVd3wBwza
         h1uBgBabe/R5P5ARfZ9aOAcrr7JWNJOcSYdiOSlzuB7XwH7wZjoKzJKfbwV7tYH66HKG
         uVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VeOwIZnD1d1CtAtOQLOWOLhM2A2wCecJ+qK1dyLboTU=;
        b=E5ZlFWs13EbOHVnSK66mYuRqCD/oHoykx7oKUlNqPkAbilf4NyBL38HyrWBrAN6gvk
         dhclTZk7lbSIyYbjAiPq5rOPnq4617CJA++KHSb/B1JzUsbZEOnWcPBxI9cRbIlEBoLc
         +wm5nqTeMP1NVqjcqe80v1iBMmpk6C6ibJxsKIEf74Uvld9vgjIyGUljQ4eFH8ipljwA
         HfDcQfYP5MY7jC7onnWIMJ/VbMaI9l1zTgsMeVPIdbnz3v6vMcMig825c90uC5FWEVKI
         S5Oqq6gawRy6SDkFRdY7FmRHReCAukhrWYR3QJNdoAmGCbhCpmto6+sA2gWPpbuCVoZ2
         2YOQ==
X-Gm-Message-State: AOAM531/vIBHJ2VJ3e7vkaBlwoU3u7jlHChk7VjSxp/I3hpug6tRa/Qm
        pKHVYbceHfV+Wf97dq8CmU8kE1jIWp0M6e7McKGDxA==
X-Google-Smtp-Source: ABdhPJwO7x4LC0rkTRzmFQ3G3z7COZCV+iAl/I4ipG0U3kkQDJA750UT3AF9UiLPI5TShsk8sR9viFmJkSFFwZNTOsM=
X-Received: by 2002:a50:f404:: with SMTP id r4mr3451244edm.62.1608053343982;
 Tue, 15 Dec 2020 09:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-5-pasha.tatashin@soleen.com> <20201214141715.GF32193@dhcp22.suse.cz>
 <CA+CK2bCWkPDw-Aif6iXHq15Dpa+50hmrcAk_LpMCMk30zY5aFw@mail.gmail.com> <20201215082748.GL32193@dhcp22.suse.cz>
In-Reply-To: <20201215082748.GL32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 15 Dec 2020 12:28:28 -0500
Message-ID: <CA+CK2bA3B=Awh2BK=jwZX39PTeQ9=O5tD0ohNCyL_Lf3LQwfog@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mm: honor PF_MEMALLOC_PIN for all movable pages
To:     Michal Hocko <mhocko@suse.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Fair enough. I still dislike cma being called out explicitly because
> that is slightly misleading as well. gpf_to_alloc_flags would be more
> explicit I believe. But I do not want to bikeshed this to death.

Sounds good, I renamed it to gpf_to_alloc_flags.

Thank you,
Pasha
