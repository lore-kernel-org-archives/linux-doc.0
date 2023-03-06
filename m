Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88EEC61DA4
	for <linux-doc@archiver.kernel.org>; Mon,  6 Mar 2023 13:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCFNk3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Mar 2023 08:40:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbjCFNk1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 08:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2FA2E80A
        for <linux-doc@vger.kernel.org>; Mon,  6 Mar 2023 05:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678109977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LOVN4stLRHTQVaqeDmIkyBEmdWYki1rB8EYvuBV3opc=;
        b=gd9nVM7EUTkjp0XG+B42qFOKnr7DTvjzOmaczataw0ThU/izkE2Fklraqp1t8Jo0gd47tL
        nR65SDJ0O++igEUZg9vFCbGnhAVAftw35U9KDDzj6KdiqWvehyvbnQbcRClxEbT/hSVRzM
        /FoZqcEdnabLffs3Npuvg4WLBF50pKY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-8JGiwwQiO-uUQef4zF1BFg-1; Mon, 06 Mar 2023 08:39:36 -0500
X-MC-Unique: 8JGiwwQiO-uUQef4zF1BFg-1
Received: by mail-ed1-f70.google.com with SMTP id g2-20020a056402320200b004e98d45ee7dso2103941eda.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Mar 2023 05:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678109975;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOVN4stLRHTQVaqeDmIkyBEmdWYki1rB8EYvuBV3opc=;
        b=xcnpM3zkiThHf8MVNImVB+oMCZ9vaQBIfeMu7xv3DcRpowAWJQI+/SyxK7Re0a16KQ
         iXOTeDZivi9NKv5umstMm2DnkE4TUgrrcD5dFAQTn2n8KjcPB2WuR79BaeJXa+Rah97u
         BA4zl+Mtti78lkvbWe6MZu2i1doEE6I4Q2fsyWnDPRe4UvdQiOQmScvuiFMwbTGJlKea
         LgWvj0Zeb4JG4paQnKteeeG84QdtTRnOjPmH8xQDKCmMGXpYlps3TlIiWnCOq4hfnAHJ
         iQdPb4rb3iXLF8He9BlHnlNxN1o5gPUHJPMxb61IzsgkXghDbCOCctYsXouF1h3F7fy0
         FZcA==
X-Gm-Message-State: AO0yUKX3HIJJ/opBbMKS8Bjp/Mbg83xeeCSNH5U3US98VRf0LmiFgnoW
        g71Sg4tkfHtGm79MM3m7jB9Y072ZA6Ec2kvyfphV3H2ki4UydfF4QSk9zgPZNBBXrxNYNUw6Bsn
        R221eTeaeVG1tUevDwdye
X-Received: by 2002:a50:ec96:0:b0:4af:59c0:744a with SMTP id e22-20020a50ec96000000b004af59c0744amr10972646edr.24.1678109975486;
        Mon, 06 Mar 2023 05:39:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8KE4YVRQz4uoFRiDZVYCe4Nq51cMVfE6lURcBeZSNGPzL3SIu+Y9GYbKdPhloh22f55SnPog==
X-Received: by 2002:a50:ec96:0:b0:4af:59c0:744a with SMTP id e22-20020a50ec96000000b004af59c0744amr10972620edr.24.1678109975147;
        Mon, 06 Mar 2023 05:39:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id q2-20020a50cc82000000b004acbda55f6bsm5099360edi.27.2023.03.06.05.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:39:34 -0800 (PST)
Message-ID: <7a1d4010-5804-c806-31cb-a6bac50f6e1e@redhat.com>
Date:   Mon, 6 Mar 2023 14:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To:     "Liam R. Howlett" <Liam.Howlett@Oracle.com>, airlied@gmail.com,
        daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
        corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
 <63fd642e.170a0220.f67f6.e248@mx.google.com>
 <20230228162407.34civk22g5kh7mwt@revolver>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230228162407.34civk22g5kh7mwt@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/28/23 17:24, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230227 21:17]:
>> On Tue, Feb 21, 2023 at 01:20:50PM -0500, Liam R. Howlett wrote:
>>> * Danilo Krummrich <dakr@redhat.com> [230217 08:45]:
>>>> Add infrastructure to keep track of GPU virtual address (VA) mappings
>>>> with a decicated VA space manager implementation.
>>>>
>>>> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
>>>> start implementing, allow userspace applications to request multiple and
>>>> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
>>>> intended to serve the following purposes in this context.
>>>>
>>>> 1) Provide infrastructure to track GPU VA allocations and mappings,
>>>>     making use of the maple_tree.
>>>>
>>>> 2) Generically connect GPU VA mappings to their backing buffers, in
>>>>     particular DRM GEM objects.
>>>>
>>>> 3) Provide a common implementation to perform more complex mapping
>>>>     operations on the GPU VA space. In particular splitting and merging
>>>>     of GPU VA mappings, e.g. for intersecting mapping requests or partial
>>>>     unmap requests.
>>>>
>>>> Suggested-by: Dave Airlie <airlied@redhat.com>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>   Documentation/gpu/drm-mm.rst    |   31 +
>>>>   drivers/gpu/drm/Makefile        |    1 +
>>>>   drivers/gpu/drm/drm_gem.c       |    3 +
>>>>   drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
>>>>   include/drm/drm_drv.h           |    6 +
>>>>   include/drm/drm_gem.h           |   75 ++
>>>>   include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
>>>>   7 files changed, 2534 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>>>   create mode 100644 include/drm/drm_gpuva_mgr.h
>>>>
>>>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>>>> index a52e6f4117d6..c9f120cfe730 100644
>>>> --- a/Documentation/gpu/drm-mm.rst
>>>> +++ b/Documentation/gpu/drm-mm.rst
>>>> @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
>>>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>>>      :export:
>>>>   
>>> ...
>>>
>>>> +
>>>> +/**
>>>> + * drm_gpuva_remove_iter - removes the iterators current element
>>>> + * @it: the &drm_gpuva_iterator
>>>> + *
>>>> + * This removes the element the iterator currently points to.
>>>> + */
>>>> +void
>>>> +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
>>>> +{
>>>> +	mas_erase(&it->mas);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_gpuva_iter_remove);
>>>> +
>>>> +/**
>>>> + * drm_gpuva_insert - insert a &drm_gpuva
>>>> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>>>> + * @va: the &drm_gpuva to insert
>>>> + * @addr: the start address of the GPU VA
>>>> + * @range: the range of the GPU VA
>>>> + *
>>>> + * Insert a &drm_gpuva with a given address and range into a
>>>> + * &drm_gpuva_manager.
>>>> + *
>>>> + * Returns: 0 on success, negative error code on failure.
>>>> + */
>>>> +int
>>>> +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>>>> +		 struct drm_gpuva *va)
>>>> +{
>>>> +	u64 addr = va->va.addr;
>>>> +	u64 range = va->va.range;
>>>> +	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
>>>> +	struct drm_gpuva_region *reg = NULL;
>>>> +	int ret;
>>>> +
>>>> +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
>>>> +		reg = drm_gpuva_in_region(mgr, addr, range);
>>>> +		if (unlikely(!reg))
>>>> +			return -EINVAL;
>>>> +	}
>>>> +
>>>
>>> -----
>>>
>>>> +	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
>>>> +		return -EEXIST;
>>>> +
>>>> +	ret = mas_store_gfp(&mas, va, GFP_KERNEL);
>>>
>>> mas_walk() will set the internal maple state to the limits to what it
>>> finds.  So, instead of an iterator, you can use the walk function and
>>> ensure there is a large enough area in the existing NULL:
>>>
>>> /*
>>>   * Nothing at addr, mas now points to the location where the store would
>>>   * happen
>>>   */
>>> if (mas_walk(&mas))
>>> 	return -EEXIST;
>>>
>>
>> For some reason mas_walk() finds an entry and hence this function returns
>> -EEXIST for the following sequence of insertions.
>>
>> A = [0xc0000 - 0xfffff]
>> B = [0x0 - 0xbffff]
>>
>> Interestingly, inserting B before A works fine.
>>
>> I attached a test module that reproduces the issue. I hope its just a stupid
>> mistake I just can't spot though.
> 
> This is probably my fault in how I explained things, I seem to have had
> a bug in my code.
> 
> Let me try again.
> 
> mas_walk(&mas) will go to the range of mas.index
> 	It will set mas.index = range_start
> 	It will set mas.last = range_end
> 	It will return entry in that range.
> 
> Your code is walking to addr (0xc0000, say)
> You get NULL
> and the range is now: mas.index = 0, mas.last = ULONG_MAX
> 
> You set mas.last = 0xc0000 + 0x40000 -1
> You store your va in the range of 0 - 0xfffff - This isn't what you want
> to do and this is why you are seeing it exists when done in this order.
> 
> In the reverse order, your lower limit is fine so it works out.
> 
> Try adding a check to ensure the lower range is still accurate as well:
>          if (mas.index < addr)
>                  mas.index = addr;
> 

Thanks for the clarification, this indeed fixes the issue.

> If you compile with CONFIG_DEBUG_MAPLE_TREE, you can use mt_dump() to
> dump the tree for debugging.

That's pretty handy.

> 
> I also have some quality of life patches I'm developing to configure the
> format of the dump (hex/dec) and a mas_dump() for more information as
> well.

Great, I tried it out and really missed a hex option. Are they in any 
git repository already, such that I could fetch them?

> 
>>
>>> /* The NULL entry ends at mas.last, make sure there is room */
>>> if (mas.last < (addr + range - 1))
>>> 	return -EEXIST;
>>>
>>> /* Limit the store size to the correct end address, and store */
>>>   mas.last = addr + range - 1;
>>>   ret = mas_store_gfp(&mas, va, GFP_KERNEL);
>>>
> 
> 

