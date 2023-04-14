Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58864C77B6E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 10:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjDNKZ7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Apr 2023 06:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjDNKZ6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Apr 2023 06:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3191C7692
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681467904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QcY9UQN+sgDIeuyeA2i6LuRS8ISnfWHgkBht0s/19qA=;
        b=BHLCDZx8gCJweJzPMMZsMXXu4/ilnZLXDjuyBwzZMNXuPggmWbVihuerV4dgjE/Oy/FFnv
        yTxLZRQE8Vx6RvBB03PCF4lRyafAKuN0QTxkMA/v7HkX8tGfp9j4emUy5Ck1QuRLFha9Dy
        yte78GMaFa7tvZCpT1m6imHMjkmDnbI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-gQ9y4UByPXSzxiBn4xUfug-1; Fri, 14 Apr 2023 06:25:03 -0400
X-MC-Unique: gQ9y4UByPXSzxiBn4xUfug-1
Received: by mail-wm1-f70.google.com with SMTP id bg22-20020a05600c3c9600b003ef6ee937b8so5783596wmb.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 03:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681467902; x=1684059902;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcY9UQN+sgDIeuyeA2i6LuRS8ISnfWHgkBht0s/19qA=;
        b=cXTT9ClcWvzicxSxCY/hbBAz52OFdIaGNuVD8KeKQkHFprzZeiLgVD7b8/yBj+X+bc
         iZjy1HMGGLe9njPciibSHIgv94jChpxhig1o8jPJFTiEfbhK3kn4onFHzrln3RetnVjV
         N11924u1g7PQTo2bfgS/aox/JamgIB0foLqZv2Bry7x1ioKb1ra2rgwryB3WEi0Hpqmr
         RkpGoZKK/J/OgXhKLIafHlhKrMBZxa0q16S9oZgwoE8z3K/fwFC4kB4NGn9AE3dXshyf
         b5Mrmvx1nLQ2uUAb/ISdeIZyYTXwdTljlKCxzZoBCfEyL2dB39r3U8hErsme3i8eUbEH
         v3eA==
X-Gm-Message-State: AAQBX9dY3rPUCaj6/DH+BI0QtgFHk0weiALLDpsHWiunDlQlKYmTR5IM
        2pNgwrH/6DSjmhmLxoWIwcwwN8nckESZGmgE+shc7iaWc33RSJyEgjImn0abXymb9UXGIs2fjF7
        i4CcCumBGMgRSzSTDBlhdCnz82+zJ
X-Received: by 2002:a1c:f60a:0:b0:3ed:9ce3:4a39 with SMTP id w10-20020a1cf60a000000b003ed9ce34a39mr4168150wmc.26.1681467901818;
        Fri, 14 Apr 2023 03:25:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350aE0fJ16pyJLzb3fBgzbhX9M+NiOEOq9BBo6MIjOgyR17TW6oYD8CgWOQk9CaCcb1Vv4AXb3A==
X-Received: by 2002:a1c:f60a:0:b0:3ed:9ce3:4a39 with SMTP id w10-20020a1cf60a000000b003ed9ce34a39mr4168127wmc.26.1681467901399;
        Fri, 14 Apr 2023 03:25:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:5700:cb5b:f73a:c650:1d9? (p200300cbc7025700cb5bf73ac65001d9.dip0.t-ipconnect.de. [2003:cb:c702:5700:cb5b:f73a:c650:1d9])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003ee74c25f12sm7605573wms.35.2023.04.14.03.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 03:25:00 -0700 (PDT)
Message-ID: <d2df2d42-66bd-3b7a-99a1-370cc91906e4@redhat.com>
Date:   Fri, 14 Apr 2023 12:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230413233115.1878303-1-shr@devkernel.io>
 <20230413233115.1878303-2-shr@devkernel.io>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 1/3] mm: add new api to enable ksm per process
In-Reply-To: <20230413233115.1878303-2-shr@devkernel.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks!

In general,

Acked-by: David Hildenbrand <david@redhat.com>

Two nits below, after staring at some other prctl implementations.

> +#define PR_SET_MEMORY_MERGE		67
> +#define PR_GET_MEMORY_MERGE		68
>   #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 495cd87d9bf4..8c2e50edeb18 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -15,6 +15,7 @@
>   #include <linux/highuid.h>
>   #include <linux/fs.h>
>   #include <linux/kmod.h>
> +#include <linux/ksm.h>
>   #include <linux/perf_event.h>
>   #include <linux/resource.h>
>   #include <linux/kernel.h>
> @@ -2661,6 +2662,30 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>   	case PR_SET_VMA:
>   		error = prctl_set_vma(arg2, arg3, arg4, arg5);
>   		break;
> +#ifdef CONFIG_KSM
> +	case PR_SET_MEMORY_MERGE:

Looking at some other code (PR_SET_NO_NEW_PRIVS/ PR_SET_THP_DISABLE) I 
wonder if we also want

if (arg3 || arg4 || arg5)
	return -EINVAL;

For PR_GET_MEMORY_MERGE it looks good already.

> +		if (mmap_write_lock_killable(me->mm))
> +			return -EINTR;
> +
> +		if (arg2) {
> +			error = ksm_enable_merge_any(me->mm);
> +		} else {
> +			/*
> +			 * TODO: we might want disable KSM on all VMAs and
> +			 * trigger unsharing to completely disable KSM.
> +			 */
> +			clear_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
> +			error = 0;
> +		}
> +		mmap_write_unlock(me->mm);
> +		break;
> +	case PR_GET_MEMORY_MERGE:
> +		if (arg2 || arg3 || arg4 || arg5)
> +			return -EINVAL;
> +
> +		error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
> +		break;
> +#endif
>   	default:
>   		error = -EINVAL;
>   		break;

[...]

> +/**
> + * ksm_enable_merge_any - Add mm to mm ksm list and enable merging on all
> + *                        compatible VMA's
> + *
> + * @mm:  Pointer to mm
> + *
> + * Returns 0 on success, otherwise error code
> + */
> +int ksm_enable_merge_any(struct mm_struct *mm)
> +{
> +	int err;
> +
> +	if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
> +		return -EINVAL;


I'm curious, why is enabling the prctl() supposed to fail if already 
enabled? (it would not fail if disabling and already disabled)

For example, PR_SET_THP_DISABLE/PR_SET_NO_NEW_PRIVS doesn't fail if 
already set.

-- 
Thanks,

David / dhildenb

