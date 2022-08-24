Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C363C32793
	for <linux-doc@archiver.kernel.org>; Wed, 24 Aug 2022 08:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbiHXIKo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235612AbiHXIKn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 04:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849EB857C8
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661328641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FkqRyVmVnH2p/hv4jFAhKRZhXQQdh+BaDqLkaLzGuMI=;
        b=VIMDWym97Amc5j9oWyLt0sVrTpOLLja5ePZzFfYgFs7MPiiMsg2/0qMXywt9SQNN27u+hr
        8NR7FtotBwTIfu8CP1nEjwETCMfyuyaq7mbvc3C1K6//zDBdHy8S7TTRIpBtD2UghlTNyx
        CwcfRHVExovsPs4tifB2jUFY522pRFw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-muiIhYILPFOxCtwcEZsOhg-1; Wed, 24 Aug 2022 04:10:40 -0400
X-MC-Unique: muiIhYILPFOxCtwcEZsOhg-1
Received: by mail-wm1-f71.google.com with SMTP id f7-20020a1c6a07000000b003a60ede816cso237775wmc.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 01:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=FkqRyVmVnH2p/hv4jFAhKRZhXQQdh+BaDqLkaLzGuMI=;
        b=hVEG5MZtezgnekyjBcAQvCeUQ2XQqkLRI6veQLfb6ttM5Vtmbu4vy2n3qupa+Qvv5L
         ix4yRHZcyWdqsa2vSLVDk1kRX6tOM/60GVWLOlqjvWjvsq1584J9zLWs8DjiZ+gi1FCK
         S1RV8qmH44ZyZq4u1LTqbvoFcacFXrmmdrw/2TtbQDb4teQQvMOs1BInZRdGKs2k4DCC
         Mw9NcBvQGp38tNnpw6B1wRX4ZkfB5ddQD6HBJf0XvU7gyRxS8vGuY8avBJ5Xhav2EqL8
         BEPgkynmd/qs+8ifSPvQEnRK5etokGCfkzzAJ/WGmAVlSjCVoqiS+WX64JpIaQejX4NN
         ytVQ==
X-Gm-Message-State: ACgBeo0cbcPT7KtxgidST9oYXaTWbx2Hk5YTOTCFQQT7kMdetq4Kcv5E
        x1+hS/1+Zdi8T5ufZQmKbBSUAEDvUFRTBF4oRE1IyO/JjOeNr4ZJfZMVxEBxseseE2KEXc1e9rh
        TXx11Q6xZC/iY9o8CJqBJ
X-Received: by 2002:a5d:5487:0:b0:225:3fa7:41c2 with SMTP id h7-20020a5d5487000000b002253fa741c2mr11668191wrv.195.1661328639300;
        Wed, 24 Aug 2022 01:10:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7oWpPdTD3abka/IUBi2UFio+jqKRoZcRc1o7eyZSl+PEi58PEdaVPrSmiTzEqsevHnndBcoQ==
X-Received: by 2002:a5d:5487:0:b0:225:3fa7:41c2 with SMTP id h7-20020a5d5487000000b002253fa741c2mr11668178wrv.195.1661328639030;
        Wed, 24 Aug 2022 01:10:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73? (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de. [2003:cb:c707:c500:5445:cf40:2e32:6e73])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe0c9000000b00225206dd595sm16017732wri.86.2022.08.24.01.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:10:38 -0700 (PDT)
Message-ID: <96433a14-1d2c-739d-95fb-3e3339200dcf@redhat.com>
Date:   Wed, 24 Aug 2022 10:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] mm: Cap zone movable's min wmark to small value
Content-Language: en-US
To:     Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org
Cc:     corbet@lwn.net, mcgrof@kernel.org, keescook@chromium.org,
        yzaikin@google.com, songmuchun@bytedance.com,
        mike.kravetz@oracle.com, osalvador@suse.de, rppt@kernel.org,
        surenb@google.com, jsavitz@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20220819093025.105403-1-mawupeng1@huawei.com>
 <20220819093025.105403-2-mawupeng1@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220819093025.105403-2-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.08.22 11:30, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Since min_free_kbytes is based on gfp_zone(GFP_USER) which does not include
> zone movable. However zone movable will get its min share in
> __setup_per_zone_wmarks() which does not make any sense.
> 
> And like highmem pages, __GFP_HIGH and PF_MEMALLOC allocations usually
> don't need movable pages, so there is no need to assign min pages for zone
> movable.
> 
> Let's cap pages_min for zone movable to a small value here just link
> highmem pages.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/page_alloc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e5486d47406e..ff644205370f 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8638,7 +8638,7 @@ static void __setup_per_zone_wmarks(void)
>  
>  	/* Calculate total number of !ZONE_HIGHMEM pages */
>  	for_each_zone(zone) {
> -		if (!is_highmem(zone))
> +		if (!is_highmem(zone) && zone_idx(zone) != ZONE_MOVABLE)
>  			lowmem_pages += zone_managed_pages(zone);
>  	}
>  
> @@ -8648,7 +8648,7 @@ static void __setup_per_zone_wmarks(void)
>  		spin_lock_irqsave(&zone->lock, flags);
>  		tmp = (u64)pages_min * zone_managed_pages(zone);
>  		do_div(tmp, lowmem_pages);
> -		if (is_highmem(zone)) {
> +		if (is_highmem(zone) || zone_idx(zone) == ZONE_MOVABLE) {
>  			/*
>  			 * __GFP_HIGH and PF_MEMALLOC allocations usually don't
>  			 * need highmem pages, so cap pages_min to a small

This kind-off makes sense to me, but I'm not completely sure about all
implications. We most certainly should update the comment as well.

-- 
Thanks,

David / dhildenb

