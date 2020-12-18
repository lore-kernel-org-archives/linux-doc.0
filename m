Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA595C4361B
	for <linux-doc@archiver.kernel.org>; Fri, 18 Dec 2020 15:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DA7023B5D
	for <linux-doc@archiver.kernel.org>; Fri, 18 Dec 2020 15:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgLRPl7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Dec 2020 10:41:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:42154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728275AbgLRPl6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Dec 2020 10:41:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5B8D6ACF1;
        Fri, 18 Dec 2020 15:41:17 +0000 (UTC)
Date:   Fri, 18 Dec 2020 16:41:12 +0100
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
        naoya.horiguchi@nec.com, duanxiongchun@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v10 02/11] mm/hugetlb: Introduce a new config
 HUGETLB_PAGE_FREE_VMEMMAP
Message-ID: <20201218154112.GA3115@localhost.localdomain>
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-3-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217121303.13386-3-songmuchun@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 08:12:54PM +0800, Muchun Song wrote:
> The HUGETLB_PAGE_FREE_VMEMMAP option is used to enable the freeing
> of unnecessary vmemmap associated with HugeTLB pages. The config
> option is introduced early so that supporting code can be written
> to depend on the option. The initial version of the code only
> provides support for x86-64.
> 
> Like other code which frees vmemmap, this config option depends on
> HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
> used to register bootmem info. Therefore, make sure
> register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
> is defined.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Ok, this commit message is much more clear, and the same goes for the
config description.

Reviewed-by: Oscar Salvador <osalvador@suse.de>

-- 
Oscar Salvador
SUSE L3
