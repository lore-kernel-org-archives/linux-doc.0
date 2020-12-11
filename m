Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2569C4167B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 10:55:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9139D23F5C
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 10:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393495AbgLKKyz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 05:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59551 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393762AbgLKKyY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 05:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607683977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s9EPJ7Qq439cY6gaz05/+mPgjwbl998XBfiZOOYsa7I=;
        b=KFjvNcK6/mPXxpxnmfbapaFgEGD8q3TDj/TC0B4vCSTBVZ9NI25bfHZuTfXXKxy4fkfSEh
        Kl1hj7p3PUhuUD/arcMmDRSbQ7A8WpBxjmtnQ5c9LrVMMUUTMTIK9vIOJPUbYO73jLgwYw
        GnXE87q/Af7/q+MORcuvAFZNaCb93Q8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-42CnbkglOfGoTkf431jg2g-1; Fri, 11 Dec 2020 05:52:56 -0500
X-MC-Unique: 42CnbkglOfGoTkf431jg2g-1
Received: by mail-wm1-f71.google.com with SMTP id k128so3107070wme.7
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 02:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=s9EPJ7Qq439cY6gaz05/+mPgjwbl998XBfiZOOYsa7I=;
        b=nXop0QhLG9AWFKCcq9jE1PTtfzrz2wYrEGJUWB6eI6ykCPkl5FSSrceYeXLwtdlWCS
         4Uvfk6/eblniFu1vtyXuPIG5wFkZqQLmWUCThdcKm+9FGO1vSlq6Pm7+jsXmKQ327XYr
         SH7yawUB6sN4XzOsWoASWIT3L9ictM+Ljb5bW7dtqNIyxlUKdDUGynNb6zL3mRyQnsO1
         HQ8R5nzELDc/hp9FD/9KmAtd6cnpnwnEEjL+eA/L8yEuc9kmn9O48KDEGxDfN2EqMp5n
         3yxeU+Y6z0dZj8QVZzkPGTrOJCzBuCZ+Z78XZqeRX0uT41/S3uRdvdVtjKMC17FzQ5UL
         G7PQ==
X-Gm-Message-State: AOAM533IdbMasmH7rGP7AAxrGVmhYciCd8pmWkc3gJDvZMllI/Wgdw5O
        6rAM8FUxVj+qVdphWF8Lgcpr/CifaqmEMPuSPSesNTUcaf/IsmlW2+Rmz7Ido/atoQrFRvW7ROb
        GgLyAz22AbVWWticZzuYq
X-Received: by 2002:adf:ef06:: with SMTP id e6mr6809742wro.231.1607683974826;
        Fri, 11 Dec 2020 02:52:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFcKb0mOOclCNzhWxkpp/5Sl0tFKIUVIZ6wIxiklr6aH4W3vgHxKbQ3rU80awumj0x9sInUQ==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr6809722wro.231.1607683974584;
        Fri, 11 Dec 2020 02:52:54 -0800 (PST)
Received: from [192.168.3.114] (p4ff23c7c.dip0.t-ipconnect.de. [79.242.60.124])
        by smtp.gmail.com with ESMTPSA id m81sm14926760wmf.29.2020.12.11.02.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 02:52:53 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v8 06/12] mm/hugetlb: Allocate the vmemmap pages associated with each HugeTLB page
Date:   Fri, 11 Dec 2020 11:52:52 +0100
Message-Id: <58B0C89E-DD34-4D59-83A4-5DAAF0D617AE@redhat.com>
References: <20201211093517.GA22210@linux>
Cc:     Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
        mike.kravetz@oracle.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        mhocko@suse.com, song.bao.hua@hisilicon.com, david@redhat.com,
        duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org
In-Reply-To: <20201211093517.GA22210@linux>
To:     Oscar Salvador <osalvador@suse.de>
X-Mailer: iPhone Mail (18B92)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 11.12.2020 um 10:35 schrieb Oscar Salvador <osalvador@suse.de>:
>=20
> =EF=BB=BFOn Thu, Dec 10, 2020 at 11:55:20AM +0800, Muchun Song wrote:
>> When we free a HugeTLB page to the buddy allocator, we should allocate th=
e
>> vmemmap pages associated with it. We can do that in the __free_hugepage()=

> "vmemmap pages that describe the range" would look better to me, but it is=
 ok.
>=20
>> +#define GFP_VMEMMAP_PAGE        \
>> +    (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_HIGH | __GFP_NOWARN)
>>=20
>> #ifndef VMEMMAP_HPAGE_SHIFT
>> #define VMEMMAP_HPAGE_SHIFT        HPAGE_SHIFT
>> @@ -197,6 +200,11 @@
>>    (__boundary - 1 < (end) - 1) ? __boundary : (end);         \
>> })
>>=20
>> +typedef void (*vmemmap_remap_pte_func_t)(struct page *reuse, pte_t *pte,=

>> +                     unsigned long start, unsigned long end,
>> +                     void *priv);
>=20
> Any reason to not have defined GFP_VMEMMAP_PAGE and the new typedef into
> hugetlb_vmemmap.h?
>=20
>=20
>> +static void vmemmap_restore_pte_range(struct page *reuse, pte_t *pte,
>> +                      unsigned long start, unsigned long end,
>> +                      void *priv)
>> +{
>> +    pgprot_t pgprot =3D PAGE_KERNEL;
>> +    void *from =3D page_to_virt(reuse);
>> +    unsigned long addr;
>> +    struct list_head *pages =3D priv;
> [...]
>> +
>> +        /*
>> +         * Make sure that any data that writes to the @to is made
>> +         * visible to the physical page.
>> +         */
>> +        flush_kernel_vmap_range(to, PAGE_SIZE);
>=20
> Correct me if I am wrong, but flush_kernel_vmap_range is a NOOP under arch=
es which
> do not have ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE.
> Since we only enable support for x86_64, and x86_64 is one of those arches=
,
> could we remove this, and introduced later on in case we enable this featu=
re
> on an arch that needs it?
>=20
> I am not sure if you need to flush the range somehow, as you did in
> vmemmap_remap_range.
>=20
>> +retry:
>> +        page =3D alloc_page(GFP_VMEMMAP_PAGE);
>> +        if (unlikely(!page)) {
>> +            msleep(100);
>> +            /*
>> +             * We should retry infinitely, because we cannot
>> +             * handle allocation failures. Once we allocate
>> +             * vmemmap pages successfully, then we can free
>> +             * a HugeTLB page.
>> +             */
>> +            goto retry;
>=20
> I think this is the trickiest part.
> With 2MB HugeTLB pages we only need 6 pages, but with 1GB, the number of p=
ages
> we need to allocate increases significantly (4088 pages IIRC).
> And you are using __GFP_HIGH, which will allow us to use more memory (by
> cutting down the watermark), but it might lead to putting the system
> on its knees wrt. memory.
> And yes, I know that once we allocate the 4088 pages, 1GB gets freed, but
> still.

Similar to memory hotplug, no? I don=E2=80=98t think this is really an issue=
 that cannot be mitigated. Yeah, we might want to tweak allocation flags.

>=20
> I would like to hear Michal's thoughts on this one, but I wonder if it mak=
es
> sense to not let 1GB-HugeTLB pages be freed.
>=20
> --=20
> Oscar Salvador
> SUSE L3
>=20

