Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DEDC12002
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 07:34:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5A0A608FE
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 07:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbhGSHhZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 03:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43127 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234770AbhGSHhY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 03:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626680065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0sfSO6C1l3WtCtuFbg0VI6VLBjRIkRSfgQNpDtonfxE=;
        b=AtC6lEHwR/FWKqPTmgQ94x4ZiUM8NhOQolua4gxvskoaXMXc2SZF7Bm4iOFEEM4N89alLf
        IfSIxUfH43MqSW2eL+9LpFRmnrx3ZWIU2uvp/MKdqR52Uri5PnFK2SQeM5Lx8jeZ6EKBnt
        SoRKwBdHvtvdB8PLzQRNx6pDStr92Ik=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-cq54hiGLOzW53d7JBiN6Jw-1; Mon, 19 Jul 2021 03:34:23 -0400
X-MC-Unique: cq54hiGLOzW53d7JBiN6Jw-1
Received: by mail-wr1-f69.google.com with SMTP id j6-20020adff5460000b029013c7749ad05so8407015wrp.8
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 00:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0sfSO6C1l3WtCtuFbg0VI6VLBjRIkRSfgQNpDtonfxE=;
        b=V24WRLp39nfwEHebwTe0Da+VcwmquknHJy04TY69nRSmN13WbXCOd/HZPHsdxldGcK
         wZTOD38HisjGmHv9d+2o1fbCRsH4cUWpJoht7+QFfMyL6I5IVBnAzLrHsP6vIyDfhg+n
         1hBoJTTYYfrwbyQfxn5rUkukEpdxnmvQOMlqP2RzGI70bNBpjDWdOiArzP7PwVEnv6FU
         s4sg0llqbxHIwACS/DuE7z/+1ZEjtVnizkosM1JK3SXruMAM1CDG8fBUL2AIuVrPzgp/
         CG7xy/SRg9kii1+fTAZ7XNhZO9W7rUNBD6x89mSBiWlKHrA3Pqapxtba+hjWD41/sM+m
         JQXg==
X-Gm-Message-State: AOAM533rQZ+Qr+5TbcPQZT5sxMIs4lWy//r+CbhhKigAItux1WgMU1kK
        GZ1gM9pFE9rTYiyNxtU2NkyFLtxaFoMvEQ1c/W33SUoV2Fm3d6rTlPlzsRxnwgVj9wmeBLn9KBy
        4L1bRYDlvmp55ffrM9zoC
X-Received: by 2002:a05:600c:3595:: with SMTP id p21mr17863840wmq.105.1626680062030;
        Mon, 19 Jul 2021 00:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz07efcFEv5EX0OoyTVlUJhLNO1Fd9o7f8O9ViBtmkhlottvR3Rzu2ykVMUwwmu3TH+CIaAhw==
X-Received: by 2002:a05:600c:3595:: with SMTP id p21mr17863820wmq.105.1626680061792;
        Mon, 19 Jul 2021 00:34:21 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id y3sm19433446wrh.16.2021.07.19.00.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 00:34:21 -0700 (PDT)
To:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 0/7] Free user PTE page table pages
Message-ID: <5ce5fb25-df1d-b807-8807-595b8a7bfc63@redhat.com>
Date:   Mon, 19 Jul 2021 09:34:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18.07.21 06:30, Qi Zheng wrote:
> Hi,
> 
> This patch series aims to free user PTE page table pages when all PTE entries
> are empty.
> 
> The beginning of this story is that some malloc libraries(e.g. jemalloc or
> tcmalloc) usually allocate the amount of VAs by mmap() and do not unmap those VAs.
> They will use madvise(MADV_DONTNEED) to free physical memory if they want.
> But the page tables do not be freed by madvise(), so it can produce many
> page tables when the process touches an enormous virtual address space.

... did you see that I am actually looking into this?

https://lkml.kernel.org/r/bae8b967-c206-819d-774c-f57b94c4b362@redhat.com

and have already spent a significant time on it as part of my research, 
which is *really* unfortunate and makes me quite frustrated at the 
beginning of the week alreadty ...

Ripping out page tables is quite difficult, as we have to stop all page 
table walkers from touching it, including the fast_gup, rmap and page 
faults. This usually involves taking the mmap lock in write. My approach 
does page table reclaim asynchronously from another thread and do not 
rely on reference counts.

-- 
Thanks,

David / dhildenb

