Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5152AC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 23:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 135A723359
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 23:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394128AbgLKXCP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 18:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394147AbgLKXBv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 18:01:51 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CFBC0613D6
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 15:01:10 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id d17so14535810ejy.9
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 15:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GFKYVdHrtwiwhpkA9Do2VXDD8m9+meK8R9Kfm6AFeIA=;
        b=G2L4nkG+2a86HWG47Xy/ZeS/JPagQ4S1iIDkdkmNZpGdbylfdMtdumDUhfYLrN36a6
         r9FcBfGlLA7oNgYPSWV1452G0gLBfHfX9R/E5/r9UdnLW8lnvQ9LqoFZS0YtcXAwMTIX
         gW/an9znixcgNfMIT+JAL8lkvMRONvK7hFpqDrxZFOfOTLhQoEt41+mGqIIqueIZOVkf
         +2Emj+V3RHlGGQ8M73ZLp4PsvMdlvnmx8o3rxEp/h/EkVuvAKo1vK/N/tIALBi1PsdR/
         0Oc78b1RKA5d6ZjtGsNlOeTt8MfSltcvsCZvL9Ufh4LISbNNGeOZBvy/dNtQL1IyQsJe
         4oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GFKYVdHrtwiwhpkA9Do2VXDD8m9+meK8R9Kfm6AFeIA=;
        b=bhSxVFPndIeisu4RwhbpkAzC9X3AkSzQYRuLx9gvFqVLEhGPqVA4ucy67nHDYTmpG6
         1yEbEYo3JKKDOB+v/MttSL+VC/x38Sf1jD0b3RC2j7YqUu10lRYRmFGWFDnsHWHXFYsb
         hk7D256T8CPAaeTJGGY+wNk438xfExAbboIhDjwWonEwnD9O4jFU7nUM/hYSvSCLnQb+
         Mlb2x7sN4QddMXdRxxK0cq86WomZDiW8vjPhgK7CN3U8WHNEhsEzAIMDnK48/X89l9+C
         xXT7HP/gTiyx14yTunSlepkXmQ5JckoY32tMCgRXQKEGgcK8/77RUyZOtdfyfwC8Z0el
         ZTHg==
X-Gm-Message-State: AOAM532C50j1lOHQS22JwvXgZe5i8/ehqX1FgDJmvS+VCHub56whVjtK
        sRx2VnJZzRWSXkYPvRjLIt54kGLZtqreOXcHdkLHBA==
X-Google-Smtp-Source: ABdhPJyqbqsuDfUDja0QJ+RweV4KYLSy8rVso6oP4CDyyGfCYOb553/fgMxzadNtHa9ok0zws+8ygrJLM02XhpZm984=
X-Received: by 2002:a17:906:fb9b:: with SMTP id lr27mr13275461ejb.175.1607727669571;
 Fri, 11 Dec 2020 15:01:09 -0800 (PST)
MIME-Version: 1.0
References: <CA+CK2bCc9gk3Yy+ueaZVJs90MFE3fqukLsdb5R2kTUH4tWRbkA@mail.gmail.com>
 <447A41F3-EB94-4DA4-8B98-038B127774A5@redhat.com>
In-Reply-To: <447A41F3-EB94-4DA4-8B98-038B127774A5@redhat.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 11 Dec 2020 18:00:33 -0500
Message-ID: <CA+CK2bAok_0Q+AovxVYqtsObVbbxr+ZZcTgP76uxEvDy-uJWsQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
To:     David Hildenbrand <david@redhat.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> I guess revert what we did (unpin) and return an error. The interesting question is what can make migration/isolation fail

OK. I will make the necessary changes. Let's handle errors properly.
Whatever the cause for the error, we will know it when it happens, and
when error is returned. I think I will add a 10-time retry instead of
the infinite retry that we currently have. The 10-times retry we
currently have during the hot-remove path.

>
> a) out of memory: smells like a zone setup issue. Failures are acceptable I guess.
>
> b) short term pinnings: process dying - not relevant I guess. Other cases? (Fork?)
>
> c) ?
>
> Once we clarified that, we actually know how likely it will be to return an error (and making vfio pinnings fail etc).
