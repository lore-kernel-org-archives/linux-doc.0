Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF5AC433FE
	for <linux-doc@archiver.kernel.org>; Sat, 12 Dec 2020 10:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F09E22D58
	for <linux-doc@archiver.kernel.org>; Sat, 12 Dec 2020 10:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438761AbgLLKib (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Dec 2020 05:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26223 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438742AbgLLKib (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Dec 2020 05:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607769424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GsbWo8MzI5/BHYS/EaqKM/Ulw99yLlb1bIOuQBeR1lk=;
        b=D1Am+EVCzQF2nsMyzfwtTHf/xScL7+IQA6tg3qApDQQN8thTPG/m/MTVPPsmh3YJlD+eRp
        ED3qgflv3x3v8+mMj+lM6jD/gd26Q8IxNkWZho4EJVpCHx6bmDK89/fKlKcwCTTDGmH6/M
        FJ0eZyJYtuAmGvp0Oh1CANozgPP+Gio=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-GtJk7c6ENaGp8KHZZRSZYA-1; Sat, 12 Dec 2020 02:29:14 -0500
X-MC-Unique: GtJk7c6ENaGp8KHZZRSZYA-1
Received: by mail-ed1-f69.google.com with SMTP id h5so5111266edq.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 23:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=GsbWo8MzI5/BHYS/EaqKM/Ulw99yLlb1bIOuQBeR1lk=;
        b=clW0TkR2Wb/Hm+noPjemPYC5Qx1zPcnvyH4EqyzThpEwHawy5AzE/eLRacTN9ADNJi
         kvNtStW5jZMHGZAj8tez1t8C/c0CTN7TZteh3Kg4ViYdGK9AASw4S2+TJwgw18YXo4vJ
         2L4rDfc9HLAGV2Kg0fejt9U0+5uhw/SBe4v7AwFNhHDTTIKaZPrn2trODv/7UMGAf0a7
         tb5INuXTD2mVkioLMRxyMWjIxuPJWlLg8vAfNMwRgr8neDdU58LuB3QnT0VYpp4OaTEA
         eHFK+GmrUDFnPe4jY2f8wKiK4Dzq3AtRK5EhU4a1RnDOTG6nJf27k0xuZl/DBALAQU2L
         j8lQ==
X-Gm-Message-State: AOAM5317DXneKWU4alG1c44qDFdDdYk1V1DLBVvMuMdGrEko8WAV2RtC
        YDgKKy+GCcLhoRDX1ribNhOfn1AMPfsloZGu56WNZwAzuIT1Z26S0dBdmHO2MQu9apl7aHJkKd1
        Td9a75J1Rk/oJAVk+iFAZ
X-Received: by 2002:a50:e78b:: with SMTP id b11mr15358819edn.165.1607758153439;
        Fri, 11 Dec 2020 23:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRL2Y1wyHXCG127r7zUT1/Oc/JcsKsqWphtjYAyN0whGHFHSKjen6fYKNLk/25u0gYQBpDQA==
X-Received: by 2002:a50:e78b:: with SMTP id b11mr15358792edn.165.1607758153223;
        Fri, 11 Dec 2020 23:29:13 -0800 (PST)
Received: from [192.168.3.114] (p4ff23bda.dip0.t-ipconnect.de. [79.242.59.218])
        by smtp.gmail.com with ESMTPSA id k21sm8459922ejv.80.2020.12.11.23.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 23:29:12 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
Date:   Sat, 12 Dec 2020 08:29:11 +0100
Message-Id: <2D10D596-3159-483C-81B4-CD187806ED46@redhat.com>
References: <20201211235005.GE5487@ziepe.ca>
Cc:     David Hildenbrand <david@redhat.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
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
In-Reply-To: <20201211235005.GE5487@ziepe.ca>
To:     Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: iPhone Mail (18B92)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 12.12.2020 um 00:50 schrieb Jason Gunthorpe <jgg@ziepe.ca>:
>=20
> =EF=BB=BFOn Fri, Dec 11, 2020 at 10:53:00PM +0100, David Hildenbrand wrote=
:
>=20
>>> When check_and_migrate_movable_pages() is called, the pages are
>>> already pinned. If some of those pages are in movable zone, and we
>>> fail to migrate or isolate them what should we do: proceed, and
>>> keep it as exception of when movable zone can actually have pinned
>>> pages or unpin all pages in the array, and return an error, or
>>> unpin only pages in movable zone, and return an error?
>>=20
>> I guess revert what we did (unpin) and return an error. The
>> interesting question is what can make migration/isolation fail
>>=20
>> a) out of memory: smells like a zone setup issue. Failures are acceptable=
 I guess.
>=20
> Out of memory is reasonable..
>=20
>> b) short term pinnings: process dying - not relevant I guess. Other cases=
? (Fork?)
>=20
> Concurrent with non-longterm GUP users are less reasonable, fork is
> not reasonable, etc..

Concurrent alloc_contig_range(), memory offlining, compaction .. where we mi=
grate pages? Any experts on racing page migration in these scenarios?

(Also wondering what would happen if we are just about to swap)

>=20
> Racing with another GUP in another thread is also not reasonable, so
> failing to isolate can't be a failure

Having VMs with multiple vfio containers is certainly realistic, and optimiz=
ing in user space to do vfio mappings concurrently doesn=E2=80=98t sound too=
 crazy to me. But I haven=E2=80=98t checked if vfio common code already hand=
les such concurrency.

>=20
> Jasnon
>=20

