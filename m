Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03CFC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 13:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FC3261246
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 13:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhKJN2n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 08:28:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40973 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231290AbhKJN2n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 08:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636550755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jP0yAKaqi1adm8H9orP2dppOC1y2MfJUJ8VPAeRgaww=;
        b=VN8e+Ul1wH8bUFbZ61lUmEGzm4mWhZjPLBKrLnhSN0+CXED/p2aL0ZkS0JEclLsUU8Sot0
        Ki+LiVidm8fMudgJjkGvXlDPHz5/0Ci/L37HpXC1s3ucr5HUEJnImJC+/EwHjHDdlAsTfm
        BdfYVA0KOJ2kbtY1dODsSFYpPT6qrFw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-JMUB2LDdMcyAMZTVo2nl5w-1; Wed, 10 Nov 2021 08:25:54 -0500
X-MC-Unique: JMUB2LDdMcyAMZTVo2nl5w-1
Received: by mail-wm1-f71.google.com with SMTP id 201-20020a1c04d2000000b003335bf8075fso245300wme.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 05:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=jP0yAKaqi1adm8H9orP2dppOC1y2MfJUJ8VPAeRgaww=;
        b=lMxuC13K/GmzcNgxKNVc/eGZ4ktGIAt8tjlEKdv3A8Q3qHs3Tb7eCfuBZNmc4WlxTx
         Q33s6WxVA17U0aNGbq29zN8V5sxH4QL3M0QOrJ/uCuv8C2sK3vThP24w1JeK6naPS7CK
         RraScfGFBTaEdTF8E8b+2Vw2BEryBk6maIsP6zly12CiqJgz7gf7X0vBDUbUi4IfCFT1
         MS47iF4uoXAECL4EFVlg4YljhxTX7s9J87F7GeOQUOcytBT4/mQd5k+1yLIMYy2xpP3R
         0t2EKksmFfC2TOx0tNyJu0zA5PVcSQtnsNAMdPZLnVqZbGl0wD1UtVKFUA1UCzPMLldl
         Ll0A==
X-Gm-Message-State: AOAM532F40H6jeJ5FZzkLnmpTIkgrtxAKHh8DF4dvH2B9HxFjquch67I
        jx0NNyLpWBsdSIhKlpXwyZ0vZbTf3Y48NBWtayCUNTXPLKh2k93zXffagLKWRzAE8cp05rrg+CZ
        IzFIQwnUjZWv5iuAnirSn
X-Received: by 2002:adf:f209:: with SMTP id p9mr19347916wro.191.1636550753110;
        Wed, 10 Nov 2021 05:25:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJSv+R+IWbpj+s2V4l4f0j/FjSMvgil2sH56ptcxuoK6bsMwBY0CkRGweCqJAhm+KUOnovqA==
X-Received: by 2002:adf:f209:: with SMTP id p9mr19347881wro.191.1636550752878;
        Wed, 10 Nov 2021 05:25:52 -0800 (PST)
Received: from [192.168.3.132] (p5b0c604f.dip0.t-ipconnect.de. [91.12.96.79])
        by smtp.gmail.com with ESMTPSA id i17sm6016557wmq.48.2021.11.10.05.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 05:25:52 -0800 (PST)
Message-ID: <8d0bc258-58ba-52c5-2e0d-a588489f2572@redhat.com>
Date:   Wed, 10 Nov 2021 14:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
 <20211110125601.GQ1740502@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 00/15] Free user PTE page table pages
In-Reply-To: <20211110125601.GQ1740502@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.11.21 13:56, Jason Gunthorpe wrote:
> On Wed, Nov 10, 2021 at 06:54:13PM +0800, Qi Zheng wrote:
> 
>> In this patch series, we add a pte_refcount field to the struct page of page
>> table to track how many users of PTE page table. Similar to the mechanism of
>> page refcount, the user of PTE page table should hold a refcount to it before
>> accessing. The PTE page table page will be freed when the last refcount is
>> dropped.
> 
> So, this approach basically adds two atomics on every PTE map
> 
> If I have it right the reason that zap cannot clean the PTEs today is
> because zap cannot obtain the mmap lock due to a lock ordering issue
> with the inode lock vs mmap lock.

There are different ways to zap: madvise(DONTNEED) vs
fallocate(PUNCH_HOLE). It depends on "from where" we're actually
comming: a process page table walker or the rmap.

The way locking currently works doesn't allow to remove a page table
just by holding the mmap lock, not even in write mode. You'll also need
to hold the respective rmap locks -- which implies that reclaiming apge
tables crossing VMAs is "problematic". Take a look at khugepaged which
has to play quite some tricks to remove a page table.

And there are other ways we can create empty page tables via the rmap,
like reclaim/writeback, although they are rather a secondary concern mostly.

> 
> If it could obtain the mmap lock then it could do the zap using the
> write side as unmapping a vma does.
> 
> Rather than adding a new "lock" to ever PTE I wonder if it would be
> more efficient to break up the mmap lock and introduce a specific
> rwsem for the page table itself, in addition to the PTL. Currently the
> mmap lock is protecting both the vma list and the page table.

There is the rmap side of things as well. At least the rmap won't
reclaim alloc/free page tables, but it will walk page tables while
holding the respective rmap lock.

> 
> I think that would allow the lock ordering issue to be resolved and
> zap could obtain a page table rwsem.
> 
> Compared to two atomics per PTE this would just be two atomic per
> page table walk operation, it is conceptually a lot simpler, and would
> allow freeing all the page table levels, not just PTEs.

Another alternative is to not do it in the kernel automatically, but
instead have a madvise(MADV_CLEANUP_PGTABLE) mechanism that will get
called by user space explicitly once it's reasonable. While this will
work for the obvious madvise(DONTNEED) users -- like memory allocators
-- that zap memory, it's a bit more complicated once shared memory is
involved and we're fallocate(PUNCH_HOLE) memory. But it would at least
work for many use cases that want to optimize memory consumption for
sparse memory mappings.

Note that PTEs are the biggest memory consumer. On x86-64, a 1 TiB area
will consume 2 GiB of PTE tables and only 4 MiB of PMD tables. So PTEs
are most certainly the most important part piece.

-- 
Thanks,

David / dhildenb

