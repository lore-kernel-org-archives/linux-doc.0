Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2165C4361B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 13:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 838022339F
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 13:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgLPN3e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:29:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:41142 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726433AbgLPN3d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Dec 2020 08:29:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 670ECAC7B;
        Wed, 16 Dec 2020 13:28:52 +0000 (UTC)
Date:   Wed, 16 Dec 2020 14:28:48 +0100
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
Subject: Re: [PATCH v9 06/11] mm/hugetlb: Set the PageHWPoison to the raw
 error page
Message-ID: <20201216132847.GB29394@linux>
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-7-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201213154534.54826-7-songmuchun@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 13, 2020 at 11:45:29PM +0800, Muchun Song wrote:
> Because we reuse the first tail vmemmap page frame and remap it
> with read-only, we cannot set the PageHWPosion on a tail page.
> So we can use the head[4].private to record the real error page
> index and set the raw error page PageHWPoison later.

Maybe the following is better?

"Since the first page of tail page structs is remapped read-only,
 we cannot modify any tail struct page, and so we cannot set
 the HWPoison flag on a tail page.
 We can make use of head[4].private to record the real hwpoisoned
 page index.
 Right before freeing the page the real raw page will be retrieved
 and marked as HWPoison.
"

I think it is slighly clearer, but whatever.

> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

I do not quite like the name hwpoison_subpage_deliver, but I cannot
come up with a better one myself, so:

Reviewed-by: Oscar Salvador <osalvador@suse.de>

-- 
Oscar Salvador
SUSE L3
