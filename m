Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8122C4361B
	for <linux-doc@archiver.kernel.org>; Fri, 18 Dec 2020 13:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E84223A62
	for <linux-doc@archiver.kernel.org>; Fri, 18 Dec 2020 13:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgLRNGW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Dec 2020 08:06:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48916 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727347AbgLRNGW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Dec 2020 08:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608296695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e/CHgMLH2UdVHVqifkFPGlm0faQZyFjgpZO1JW9Bwng=;
        b=ffalwG+ne5tjopKXp1Xb7t8E94ogOxgymDiVVdHOjqqwqsoulvgiDczPgyU+8zOkoLiyVG
        UW4AmyhZb1Jxq7I/rdcjeX3prIFq+zufelAMEmDQRJ7zSd5bq96rxg2df2dHj0pQcOrqkP
        j7jjrxGG6U58tqmj4ESR0wL5Jkpqjgw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-YxXEyUwTM7WV_Ormx03f7g-1; Fri, 18 Dec 2020 08:04:52 -0500
X-MC-Unique: YxXEyUwTM7WV_Ormx03f7g-1
Received: by mail-wm1-f69.google.com with SMTP id w204so726625wmb.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 05:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=e/CHgMLH2UdVHVqifkFPGlm0faQZyFjgpZO1JW9Bwng=;
        b=F6PsxM85d5sDOEFE57tE7LXq6tzn9pnxgMFjd4As7aoiKQMLV1pjosg/EbnHM+DfIF
         pJrcw3vztjCEax8UivKiiae8kZs0CdxILN8xis+WbZfm6ptvlTbLGxUbyQJXF+Mux1z4
         sBA/Tc+8CmNr5ipz5kIC2Q+uVLLSaI2P8FiKuxvY2NZx2jhO9b5ellKPc3jZIocZcbir
         YBuE8S4HFB6BKXvU2S4bzw1rFwExl/4anlYF85suBEbRfoZcYZyTDsvu86OJf3kyrICT
         I3HRRRtmChqLmBMUbHWI+8ewZdm9Djm511+WCz+cPM2C9YFY92z35StBm584YYQmHjm7
         sGnQ==
X-Gm-Message-State: AOAM533tHqEg4XUTt1yBXAKhMvm3qC8VYVZudojjeQNd9cKVFdvvlye0
        N4AgA3OaU6zBbRHJaSoqibQ77TOHwKGNY3Q7yeRrQwP0EK4gIVaZ9dgwpd96BIAQIpYuQJYfiQZ
        909nFSFGBt4StirP4BMGn
X-Received: by 2002:a5d:674c:: with SMTP id l12mr4337393wrw.399.1608296690709;
        Fri, 18 Dec 2020 05:04:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvXjhuHussNqD/bNTJR7GABzVwieD5LhDI+X6Xwo5OKXtYsMIhoNZrAqgzmYzqeytY6lA7sw==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr4337352wrw.399.1608296690473;
        Fri, 18 Dec 2020 05:04:50 -0800 (PST)
Received: from [192.168.3.114] (p5b0c6327.dip0.t-ipconnect.de. [91.12.99.39])
        by smtp.gmail.com with ESMTPSA id k10sm12747574wrq.38.2020.12.18.05.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 05:04:49 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures, honor failures
Date:   Fri, 18 Dec 2020 14:04:48 +0100
Message-Id: <1671AFC0-3D06-4C4E-934D-CB6DC0AFE4A1@redhat.com>
References: <CA+CK2bCn++2Sk4-Eunibj6f+JoOL77uJQXGU2+dScHQ3RgC7_Q@mail.gmail.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
In-Reply-To: <CA+CK2bCn++2Sk4-Eunibj6f+JoOL77uJQXGU2+dScHQ3RgC7_Q@mail.gmail.com>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
X-Mailer: iPhone Mail (18B92)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 18.12.2020 um 13:43 schrieb Pavel Tatashin <pasha.tatashin@soleen.com>:=

>=20
> =EF=BB=BFOn Fri, Dec 18, 2020 at 5:46 AM Michal Hocko <mhocko@suse.com> wr=
ote:
>>=20
>> On Thu 17-12-20 13:52:41, Pavel Tatashin wrote:
>> [...]
>>> +#define PINNABLE_MIGRATE_MAX 10
>>> +#define PINNABLE_ISOLATE_MAX 100
>>=20
>> Why would we need to limit the isolation retries. Those should always be
>> temporary failure unless I am missing something.
>=20
> Actually, during development, I was retrying isolate errors
> infinitely, but during testing found a hung where when FOLL_TOUCH
> without FOLL_WRITE is passed (fault in kernel without write flag), the
> zero page is faulted. The isolation of the zero page was failing every
> time, therefore the process was hanging.
>=20
> Since then, I fixed this problem by adding FOLL_WRITE unconditionally
> to FOLL_LONGTERM, but I was worried about other possible bugs that
> would cause hangs, so decided to limit isolation errors. If you think
> it its not necessary, I can unlimit isolate retires.
>=20
>> I am not sure about the
>> PINNABLE_MIGRATE_MAX either. Why do we want to limit that? migrate_pages
>> already implements its retry logic why do you want to count retries on
>> top of that? I do agree that the existing logic is suboptimal because
>=20
> True, but again, just recently, I worked on a race bug where pages can
> end up in per-cpu list after lru_add_drain_all() but before isolation,
> so I think retry is necessary.
>=20
>> the migration failure might be ephemeral or permanent but that should be
>> IMHO addressed at migrate_pages (resp. unmap_and_move) and simply report
>> failures that are permanent - e.g. any potential pre-existing long term
>> pin - if that is possible at all. If not what would cause permanent
>> migration failure? OOM?
>=20
> Yes, OOM is the main cause for migration failures. And also a few
> cases described in movable zone comment, where it is possible during
> boot some pages can be allocated by memblock in movable zone due to
> lack of memory resources (even if those resources were added later),
> hardware page poisoning is another rare example.
>=20

How is concurrent migration handled? Like memory offlining, compaction, allo=
c_contig_range() while trying to pin?


>> --
>> Michal Hocko
>> SUSE Labs
>=20

