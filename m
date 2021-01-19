Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F85EC433E6
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 18:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CCCD216FD
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 18:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbhASShQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391467AbhASSfo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 13:35:44 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9091EC061575
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 10:35:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ke15so22255217ejc.12
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ct+vcUpxOjScIL+qAWZyF8knx6gxVliNtyQsEHsrnBQ=;
        b=BZe8awveFMq5GincJDNVuax+pU2IN/5C9pNKCNqUs9yROKpwZH1EZi26i4cskhGgts
         LII0hwEUCFrmUnS9VhpzvWJaH/THjYoCLkOL5y59cRy9Pi8y8m7cle0ouKhiR+qVd48Y
         1oSq4GGmA983vt0d8xpUHcVPHW/ai9FuZwTL9vqIiU/gHm3IA5IuUXBOm5GA/XKdEobF
         rwKxMX2jZR+kjWjBjA/ZQh/tFExxv01CpNHBLazxFhAIQGrcXcvtxWNt0O385H6icruS
         pNEIfHrArsdVfXtKXjZp7ImGEY3/7TOtRniIqG5iFaGU2sjo1pdfb/EbSos1zRgaftyp
         PqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ct+vcUpxOjScIL+qAWZyF8knx6gxVliNtyQsEHsrnBQ=;
        b=Cw9wzZi8NoLTI1wW9KkXoGuoDyXy41y61d5ZY2PNv8ONvLI+NdMk8931Vhv/nXAQ73
         dlE3OXE+QoyRXUraYXoSnBpRRC8G53OjBJQts9+fCgjUtYYjZLMgc/eeHdBwMsrQk6nj
         dMfIbUQJLJLGWy0cWhZaWxm3fBeYaOkEBaVQpgBjczf25AdzklpV82U+53krmuF20ZQx
         mLFJe4LqhOrFemX12N8NMTp8IBAqNuha45wDXYSvxcM+PP96qFSPQ06qB3nn7Wiu38fE
         s1XAkiZQ5A9BXKP6soBITpab6UDgxg2n81JKtaPcbEHxnFESJ1rZPonx5jKub6+sIy3m
         DYfw==
X-Gm-Message-State: AOAM531nlkB9GqtOiJyGBBxTxzGopJQuWQjjAGvT/uQg91UNXlzaW4Sp
        9FlijKfbPODKz8gZ/h8DJt6mFQBylzAAF6FguOTViA==
X-Google-Smtp-Source: ABdhPJxq2+sfTG3ORVXYvyp4uAxt4hNSEd/oukNuDPHO3IHBTF8PXk9SD4PxTgPj0Ma3BgJmPR49bmjsQLfU4aQP2Oc=
X-Received: by 2002:a17:906:cedd:: with SMTP id si29mr4046472ejb.426.1611081302258;
 Tue, 19 Jan 2021 10:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
 <20210119043920.155044-9-pasha.tatashin@soleen.com> <20210119183013.GB4605@ziepe.ca>
In-Reply-To: <20210119183013.GB4605@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 19 Jan 2021 13:34:26 -0500
Message-ID: <CA+CK2bBKbht34Hkg9YvhwYAiAjd3NMd_+Eir9wfx+07V-Y2TTA@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] mm/gup: do not allow zero page for pinned pages
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

On Tue, Jan 19, 2021 at 1:30 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Jan 18, 2021 at 11:39:14PM -0500, Pavel Tatashin wrote:
> > Zero page should not be used for long term pinned pages. Once pages
> > are pinned their physical addresses cannot changed until they are unpinned.
> >
> > Guarantee to always return real pages when they are pinned by adding
> > FOLL_WRITE.
> >
> > Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  mm/gup.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
>
> No, this will definitely break things

What will break

>
> Why does the zero page have to be movable?

It is not even about being movable, we can't cow pinned pages returned
by GUP call, how can we use zero page for that?

>
> Jason
