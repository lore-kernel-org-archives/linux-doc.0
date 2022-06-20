Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1A7C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 20 Jun 2022 08:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240106AbiFTI4K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Jun 2022 04:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239425AbiFTI4J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jun 2022 04:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9456460C5
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655715367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QEyy/6JZbSt5hhSc4lO1WFt1fgnwbmapR64qYRXGvPc=;
        b=HPIKtSN1Is/swNaRBOj4kuzWqb9sHL3m/SkejYrhCptU3O08MAoSLUO0YxOfmEfHz2mxFc
        WUKDtN8ZGrOo5zNVw+pvM5JF54xBequCKhSLSCgf6ML4xa6rNI/rI+gbxRCWDsVArgXVIO
        MjxbgBwth3Qkzh0gUUQRJDk+/qtaw4w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-hSvz9lqxMkeecNgWXCmhtQ-1; Mon, 20 Jun 2022 04:56:06 -0400
X-MC-Unique: hSvz9lqxMkeecNgWXCmhtQ-1
Received: by mail-wm1-f72.google.com with SMTP id p22-20020a05600c359600b0039c7b23a1c7so6632280wmq.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 01:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=QEyy/6JZbSt5hhSc4lO1WFt1fgnwbmapR64qYRXGvPc=;
        b=ELfsB5JXLguGncdksX2PV5ALkE8A3u6QZGk0qcsm9VatqQdsoGNb65TazFzUOlfmHc
         ZZz9hDl0CbGx4SyYG1zuVEl5eohG77HTXKU4o6yQn2O8Rov+5JMQ8yZtNWtOG7a2JI39
         wzkF/aQTGbVo9oIcMH6J0N6xEo2+p2jIA8p5crGVpzuzt4MthNc64baj9edqcJ2uH8ol
         nzjI4fMxBIq+t1sh7nn4eezQSR9w+7cDblw8NxCIdZf+eFJ89I6LbV1Y/CwOtBInr23V
         mL3DEQtY0H8w4GccFIhsWJ19nff0Cn9E3ObSMDAmg/4tQVoLI9gvjsF1+Aj/M/T7yN3Z
         20fA==
X-Gm-Message-State: AOAM530HwMCKaMe8ZO2Rclp0L9xa7qQs0J3i3sR/vq9lm4eErtgIbgTX
        z2+jSg0OcLnAIuFek69nQfTW22njCV1k5QmiktC25poh2e1D9jjUvowFPVZhBKDp/ytRAAoY+MG
        XSPbTE4auYw82g/R2xqRs
X-Received: by 2002:a05:600c:1da4:b0:39c:8ca8:5f1d with SMTP id p36-20020a05600c1da400b0039c8ca85f1dmr33538681wms.138.1655715365269;
        Mon, 20 Jun 2022 01:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr1ro13LIJcKzfP5ERziX/+M6AnLEwJ6AA+0q3d8eDjW5v/wKfnrKJGnpWgFweL5QvjYawSw==
X-Received: by 2002:a05:600c:1da4:b0:39c:8ca8:5f1d with SMTP id p36-20020a05600c1da400b0039c8ca85f1dmr33538645wms.138.1655715365042;
        Mon, 20 Jun 2022 01:56:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:2500:cdb0:9b78:d423:43f? (p200300d82f042500cdb09b78d423043f.dip0.t-ipconnect.de. [2003:d8:2f04:2500:cdb0:9b78:d423:43f])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d48ca000000b002102f2fac37sm12841247wrs.51.2022.06.20.01.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:56:04 -0700 (PDT)
Message-ID: <4be7946c-54f5-80a9-4139-5ae07a89e781@redhat.com>
Date:   Mon, 20 Jun 2022 10:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 2/2] mm: memory_hotplug: make hugetlb_optimize_vmemmap
 compatible with memmap_on_memory
Content-Language: en-US
To:     Oscar Salvador <osalvador@suse.de>,
        Muchun Song <songmuchun@bytedance.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, mike.kravetz@oracle.com,
        paulmck@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220619133851.68184-1-songmuchun@bytedance.com>
 <20220619133851.68184-3-songmuchun@bytedance.com>
 <YrAgUtV6wD6CIrad@FVFYT0MHHV2J.usts.net>
 <226243a9-b4f5-182e-1a5b-7b8d5c28f3b3@redhat.com>
 <YrAv18GnMOcQaAxz@FVFYT0MHHV2J.usts.net>
 <YrAzeHbYt1mAs9ue@localhost.localdomain>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YrAzeHbYt1mAs9ue@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.06.22 10:44, Oscar Salvador wrote:
> On Mon, Jun 20, 2022 at 04:29:11PM +0800, Muchun Song wrote:
>>>> Although it works, I think PageVmemmapSelfHosted() check for the 1st pfn's
>>>> vmemmap page is not always reliable.  Since we reused PG_owner_priv_1
>>>> as PG_vmemmap_self_hosted, the test is noly reliable for vmemmap page's
>>>> vmemmap page.  Other non-vmemmap page can be flagged with PG_owner_priv_1.
>>>> So this check can be false-positive. Maybe the following code snippet is
>>>> the solution.
>>>
>>> How could that happen for pages used for backing a vmemmap?
>>>
>>
>> It cannot happen for memmap_on_memory case. Howwver, it can happen for other
>> cases. E.g. the 1st pfn (of boot memory block) whose vmemmap page may be flagged
>> as PG_owner_priv_1 (if PG_swapcache is set). Then, the check is false-positive.
> 
> If this can really happen, which I am not that sure tbh, maybe a way out would be
> to just define a new page-type as we did in previous versions of memmap_on_memory.
> In that way we would not for flags, but for its type.
> 
> But as I said, I am not entirely sure about the potential fallout of what you mention.

We are talking about the memmap of a page, who's page content is the
memmap of pages actually exposed to other users (file-backed, anonymous,
whatsoever).

In other words, while setting PG_swapcache on the memmap of a page
exposed to the user is possible, it shouldn't be possible for the memmap
of the page "hosting" these memmaps.

I know, it's confusing and I keep confusing myself. I tried creating a
picture and it doesn't really clarify the situation :D

-- 
Thanks,

David / dhildenb

