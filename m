Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE58CC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 17:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbiKHR5v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 12:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233901AbiKHR5s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 12:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D07101E6
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 09:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667930213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KC+QOAZ2Rjsc33WuLf5AORtVReDw8ySdynapXv7DDmc=;
        b=SbDq3iFTyQxk4ZHy6Yej9Z4oBN5x/VUm7ogcZt8y0jQgyhwZ/BnmDnewViCkuKxT9Kp7eS
        ExKnEvMwv6m4bu7jHmbyVt+h6OYQ1P8grAuVNDcCI0RLxveiFAL5M3cvAPmb2ZNeOJIlqo
        eUvim6CzafG4wgLu0yo1fvC5aH6P51c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-TQzwTNXTOxiI771Dj13ObA-1; Tue, 08 Nov 2022 12:56:52 -0500
X-MC-Unique: TQzwTNXTOxiI771Dj13ObA-1
Received: by mail-wm1-f71.google.com with SMTP id v125-20020a1cac83000000b003cfa148576dso4286593wme.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 09:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC+QOAZ2Rjsc33WuLf5AORtVReDw8ySdynapXv7DDmc=;
        b=s9SQ3NtkD23GRQarI3P0ziDNsmeCzOMzQgDsvBZDj+gsvKHb3PP99PoXKwrRHT4OP3
         5DdN/fHfaFXi69EqHvyO9v+c9VSEtrWP5vuMZM7XErGPih7UA0Vju0R5DrIPSKAHpwm6
         phRTTdtYLfSAqS/JpbfQ37yqowKPYE1wYNINDGqQYkF92aMN06uSpABPjqM0voQo9LRB
         i0tpbaHpvfSZBjtVM5Fhu8xmzB9IkSzFY2qcjiin2xVAmgr7MtkU5zlLmingsyna6smt
         f0n+Ux2JpeB53ujRLbdUGSGrMSjv5voh9KT2ZIiUJkPbq1Pojq3cO7suNOYv/e7KGXmZ
         We+g==
X-Gm-Message-State: ACrzQf3PiHF4WHJMux2L5vYY/6r/TBJ3PtSYjlttvkLtESro3J3+YV0F
        6lnd5UMbmVhb5JYSx+6oi6MD4/VbE+m5fhj0jiSOYWVIFfyqmq8nYDF2YqyKnLC/HcHQHGPChKF
        svLebcPLUhDeCEhCUr6Tr
X-Received: by 2002:a05:600c:3494:b0:3cf:8ed7:7124 with SMTP id a20-20020a05600c349400b003cf8ed77124mr615955wmq.140.1667930211425;
        Tue, 08 Nov 2022 09:56:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6VUBcqMmBhSgArgPVMY9CQPRgOY/M6ncMhTHXwRtOanYZY7VA2pKJUh5kwU2FYxjJXG0Z1kA==
X-Received: by 2002:a05:600c:3494:b0:3cf:8ed7:7124 with SMTP id a20-20020a05600c349400b003cf8ed77124mr615936wmq.140.1667930211007;
        Tue, 08 Nov 2022 09:56:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:db00:6510:da8d:df40:abbb? (p200300cbc708db006510da8ddf40abbb.dip0.t-ipconnect.de. [2003:cb:c708:db00:6510:da8d:df40:abbb])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b003b4ff30e566sm34771742wmq.3.2022.11.08.09.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:56:50 -0800 (PST)
Message-ID: <e94ac231-7137-010c-2f2b-6a309c941759@redhat.com>
Date:   Tue, 8 Nov 2022 18:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Pasha Tatashin <pasha.tatashin@soleen.com>, corbet@lwn.net,
        akpm@linux-foundation.org, hughd@google.com, hannes@cmpxchg.org,
        vincent.whitchurch@axis.com, seanjc@google.com, rppt@kernel.org,
        shy828301@gmail.com, paul.gortmaker@windriver.com,
        peterx@redhat.com, vbabka@suse.cz, Liam.Howlett@Oracle.com,
        ccross@google.com, willy@infradead.org, arnd@arndb.de,
        cgel.zte@gmail.com, yuzhao@google.com,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        bagasdotme@gmail.com, kirill@shutemov.name
References: <20221107184715.3950621-1-pasha.tatashin@soleen.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] mm: anonymous shared memory naming
In-Reply-To: <20221107184715.3950621-1-pasha.tatashin@soleen.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.11.22 19:47, Pasha Tatashin wrote:
> Since: commit 9a10064f5625 ("mm: add a field to store names for private
> anonymous memory"), name for private anonymous memory, but not shared
> anonymous, can be set. However, naming shared anonymous memory just as

                                                                  ^ is

> useful for tracking purposes.
> 
> Extend the functionality to be able to set names for shared anon.
> 
> Sample output:
>    /* Create shared anonymous segmenet */

s/segmenet/segment/

>    anon_shmem = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>                      MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>    /* Name the segment: "MY-NAME" */
>    rv = prctl(PR_SET_VMA, PR_SET_VMA_ANON_NAME,
>               anon_shmem, SIZE, "MY-NAME");
> 
> cat /proc/<pid>/maps (and smaps):
> 7fc8e2b4c000-7fc8f2b4c000 rw-s 00000000 00:01 1024 [anon_shmem:MY-NAME]

What would it have looked like before? Just no additional information?

> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---


[...]

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8bbcccbc5565..06b6fb3277ab 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -699,8 +699,10 @@ static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
>    * paths in userfault.
>    */
>   bool vma_is_shmem(struct vm_area_struct *vma);
> +bool vma_is_anon_shmem(struct vm_area_struct *vma);
>   #else
>   static inline bool vma_is_shmem(struct vm_area_struct *vma) { return false; }
> +static inline bool vma_is_anon_shmem(struct vm_area_struct *vma) { return false; }
>   #endif
>   
>   int vma_is_stack_for_current(struct vm_area_struct *vma);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 500e536796ca..08d8b973fb60 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -461,21 +461,11 @@ struct vm_area_struct {
>   	 * For areas with an address space and backing store,
>   	 * linkage into the address_space->i_mmap interval tree.
>   	 *
> -	 * For private anonymous mappings, a pointer to a null terminated string
> -	 * containing the name given to the vma, or NULL if unnamed.
>   	 */
> -
> -	union {
> -		struct {
> -			struct rb_node rb;
> -			unsigned long rb_subtree_last;
> -		} shared;
> -		/*
> -		 * Serialized by mmap_sem. Never use directly because it is
> -		 * valid only when vm_file is NULL. Use anon_vma_name instead.
> -		 */
> -		struct anon_vma_name *anon_name;
> -	};
> +	struct {
> +		struct rb_node rb;
> +		unsigned long rb_subtree_last;
> +	} shared;
>   

So that effectively grows the size of vm_area_struct. Hm. I'd really 
prefer to keep this specific to actual anonymous memory, not extending 
it to anonymous files.

Do we have any *actual* users where we don't have an alternative? I 
doubt that this is really required.

The simplest approach seems to be to use memfd instead of MAP_SHARED | 
MAP_ANONYMOUS. __NR_memfd_create can be passed a name and you get what 
you propose here effectively already. Or does anything speak against it?

-- 
Thanks,

David / dhildenb

