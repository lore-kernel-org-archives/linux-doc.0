Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2F7C433DB
	for <linux-doc@archiver.kernel.org>; Sun, 24 Jan 2021 23:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C330E22BF3
	for <linux-doc@archiver.kernel.org>; Sun, 24 Jan 2021 23:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbhAXX70 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Jan 2021 18:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbhAXX7G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jan 2021 18:59:06 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628B0C061574
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 15:58:25 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id h15so4020826pli.8
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 15:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=sxDwfnXEerJ6Ap/Q1ZpbffkeUM8AptFoTvsd0C6Q/kU=;
        b=qNz69BrUzBkJ8ftoRNmFpuzCXZgxSpIzj8E3ktc0PU3k7PPfxCkWPg54CuQKJG3mLW
         yBVe/9sHtGmRt+ibX9VxGFsFZJQ0hnAPrj3FX2ohv02pmr9OsfKLXvmWnBX+GcG476Un
         1UPg4EAqZvU4+vvm6MVXfTs88aqs4wMpQN0539CIHnoigzLaOaKHhz26lWGFZ7bMRtsX
         IZKEsOhBt15yJGELFBh7t7g9MUwfz4dIXgkX3Tz2BMBPU0JUKn0V1Bk19dfsmaNvffU1
         etAFuuSlj2HbzDutByLZSnyHxJKy0b1O30vgtswm7ngQiXuaptsggRFUfBRlXh573FkA
         Wj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=sxDwfnXEerJ6Ap/Q1ZpbffkeUM8AptFoTvsd0C6Q/kU=;
        b=Y+0Lqen/MGdeOnd+zzASy1sEzQTtIPxxVh+5F4YkKgYraUWLB1OtVX9ljFq4V+TotG
         91d/15YBAkT9DqhjwUeRZ3ei9wfzNifgFKoL2uVhWmFe5i40sOKICaWZsToPXJLaejCo
         ugr6vMvJ9fUZCEXmcSVMUQ94s1ae5EIAnwRLcMEHAj0mI210LVh3ZXHO88MxXZ8ebMYb
         ALFcGnFA+dLIZ4XmK8P+QongEG93JKVhlCcBX+bUyAb+LbtxMGduU344ZPnUd9B3MMCm
         A+D+ZZKWs8Mmxh8y9A/RwKhqnJUcp7gg82F5tjJMIFW23MdzTaHsIJ2OvDte80oIR2U7
         umaQ==
X-Gm-Message-State: AOAM531l5qO8G6sGUULoBDNDWdlOn8pwwgWHcybTeFicYQds/15G4qmB
        Oa+ZGCHHzBYctIAbB0okpEyJ6w==
X-Google-Smtp-Source: ABdhPJy+E/G7UOngkUomksN0tFh5EcMppFPn0aGGQmMUEzvwWpJOcQItJIbh74Unizkx3EpltPrVkg==
X-Received: by 2002:a17:902:443:b029:dc:1aa4:28f0 with SMTP id 61-20020a1709020443b02900dc1aa428f0mr8522387ple.4.1611532704849;
        Sun, 24 Jan 2021 15:58:24 -0800 (PST)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667] ([2620:15c:17:3:4a0f:cfff:fe51:6667])
        by smtp.gmail.com with ESMTPSA id a188sm15617958pfb.108.2021.01.24.15.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 15:58:23 -0800 (PST)
Date:   Sun, 24 Jan 2021 15:58:23 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
To:     Muchun Song <songmuchun@bytedance.com>
cc:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, willy@infradead.org, osalvador@suse.de,
        mhocko@suse.com, song.bao.hua@hisilicon.com, david@redhat.com,
        naoya.horiguchi@nec.com, duanxiongchun@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v13 02/12] mm: hugetlb: introduce a new config
 HUGETLB_PAGE_FREE_VMEMMAP
In-Reply-To: <20210117151053.24600-3-songmuchun@bytedance.com>
Message-ID: <472a58b9-12cb-3c3-d132-13dbae5174f0@google.com>
References: <20210117151053.24600-1-songmuchun@bytedance.com> <20210117151053.24600-3-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 17 Jan 2021, Muchun Song wrote:

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
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/x86/mm/init_64.c |  2 +-
>  fs/Kconfig            | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 0a45f062826e..0435bee2e172 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
>  
>  static void __init register_page_bootmem_info(void)
>  {
> -#ifdef CONFIG_NUMA
> +#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
>  	int i;
>  
>  	for_each_online_node(i)
> diff --git a/fs/Kconfig b/fs/Kconfig
> index 976e8b9033c4..e7c4c2a79311 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -245,6 +245,24 @@ config HUGETLBFS
>  config HUGETLB_PAGE
>  	def_bool HUGETLBFS
>  
> +config HUGETLB_PAGE_FREE_VMEMMAP
> +	def_bool HUGETLB_PAGE

I'm not sure I understand the rationale for providing this help text if 
this is def_bool depending on CONFIG_HUGETLB_PAGE.  Are you intending that 
this is actually configurable and we want to provide guidance to the admin 
on when to disable it (which it currently doesn't)?  If not, why have the 
help text?

> +	depends on X86_64
> +	depends on SPARSEMEM_VMEMMAP
> +	depends on HAVE_BOOTMEM_INFO_NODE
> +	help
> +	  The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
> +	  some vmemmap pages associated with pre-allocated HugeTLB pages.
> +	  For example, on X86_64 6 vmemmap pages of size 4KB each can be
> +	  saved for each 2MB HugeTLB page.  4094 vmemmap pages of size 4KB
> +	  each can be saved for each 1GB HugeTLB page.
> +
> +	  When a HugeTLB page is allocated or freed, the vmemmap array
> +	  representing the range associated with the page will need to be
> +	  remapped.  When a page is allocated, vmemmap pages are freed
> +	  after remapping.  When a page is freed, previously discarded
> +	  vmemmap pages must be allocated before remapping.
> +
>  config MEMFD_CREATE
>  	def_bool TMPFS || HUGETLBFS
>  
