Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47E1C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 08:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8648522C9C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 08:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgLUIRm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 03:17:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:50966 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgLUIRm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Dec 2020 03:17:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AB7C0ACF5;
        Mon, 21 Dec 2020 08:16:59 +0000 (UTC)
Date:   Mon, 21 Dec 2020 09:16:54 +0100
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
Subject: Re: [PATCH v10 09/11] mm/hugetlb: Introduce nr_free_vmemmap_pages in
 the struct hstate
Message-ID: <20201221080414.GA14343@linux>
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-10-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217121303.13386-10-songmuchun@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 08:13:01PM +0800, Muchun Song wrote:
> @@ -182,6 +184,12 @@ bool hugetlb_free_vmemmap_enabled;
>  
>  static int __init early_hugetlb_free_vmemmap_param(char *buf)
>  {
> +	/* We cannot optimize if a "struct page" crosses page boundaries. */
> +	if ((!is_power_of_2(sizeof(struct page)))) {
> +		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
> +		return 0;
> +	}

Unless there is a strong reason behind, I would move this to the previous patch,
where early_hugetlb_free_vmemmap_param is introduced.

-- 
Oscar Salvador
SUSE L3
