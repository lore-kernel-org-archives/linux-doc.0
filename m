Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB05C432BE
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 07:01:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8031610A7
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 07:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbhHSHCW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Aug 2021 03:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26193 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234803AbhHSHCU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Aug 2021 03:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629356504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xhVHosNfawIyQK5RmFK8SONJExNGksIgOyq5OVKNQ4c=;
        b=UPlQG1n74bsmxhnWSLNekkXAgaPUV460NvpOjzJXtAiOJdDrqneKDKs80AIUbTJ9bzWq9P
        ITtW8C7OA7bU7tOlQKYlxCbN0fqMnFdMRL3DYV9Voy41qivfEgjb8OqB0QHgh8I5ShYaVS
        0Q0IAf6utqBZg4tP8eRur0p116s7JFA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-XrxNs5AWNBCLPzxMj29iYg-1; Thu, 19 Aug 2021 03:01:43 -0400
X-MC-Unique: XrxNs5AWNBCLPzxMj29iYg-1
Received: by mail-wm1-f71.google.com with SMTP id r11-20020a05600c35cb00b002e706077614so1010209wmq.5
        for <linux-doc@vger.kernel.org>; Thu, 19 Aug 2021 00:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xhVHosNfawIyQK5RmFK8SONJExNGksIgOyq5OVKNQ4c=;
        b=ZzCAlAsbCJHXgDo8w2CJrV0gS1/JhZG5EsxrqQF9D2nGGwhhd0jX2NLtJjVE77L8gG
         kPX+eidFzXuHio9TQSzcygkf9nz+AIomijSlsbGYClS1Z7NYoy+1sSVtTkEAQiG2jI7O
         QVzlIPbV1N2jOm0O4Jk9k8XO1gZ/4ZniAacIKgPrcwPXZPNSWRT7dzhkI8JCegp7lxMF
         5e875WdTG/20VJARSBr7QqNd0ph5Rd/uE3RN4/PLjC/cZQ9sD0U1T8uUnUd42Ox0QGXh
         HGdeOObrLtsIuBiHdgu0KPfXctd/Kl0jRiWCY7eata+oEJYB7NX8AsvlqzP13Bi4cYtz
         DfrQ==
X-Gm-Message-State: AOAM530b69jViEVwCqgSgN4/WHITur9UQb2+/rCnu+CtZKbA3XHcMCVQ
        38hJ8vGDbNSgi5KACetMemiq0MZlta1GHFV2L1yuDZpMbd6URy8wb0XW087DWYkocPPyQ0VqaAP
        BrytREPKs9wd8MM53JF63
X-Received: by 2002:adf:979d:: with SMTP id s29mr1814080wrb.264.1629356501860;
        Thu, 19 Aug 2021 00:01:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPgcRMOO9d5aL/kke4yL0+nCtx2qzOwpYP3VaQCsuq/+pt+iZrukIeGZIVhuF0VsLGshS14w==
X-Received: by 2002:adf:979d:: with SMTP id s29mr1814047wrb.264.1629356501621;
        Thu, 19 Aug 2021 00:01:41 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6bd1.dip0.t-ipconnect.de. [91.12.107.209])
        by smtp.gmail.com with ESMTPSA id k13sm1640202wms.33.2021.08.19.00.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 00:01:41 -0700 (PDT)
To:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-7-zhengqi.arch@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 6/9] mm: free user PTE page table pages
Message-ID: <5aa3020c-fcf2-87bd-31fe-e2b5c2aafcf2@redhat.com>
Date:   Thu, 19 Aug 2021 09:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819031858.98043-7-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.08.21 05:18, Qi Zheng wrote:
> Some malloc libraries(e.g. jemalloc or tcmalloc) usually
> allocate the amount of VAs by mmap() and do not unmap
> those VAs. They will use madvise(MADV_DONTNEED) to free
> physical memory if they want. But the page tables do not
> be freed by madvise(), so it can produce many page tables
> when the process touches an enormous virtual address space.
> 
> The following figures are a memory usage snapshot of one
> process which actually happened on our server:
> 
>          VIRT:  55t
>          RES:   590g
>          VmPTE: 110g
> 
> As we can see, the PTE page tables size is 110g, while the
> RES is 590g. In theory, the process only need 1.2g PTE page
> tables to map those physical memory. The reason why PTE page
> tables occupy a lot of memory is that madvise(MADV_DONTNEED)
> only empty the PTE and free physical memory but doesn't free
> the PTE page table pages. So we can free those empty PTE page
> tables to save memory. In the above cases, we can save memory
> about 108g(best case). And the larger the difference between
> the size of VIRT and RES, the more memory we save.
> 
> In this patch series, we add a pte_refcount field to the
> struct page of page table to track how many users of PTE page
> table. Similar to the mechanism of page refcount, the user of
> PTE page table should hold a refcount to it before accessing.
> The PTE page table page will be freed when the last refcount
> is dropped.
> 
> While we access ->pte_refcount of a PTE page table, any of the
> following ensures the pmd entry corresponding to the PTE page
> table stability:
> 
> 	- mmap_lock
> 	- anon_lock
> 	- i_mmap_lock
> 	- parallel threads are excluded by other means which
> 	  can make ->pmd stable(e.g. gup case)
> 
> This patch does not support THP temporarily, it will be
> supported in the next patch.

Can you clarify (and document here) who exactly takes a reference on the 
page table? Do I understand correctly that

a) each !pte_none() entry inside a page table take a reference to the 
page it's containted in.
b) each page table walker temporarily grabs a page table reference
c) The PMD tables the PTE is referenced in (->currently only ever a 
single one) does *not* take a reference.

So if there are no PTE entries left and nobody walks the page tables, 
you can remove it? You should really extend the 
description/documentation to make it clearer how exactly it's supposed 
to work.


It feels kind of strange to not introduce the CONFIG_FREE_USER_PTE 
Kconfig option in this patch. At least it took me a while to identify it 
in the previous patch.

Maybe you should introduce the empty stubs and use them in a separate 
patch, and then have this patch just introduce CONFIG_FREE_USER_PTE 
along with the actual refcounting magic inside the !stub implementation.

-- 
Thanks,

David / dhildenb

