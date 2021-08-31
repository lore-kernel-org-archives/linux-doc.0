Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB72C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 23:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D650260F92
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 23:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbhHaXYB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 19:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235699AbhHaXYA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 19:24:00 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967B1C061575
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 16:23:04 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p38so2550318lfa.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 16:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qTGMUJ1fnMBo+Q1kt2wvOXORnThBqbNZ7LIT9ecQXE4=;
        b=mER5XiOy8koaS6tZs5Ukk1lV155l26r6AQblG/hlIf0ZFf/+gW0mM16KEMts/pyGmA
         ilRwF+Z4fobIIzSuTSpXu33eLW6jkFJniOlhjt2hbdwlxgPpimuujwWKFM2TS+HEUVN9
         LhNOezSMIVpxmqtKpJPIN904HC5vZoWULfSRKYezTueepxfIzQhdkCISGTJ1RQN+UC15
         pTtKleTC00QRxfN+DoT5bvHjGkFoaujebReNJhvEk4cSVSMMZ+anYLaUeYFwYqSfASXh
         gCVnsEMoFaU0R5rHnxOsfbyk36zn7uexsEeE6kiidqNVD3f9w+tJXYVLRdTrKFzKCqmQ
         aoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qTGMUJ1fnMBo+Q1kt2wvOXORnThBqbNZ7LIT9ecQXE4=;
        b=UKC6svBoykm/JyPeO8zdMqos5Jv8HiRH5EuOr/8zruvTFG/BXjI7aCXOiv9QngmHYm
         fRzWkmNyvwBeQYyDCQCHTVd9IDxeKfplgGMSR0/uEQxx7wKH5DT8zhQTXweOBj3wGyb2
         DuMFUCpbtYu1H74pTRez2WYW5TsImXaL/yDBQUnNu0Tli5Hof4WM4bdAprQZVjiTGca0
         Jb7AdnUbh2d55eiCszVB1XhF7dMT2l5THycLvgEtCXNYVbzk4/JfgCcoEWD0HgWRIcdH
         gwu9LWes3+xfgavFj6M+AoDlRJ+93bk+FE9n5Ol+SLI2vS2LTlDkhap1RPCf+5OebLVB
         ANrw==
X-Gm-Message-State: AOAM532biMFRiYuwPFzi6kJnaJEuC+veS9QEABBD76A4byRo5tFCY03t
        TfaFU1Qnu9ZumeA+C369mXHGwQ==
X-Google-Smtp-Source: ABdhPJycZ4wjWM84EJAwhegxR/lYKX5fd5MCyesH6ustBkwr//aIlTUP29jnFMcZJ7aYxNztQGRJIQ==
X-Received: by 2002:a05:6512:e99:: with SMTP id bi25mr22941004lfb.486.1630452182771;
        Tue, 31 Aug 2021 16:23:02 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id k3sm2263434lja.109.2021.08.31.16.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:23:01 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id B7BC9102EFE; Wed,  1 Sep 2021 02:23:01 +0300 (+03)
Date:   Wed, 1 Sep 2021 02:23:01 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, vbabka@suse.cz, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com
Subject: Re: [PATCH v2 1/2] mm: introduce pmd_install() helper
Message-ID: <20210831232301.ilehcpc3n5bqodsz@box.shutemov.name>
References: <20210831132111.85437-1-zhengqi.arch@bytedance.com>
 <20210831132111.85437-2-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831132111.85437-2-zhengqi.arch@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 31, 2021 at 09:21:10PM +0800, Qi Zheng wrote:
> Currently we have three times the same few lines repeated in the
> code. Deduplicate them by newly introduced pmd_install() helper.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  include/linux/mm.h |  1 +
>  mm/filemap.c       | 11 ++---------
>  mm/memory.c        | 34 ++++++++++++++++------------------
>  3 files changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a3cc83d64564..0af420a7e382 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2463,6 +2463,7 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
>  	return ptl;
>  }
>  
> +extern void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>  extern void __init pagecache_init(void);
>  extern void __init free_area_init_memoryless_node(int nid);
>  extern void free_initmem(void);

mm/internal.h would be a better fit for the declaration.

Otherwise:

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
