Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C27C4743D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 14:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1D676135D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 14:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbhFHOCz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 10:02:55 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57516 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbhFHOCz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 10:02:55 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 857371FD33;
        Tue,  8 Jun 2021 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1623160861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CF3V2yBluejgpXrXpzIa28hHGX5nHnF0ElTMo/4V698=;
        b=iwYgwiGyiwgv35j87q2CCzyEWZb8OUvJx5l6BRtuTRjlI2w/JHZc/w6A7VeuaPOTdo9Dqv
        JXmvKZimUF99jZffOp66kjYcq+NfHy8jTFdU+vD0GNx2HmDXbOiuOPl69gIR+kHpIqSRh8
        vlaZSYyaHJHgPxyEzhKH4YunXBOw1qM=
Received: from suse.cz (unknown [10.100.201.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 889E4A3B8A;
        Tue,  8 Jun 2021 14:01:00 +0000 (UTC)
Date:   Tue, 8 Jun 2021 16:01:00 +0200
From:   Michal Hocko <mhocko@suse.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] memory-hotplug.rst: remove locking details from
 admin-guide
Message-ID: <YL94HJ5wUkVRFStR@dhcp22.suse.cz>
References: <20210608133855.20397-1-david@redhat.com>
 <20210608133855.20397-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608133855.20397-2-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue 08-06-21 15:38:54, David Hildenbrand wrote:
> We have the same content at Documentation/core-api/memory-hotplug.rst
> and it doesn't fit into the admin-guide. The documentation was
> accidentially duplicated when merging.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Muchun Song <songmuchun@bytedance.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  .../admin-guide/mm/memory-hotplug.rst         | 39 -------------------
>  1 file changed, 39 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index c6bae2d77160..a783cf7c8e4c 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -415,45 +415,6 @@ Need more implementation yet....
>   - Guard from remove if not yet.
>  
>  
> -Locking Internals
> -=================
> -
> -When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
> -the device_hotplug_lock should be held to:
> -
> -- synchronize against online/offline requests (e.g. via sysfs). This way, memory
> -  block devices can only be accessed (.online/.state attributes) by user
> -  space once memory has been fully added. And when removing memory, we
> -  know nobody is in critical sections.
> -- synchronize against CPU hotplug and similar (e.g. relevant for ACPI and PPC)
> -
> -Especially, there is a possible lock inversion that is avoided using
> -device_hotplug_lock when adding memory and user space tries to online that
> -memory faster than expected:
> -
> -- device_online() will first take the device_lock(), followed by
> -  mem_hotplug_lock
> -- add_memory_resource() will first take the mem_hotplug_lock, followed by
> -  the device_lock() (while creating the devices, during bus_add_device()).
> -
> -As the device is visible to user space before taking the device_lock(), this
> -can result in a lock inversion.
> -
> -onlining/offlining of memory should be done via device_online()/
> -device_offline() - to make sure it is properly synchronized to actions
> -via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
> -
> -When adding/removing/onlining/offlining memory or adding/removing
> -heterogeneous/device memory, we should always hold the mem_hotplug_lock in
> -write mode to serialise memory hotplug (e.g. access to global/zone
> -variables).
> -
> -In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
> -mode allows for a quite efficient get_online_mems/put_online_mems
> -implementation, so code accessing memory can protect from that memory
> -vanishing.
> -
> -
>  Future Work
>  ===========
>  
> -- 
> 2.31.1

-- 
Michal Hocko
SUSE Labs
