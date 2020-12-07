Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B980CC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 12:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A695233FD
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 12:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgLGMkt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 07:40:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26701 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725803AbgLGMks (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 07:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607344762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dsIj4qKtgiLuXNhhf4paRMoSk/3UQOvuccZqxvDDUB4=;
        b=QJcUIsgg1iflARWxpf4cmJQXxawpihGi/dxvl6U7Ims2dwMCT/RHKFRNv2m1PZEMAC3LIM
        HntQrtEDhBE5DKGtzpRb2cIPSxfHbOhVYzZCephV2RswjBP6sMQhwLsRapIKLLidXxIeaJ
        Q98CiYga6d65tqPANiVO72LIx42A8lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-dLS1WPgSPGaEPOh6VN33dg-1; Mon, 07 Dec 2020 07:39:18 -0500
X-MC-Unique: dLS1WPgSPGaEPOh6VN33dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63BF1803638;
        Mon,  7 Dec 2020 12:39:15 +0000 (UTC)
Received: from [10.36.114.33] (ovpn-114-33.ams2.redhat.com [10.36.114.33])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0513C60BD8;
        Mon,  7 Dec 2020 12:39:09 +0000 (UTC)
Subject: Re: [PATCH v7 05/15] mm/bootmem_info: Introduce
 {free,prepare}_vmemmap_page()
To:     Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
        mike.kravetz@oracle.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-6-songmuchun@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <17abb7bb-de39-7580-b020-faec58032de9@redhat.com>
Date:   Mon, 7 Dec 2020 13:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130151838.11208-6-songmuchun@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30.11.20 16:18, Muchun Song wrote:
> In the later patch, we can use the free_vmemmap_page() to free the
> unused vmemmap pages and initialize a page for vmemmap page using
> via prepare_vmemmap_page().
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  include/linux/bootmem_info.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
> index 4ed6dee1adc9..239e3cc8f86c 100644
> --- a/include/linux/bootmem_info.h
> +++ b/include/linux/bootmem_info.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_BOOTMEM_INFO_H
>  
>  #include <linux/mmzone.h>
> +#include <linux/mm.h>
>  
>  /*
>   * Types for free bootmem stored in page->lru.next. These have to be in
> @@ -22,6 +23,29 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
>  void get_page_bootmem(unsigned long info, struct page *page,
>  		      unsigned long type);
>  void put_page_bootmem(struct page *page);
> +
> +static inline void free_vmemmap_page(struct page *page)
> +{
> +	VM_WARN_ON(!PageReserved(page) || page_ref_count(page) != 2);
> +
> +	/* bootmem page has reserved flag in the reserve_bootmem_region */
> +	if (PageReserved(page)) {
> +		unsigned long magic = (unsigned long)page->freelist;
> +
> +		if (magic == SECTION_INFO || magic == MIX_SECTION_INFO)
> +			put_page_bootmem(page);
> +		else
> +			WARN_ON(1);
> +	}
> +}
> +
> +static inline void prepare_vmemmap_page(struct page *page)
> +{
> +	unsigned long section_nr = pfn_to_section_nr(page_to_pfn(page));
> +
> +	get_page_bootmem(section_nr, page, SECTION_INFO);
> +	mark_page_reserved(page);
> +}

Can you clarify in the description when exactly these functions are
called and on which type of pages?

Would indicating "bootmem" in the function names make it clearer what we
are dealing with?

E.g., any memory allocated via the memblock allocator and not via the
buddy will be makred reserved already in the memmap. It's unclear to me
why we need the mark_page_reserved() here - can you enlighten me? :)

-- 
Thanks,

David / dhildenb

