Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C09DC4361B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 22:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D99223EF3
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 22:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731564AbgLKVa4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 16:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22212 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405978AbgLKVaj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 16:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607722152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9Rl5EtIOs03CVOerY2+wVTiaDIkcXc+bBp/8wnzmHJM=;
        b=IycrZ4/EYEc7YY66bAlajurt3dR6GhiO5Z61TV9F7gY+2f7Atl1Y1QN0rmB+24OJ4ymlhE
        FLk+ka3D6Z294+XMj5V7inKPiQjVzlDDIu5Ym750j7mdg+RsbpVuHjcRN5NVDb5r6aBKZ6
        +JUzKJoAwgZwnSFCnpmQTK0jzDAmJLY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-FHhRXSqjPpOIuINMyBbfXg-1; Fri, 11 Dec 2020 16:29:11 -0500
X-MC-Unique: FHhRXSqjPpOIuINMyBbfXg-1
Received: by mail-wr1-f72.google.com with SMTP id j5so3803483wro.12
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 13:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=9Rl5EtIOs03CVOerY2+wVTiaDIkcXc+bBp/8wnzmHJM=;
        b=qx3Karm0kuYLuHSYZPccB4JrDXTNv/B4tWnpKla0/qtt1G9A8BV7Ncssa4QORMTkb8
         DpuBlsa/3bIuiIFLT5nq+J6BEn+r/6Hz20LrQ5uOGli9WG5bvq03In8sFKJbzQS/mRGt
         CxcKp0h0Qhw6KwAhs/SLKo2ki6pkykADrQVUJTvJ+g2Nhkfu6TvTTqEADOozHEIwtVxX
         WDjJxsf/w0Q0pjMXS9BEfH2iaFRoEBslGPgz/cQVeiPIX1YN3Kjn1wlp5VlJWVJclhpb
         /D7FmPxb1SnuviS4POf0f1AoWLexhAAya6mtRUzTI4S/xhxZnpzED95Z/277cbc+FHbM
         gLbg==
X-Gm-Message-State: AOAM532jHMTzBL9tTcTKF9wZNHc4jCfa6y2J9LnzRChSHWyxfd6mD3zc
        Oli4Chg9KRoex7uTqHKd56fNc5b+RwpNOCZWlaiAn7LXbd4gLdDAHacAs5ALoJjORyT2hPL/xwF
        dO8puPQ9I/J7dKBTjtZ3V
X-Received: by 2002:adf:9cca:: with SMTP id h10mr8782021wre.77.1607722149909;
        Fri, 11 Dec 2020 13:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxML2UPeLq19wEtUIxrniwOw/YoaYTaWXyKEajEcsSnhW1AWwjmA+tfkw1FaXOISFtnfmZ+hQ==
X-Received: by 2002:adf:9cca:: with SMTP id h10mr8781992wre.77.1607722149677;
        Fri, 11 Dec 2020 13:29:09 -0800 (PST)
Received: from [192.168.3.114] (p4ff23c7c.dip0.t-ipconnect.de. [79.242.60.124])
        by smtp.gmail.com with ESMTPSA id n189sm15862735wmf.20.2020.12.11.13.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 13:29:09 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
Date:   Fri, 11 Dec 2020 22:29:08 +0100
Message-Id: <10F682D5-0654-4C42-9989-F999D4434295@redhat.com>
References: <CA+CK2bC6u4wnHX53ZhfPtQBLTDbD3t4V9Zuhj=HwD3gEyL4Puw@mail.gmail.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
In-Reply-To: <CA+CK2bC6u4wnHX53ZhfPtQBLTDbD3t4V9Zuhj=HwD3gEyL4Puw@mail.gmail.com>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
X-Mailer: iPhone Mail (18B92)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 11.12.2020 um 22:09 schrieb Pavel Tatashin <pasha.tatashin@soleen.com>:=

>=20
> =EF=BB=BFOn Fri, Dec 11, 2020 at 3:46 PM Jason Gunthorpe <jgg@ziepe.ca> wr=
ote:
>>=20
>>> On Fri, Dec 11, 2020 at 03:40:57PM -0500, Pavel Tatashin wrote:
>>> On Fri, Dec 11, 2020 at 3:23 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>>=20
>>>> On Fri, Dec 11, 2020 at 03:21:39PM -0500, Pavel Tatashin wrote:
>>>>> @@ -1593,7 +1592,7 @@ static long check_and_migrate_cma_pages(struct m=
m_struct *mm,
>>>>>                              }
>>>>>=20
>>>>>                              if (!isolate_lru_page(head)) {
>>>>> -                                     list_add_tail(&head->lru, &cma_p=
age_list);
>>>>> +                                     list_add_tail(&head->lru, &movab=
le_page_list);
>>>>>                                      mod_node_page_state(page_pgdat(he=
ad),
>>>>>                                                          NR_ISOLATED_A=
NON +
>>>>>                                                          page_is_file_=
lru(head),
>>>>> @@ -1605,7 +1604,7 @@ static long check_and_migrate_cma_pages(struct m=
m_struct *mm,
>>>>>              i +=3D step;
>>>>>      }
>>>>>=20
>>>>> -     if (!list_empty(&cma_page_list)) {
>>>>> +     if (!list_empty(&movable_page_list)) {
>>>>=20
>>>> You didn't answer my earlier question, is it OK that ZONE_MOVABLE
>>>> pages leak out here if ioslate_lru_page() fails but the
>>>> moval_page_list is empty?
>>>>=20
>>>> I think the answer is no, right?
>>> In my opinion it is OK. We are doing our best to not pin movable
>>> pages, but if isolate_lru_page() fails because pages are currently
>>> locked by someone else, we will end up long-term pinning them.
>>> See comment in this patch:
>>> +        * 1. Pinned pages: (long-term) pinning of movable pages is avoi=
ded
>>> +        *    when pages are pinned and faulted, but it is still possibl=
e that
>>> +        *    address space already has pages in ZONE_MOVABLE at the tim=
e when
>>> +        *    pages are pinned (i.e. user has touches that memory before=

>>> +        *    pinning). In such case we try to migrate them to a differe=
nt zone,
>>> +        *    but if migration fails the pages can still end-up pinned i=
n
>>> +        *    ZONE_MOVABLE. In such case, memory offlining might retry a=
 long
>>> +        *    time and will only succeed once user application unpins pa=
ges.
>>=20
>> It is not "retry a long time" it is "might never complete" because
>> userspace will hold the DMA pin indefinitely.
>>=20
>> Confused what the point of all this is then ??
>>=20
>> I thought to goal here is to make memory unplug reliable, if you leave
>> a hole like this then any hostile userspace can block it forever.
>=20
> You are right, I used a wording from the previous comment, and it
> should be made clear that pin may be forever. Without these patches it
> is guaranteed that hot-remove will fail if there are pinned pages as
> ZONE_MOVABLE is actually the first to be searched. Now, it will fail
> only due to exceptions listed in ZONE_MOVABLE comment:
>=20
> 1. pin + migration/isolation failure

Not sure what that really means. We have short-term pinnings (although we mi=
ght have a better term for =E2=80=9Epinning=E2=80=9C here) for example, when=
 a process dies (IIRC). There is a period where pages cannot get migrated an=
d offlining code has to retry (which might take a while). This still applies=
 after your change - are you referring to that?

> 2. memblock allocation due to limited amount of space for kernelcore
> 3. memory holes
> 4. hwpoison
> 5. Unmovable PG_offline pages (? need to study why this is a scenario).

Virtio-mem is the primary user in this context.

> Do you think we should unconditionally unpin pages, and return error
> when isolation/migration fails?

I=E2=80=98m not sure what you mean here. Who=E2=80=99s supposed to unpin whi=
ch pages?

>=20
> Pasha
>=20
>>=20
>> Jason
>=20

