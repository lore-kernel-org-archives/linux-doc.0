Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5FAC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 22:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECE0023C83
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 22:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390810AbgLKVy4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 16:54:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24790 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392935AbgLKVyc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 16:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607723585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ofz0LLzLgTKfndVa7Y4jwNU81NgrxPa3g7jb7sTuuQ=;
        b=Dpio/tDjuoOL1vX7rME93SogWBth3GWcxaTKYXmkMN8noQSaNUOK6Im8Q51mIaNlud2/Z5
        KSQxkYbwjgNw5poB60UroYC9x0F+gI2OrjrB9PpergdqjT/L4Z6KcsSG3/kD8DzafWzqUs
        b3OIGAbvfu5INYvG2C3d/lt062xf33s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-MQBaFzjVONqVNVAO9zPwBw-1; Fri, 11 Dec 2020 16:53:03 -0500
X-MC-Unique: MQBaFzjVONqVNVAO9zPwBw-1
Received: by mail-wm1-f69.google.com with SMTP id k128so3793302wme.7
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 13:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=2ofz0LLzLgTKfndVa7Y4jwNU81NgrxPa3g7jb7sTuuQ=;
        b=ubCUkvF7PY3rXZk9/qD8U7F3AZ/SQ5+BPuUrshCaplzFoWsNmV8pM6QJcgjzI14wM4
         S5cYORI0no6hJPjCpq1bn+rh3nUKAcrsdv0NHAoXmrJQaJ/bK+v5INt3UEXwScggzfzv
         FsWLftwqeX8t0oAOWozPYfnIpcD3pyRPXr56FO381j+z0p16jP9XjiAWbcfrGmWf9Mhh
         oAQpgSt72wwS02yWdN+FJgKrgGHCQstpV1Z2oZvdR6Nd6OpnpYyPzxzte4/2BOWOMKav
         nIQALw6zTIXI8bWazpZXHLxYgkmmrrSC9vyFJnMxsSO859Q9RZTwJ9qHwy07fJoKhOo9
         ivng==
X-Gm-Message-State: AOAM531mIpKVVdWjywJuFzBZuhW/E0GFGTpUz3H4lldqSutsgdB7So5u
        vi/Do5/N/9MJpHA0T7+qcD1CBu0bnhthKAJ2hRAaqM+j5+eJE8DNHUnVmhnbRWHYv0je4G9E3D2
        RdTYW1ck2+nlu0HOT9XMc
X-Received: by 2002:a1c:4156:: with SMTP id o83mr15520306wma.178.1607723582220;
        Fri, 11 Dec 2020 13:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuOyDw9r2Sh8TcUavdvb04N1iVX5oCiTO3s1ta5lfNv7sHb8KHPcSneccODYjUawYaEkanZQ==
X-Received: by 2002:a1c:4156:: with SMTP id o83mr15520295wma.178.1607723582002;
        Fri, 11 Dec 2020 13:53:02 -0800 (PST)
Received: from [192.168.3.114] (p4ff23c7c.dip0.t-ipconnect.de. [79.242.60.124])
        by smtp.gmail.com with ESMTPSA id z3sm17572565wrn.59.2020.12.11.13.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 13:53:01 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
Date:   Fri, 11 Dec 2020 22:53:00 +0100
Message-Id: <447A41F3-EB94-4DA4-8B98-038B127774A5@redhat.com>
References: <CA+CK2bCc9gk3Yy+ueaZVJs90MFE3fqukLsdb5R2kTUH4tWRbkA@mail.gmail.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
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
In-Reply-To: <CA+CK2bCc9gk3Yy+ueaZVJs90MFE3fqukLsdb5R2kTUH4tWRbkA@mail.gmail.com>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
X-Mailer: iPhone Mail (18B92)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 11.12.2020 um 22:36 schrieb Pavel Tatashin <pasha.tatashin@soleen.com>:=

>=20
> =EF=BB=BFOn Fri, Dec 11, 2020 at 4:29 PM David Hildenbrand <david@redhat.c=
om> wrote:
>>=20
>>=20
>>>> Am 11.12.2020 um 22:09 schrieb Pavel Tatashin <pasha.tatashin@soleen.co=
m>:
>>>=20
>>> =EF=BB=BFOn Fri, Dec 11, 2020 at 3:46 PM Jason Gunthorpe <jgg@ziepe.ca> w=
rote:
>>>>=20
>>>>> On Fri, Dec 11, 2020 at 03:40:57PM -0500, Pavel Tatashin wrote:
>>>>> On Fri, Dec 11, 2020 at 3:23 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>>>>=20
>>>>>> On Fri, Dec 11, 2020 at 03:21:39PM -0500, Pavel Tatashin wrote:
>>>>>>> @@ -1593,7 +1592,7 @@ static long check_and_migrate_cma_pages(struct=
 mm_struct *mm,
>>>>>>>                             }
>>>>>>>=20
>>>>>>>                             if (!isolate_lru_page(head)) {
>>>>>>> -                                     list_add_tail(&head->lru, &cma=
_page_list);
>>>>>>> +                                     list_add_tail(&head->lru, &mov=
able_page_list);
>>>>>>>                                     mod_node_page_state(page_pgdat(h=
ead),
>>>>>>>                                                         NR_ISOLATED_=
ANON +
>>>>>>>                                                         page_is_file=
_lru(head),
>>>>>>> @@ -1605,7 +1604,7 @@ static long check_and_migrate_cma_pages(struct=
 mm_struct *mm,
>>>>>>>             i +=3D step;
>>>>>>>     }
>>>>>>>=20
>>>>>>> -     if (!list_empty(&cma_page_list)) {
>>>>>>> +     if (!list_empty(&movable_page_list)) {
>>>>>>=20
>>>>>> You didn't answer my earlier question, is it OK that ZONE_MOVABLE
>>>>>> pages leak out here if ioslate_lru_page() fails but the
>>>>>> moval_page_list is empty?
>>>>>>=20
>>>>>> I think the answer is no, right?
>>>>> In my opinion it is OK. We are doing our best to not pin movable
>>>>> pages, but if isolate_lru_page() fails because pages are currently
>>>>> locked by someone else, we will end up long-term pinning them.
>>>>> See comment in this patch:
>>>>> +        * 1. Pinned pages: (long-term) pinning of movable pages is av=
oided
>>>>> +        *    when pages are pinned and faulted, but it is still possi=
ble that
>>>>> +        *    address space already has pages in ZONE_MOVABLE at the t=
ime when
>>>>> +        *    pages are pinned (i.e. user has touches that memory befo=
re
>>>>> +        *    pinning). In such case we try to migrate them to a diffe=
rent zone,
>>>>> +        *    but if migration fails the pages can still end-up pinned=
 in
>>>>> +        *    ZONE_MOVABLE. In such case, memory offlining might retry=
 a long
>>>>> +        *    time and will only succeed once user application unpins p=
ages.
>>>>=20
>>>> It is not "retry a long time" it is "might never complete" because
>>>> userspace will hold the DMA pin indefinitely.
>>>>=20
>>>> Confused what the point of all this is then ??
>>>>=20
>>>> I thought to goal here is to make memory unplug reliable, if you leave
>>>> a hole like this then any hostile userspace can block it forever.
>>>=20
>>> You are right, I used a wording from the previous comment, and it
>>> should be made clear that pin may be forever. Without these patches it
>>> is guaranteed that hot-remove will fail if there are pinned pages as
>>> ZONE_MOVABLE is actually the first to be searched. Now, it will fail
>>> only due to exceptions listed in ZONE_MOVABLE comment:
>>>=20
>>> 1. pin + migration/isolation failure
>>=20
>> Not sure what that really means. We have short-term pinnings (although we=
 might have a better term for =E2=80=9Epinning=E2=80=9C here) for example, w=
hen a process dies (IIRC). There is a period where pages cannot get migrated=
 and offlining code has to retry (which might take a while). This still appl=
ies after your change - are you referring to that?
>>=20
>>> 2. memblock allocation due to limited amount of space for kernelcore
>>> 3. memory holes
>>> 4. hwpoison
>>> 5. Unmovable PG_offline pages (? need to study why this is a scenario).
>>=20
>> Virtio-mem is the primary user in this context.
>>=20
>>> Do you think we should unconditionally unpin pages, and return error
>>> when isolation/migration fails?
>>=20
>> I=E2=80=98m not sure what you mean here. Who=E2=80=99s supposed to unpin w=
hich pages?
>=20
> Hi David,
>=20
> When check_and_migrate_movable_pages() is called, the pages are
> already pinned. If some of those pages are in movable zone, and we
> fail to migrate or isolate them what should we do: proceed, and keep
> it as exception of when movable zone can actually have pinned pages or
> unpin all pages in the array, and return an error, or unpin only pages
> in movable zone, and return an error?
>=20

I guess revert what we did (unpin) and return an error. The interesting ques=
tion is what can make migration/isolation fail

a) out of memory: smells like a zone setup issue. Failures are acceptable I g=
uess.

b) short term pinnings: process dying - not relevant I guess. Other cases? (=
Fork?)

c) ?

Once we clarified that, we actually know how likely it will be to return an e=
rror (and making vfio pinnings fail etc).

> Pasha

