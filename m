Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475DEECAAD3
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 09:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiISJAb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiISJAX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 05:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1673612741
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663578020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f8vJrGjQeilqRFYE1RxARCjX6qJaMbpyS//5x6x7ndo=;
        b=TdRKrWq/3Wmbpp2OKRdx3bninBJoR4WpCpdN+UhVYW/GQ25oiHF4RShJ/3A9bTy82hTa4Z
        ef45PMFxT3fAkrvDJVUATXAC2Tpm2cL8/4HJGVfAQEgrUBAHwd6AkJPR8IhNRsmi2oqCgp
        wmM5Qwo3r1gY14KggjuAOPXeP2BrncQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-FRqsgvvYOGKk_5vdA4ehZg-1; Mon, 19 Sep 2022 05:00:18 -0400
X-MC-Unique: FRqsgvvYOGKk_5vdA4ehZg-1
Received: by mail-wm1-f71.google.com with SMTP id 7-20020a05600c020700b003b4ce6e6b12so1117075wmi.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 02:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=f8vJrGjQeilqRFYE1RxARCjX6qJaMbpyS//5x6x7ndo=;
        b=fYyuw8Uy4shuIrOH26N6dYJbM9Sq5g2UDP5n3MiPwkC1TskkPOA87No8NOvekud4hU
         kuvQmiu98miVFJrU0tVYkAWSkGlSkEaYNxK9yK5WuRYZHwNixIzbq9QSHeRAMdDGIsWp
         eD6jvLoQJQrlE6rZOQqAMpwEdpwBESK7n1fBAyeXAIG9fNax6d/9XcoV7u/munC8DZ+A
         HXkW6DtiZhnPU2eBItLXOgjN6WUAPFekv26F2BzMJIeT3WKBC9ISJWtFUX8SO/mhcVf1
         jlKN5UByJ7wJrilM+u3Fmv3b7KZag8FuSuEEGQLzJ/tpRM8aX7RBgsDRCdo1JX8ukajk
         Tx1g==
X-Gm-Message-State: ACrzQf0wJBxG2UEoiNJ5P2HsqX56oGq8GzNzeOn1Ht3wgPFchciZ8PQm
        2x5qiedwc9OnjjRlZxJID3Y+IG94a1fbUQ2rjj3r7j+ObHmIaPGRbFHCZLYsN766FSs+6n/+Za3
        mmfHfVS9zTB3+78QfxdpB
X-Received: by 2002:adf:fac1:0:b0:226:d790:7644 with SMTP id a1-20020adffac1000000b00226d7907644mr9702003wrs.471.1663578017568;
        Mon, 19 Sep 2022 02:00:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rznsvQQ2aFPHDwwQoZOzqCdtHUk+1F3DZsMptAy7fZIeeIGMjN1cCROUuWBeOapmd+ic45w==
X-Received: by 2002:adf:fac1:0:b0:226:d790:7644 with SMTP id a1-20020adffac1000000b00226d7907644mr9701986wrs.471.1663578017299;
        Mon, 19 Sep 2022 02:00:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3? (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de. [2003:cb:c703:c100:c136:f914:345f:f5f3])
        by smtp.gmail.com with ESMTPSA id k38-20020a05600c1ca600b003b31fc77407sm13688025wms.30.2022.09.19.02.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:00:16 -0700 (PDT)
Message-ID: <b610a7b3-d740-8d45-c270-4c638deb1cfa@redhat.com>
Date:   Mon, 19 Sep 2022 11:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To:     Doug Berger <opendmb@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Rapoport <rppt@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Borislav Petkov <bp@suse.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        - <devicetree-spec@vger.kernel.org>,
        KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
        Mel Gorman <mgorman@suse.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mm@kvack.org, iommu@lists.linux.dev
References: <20220913195508.3511038-1-opendmb@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 00/21] mm: introduce Designated Movable Blocks
In-Reply-To: <20220913195508.3511038-1-opendmb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dough,

I have some high-level questions.

> MOTIVATION:
> Some Broadcom devices (e.g. 7445, 7278) contain multiple memory
> controllers with each mapped in a different address range within
> a Uniform Memory Architecture. Some users of these systems have

How large are these areas typically?

How large are they in comparison to other memory in the system?

How is this memory currently presented to the system?

> expressed the desire to locate ZONE_MOVABLE memory on each
> memory controller to allow user space intensive processing to
> make better use of the additional memory bandwidth.

Can you share some more how exactly ZONE_MOVABLE would help here to make 
better use of the memory bandwidth?

> Unfortunately, the historical monotonic layout of zones would
> mean that if the lowest addressed memory controller contains
> ZONE_MOVABLE memory then all of the memory available from
> memory controllers at higher addresses must also be in the
> ZONE_MOVABLE zone. This would force all kernel memory accesses
> onto the lowest addressed memory controller and significantly
> reduce the amount of memory available for non-movable
> allocations.

We do have code that relies on zones during boot to not overlap within a 
single node.

> 
> The main objective of this patch set is therefore to allow a
> block of memory to be designated as part of the ZONE_MOVABLE
> zone where it will always only be used by the kernel page
> allocator to satisfy requests for movable pages. The term
> Designated Movable Block is introduced here to represent such a
> block. The favored implementation allows modification of the

Sorry to say, but that term is rather suboptimal to describe what you 
are doing here. You simply have some system RAM you'd want to have 
managed by ZONE_MOVABLE, no?

> 'movablecore' kernel parameter to allow specification of a base
> address and support for multiple blocks. The existing
> 'movablecore' mechanisms are retained. Other mechanisms based on
> device tree are also included in this set.
> 
> BACKGROUND:
> NUMA architectures support distributing movablecore memory
> across each node, but it is undesirable to introduce the
> overhead and complexities of NUMA on systems that don't have a
> Non-Uniform Memory Architecture.

How exactly would that look like? I think I am missing something :)

> 
> Commit 342332e6a925 ("mm/page_alloc.c: introduce kernelcore=mirror option")
> also depends on zone overlap to support sytems with multiple
> mirrored ranges.

IIRC, zones will not overlap within a single node.

> 
> Commit c6f03e2903c9 ("mm, memory_hotplug: remove zone restrictions")
> embraced overlapped zones for memory hotplug.

Yes, after boot.

> 
> This commit set follows their lead to allow the ZONE_MOVABLE
> zone to overlap other zones while spanning the pages from the
> lowest Designated Movable Block to the end of the node.
> Designated Movable Blocks are made absent from overlapping zones
> and present within the ZONE_MOVABLE zone.
> 
> I initially investigated an implementation using a Designated
> Movable migrate type in line with comments[1] made by Mel Gorman
> regarding a "sticky" MIGRATE_MOVABLE type to avoid using
> ZONE_MOVABLE. However, this approach was riskier since it was
> much more instrusive on the allocation paths. Ultimately, the
> progress made by the memory hotplug folks to expand the
> ZONE_MOVABLE functionality convinced me to follow this approach.
> 
> OPPORTUNITIES:
> There have been many attempts to modify the behavior of the
> kernel page allocators use of CMA regions. This implementation
> of Designated Movable Blocks creates an opportunity to repurpose
> the CMA allocator to operate on ZONE_MOVABLE memory that the
> kernel page allocator can use more agressively, without
> affecting the existing CMA implementation. It is hoped that the
> "shared-dmb-pool" approach included here will be useful in cases
> where memory sharing is more important than allocation latency.
> 
> CMA introduced a paradigm where multiple allocators could
> operate on the same region of memory, and that paradigm can be
> extended to Designated Movable Blocks as well. I was interested
> in using kernel resource management as a mechanism for exposing
> Designated Movable Block resources (e.g. /proc/iomem) that would
> be used by the kernel page allocator like any other ZONE_MOVABLE
> memory, but could be claimed by an alternative allocator (e.g.
> CMA). Unfortunately, this becomes complicated because the kernel
> resource implementation varies materially across different
> architectures and I do not require this capability so I have
> deferred that.

Why can't we simply designate these regions as CMA regions?

Why do we have to start using ZONE_MOVABLE for them?

-- 
Thanks,

David / dhildenb

