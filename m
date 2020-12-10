Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0158FC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 11:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FE0823AC4
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 11:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgLJLoD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 06:44:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:43984 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbgLJLnv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Dec 2020 06:43:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5C43FAD0E;
        Thu, 10 Dec 2020 11:43:09 +0000 (UTC)
Date:   Thu, 10 Dec 2020 10:18:12 +0100
From:   Oscar Salvador <osalvador@suse.de>
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
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
Subject: Re: [PATCH v8 00/12] Free some vmemmap pages of HugeTLB page
Message-ID: <20201210091812.GA3613@localhost.localdomain>
References: <20201210035526.38938-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210035526.38938-1-songmuchun@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 11:55:14AM +0800, Muchun Song wrote:
> Muchun Song (12):
>   mm/memory_hotplug: Factor out bootmem core functions to bootmem_info.c
>   mm/hugetlb: Introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
>   mm/bootmem_info: Introduce free_bootmem_page helper
>   mm/hugetlb: Free the vmemmap pages associated with each HugeTLB page
>   mm/hugetlb: Defer freeing of HugeTLB pages
>   mm/hugetlb: Allocate the vmemmap pages associated with each HugeTLB
>     page
>   mm/hugetlb: Set the PageHWPoison to the raw error page
>   mm/hugetlb: Flush work when dissolving hugetlb page
>   mm/hugetlb: Add a kernel parameter hugetlb_free_vmemmap
>   mm/hugetlb: Introduce nr_free_vmemmap_pages in the struct hstate
>   mm/hugetlb: Gather discrete indexes of tail page
>   mm/hugetlb: Optimize the code with the help of the compiler

Well, we went from 24 patches down to 12 patches.
Not bad at all :-)

I will have a look later

Thanks


-- 
Oscar Salvador
SUSE L3
