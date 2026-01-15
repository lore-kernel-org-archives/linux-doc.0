Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AA72C0299
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469588; cv=none; b=DQ/9WHIC6jqpxv9DzZXuTnu4+Udo97+BwklKBcpSs3sJqgtMhN6fyPOl75fpsb2h5ZC9Qfc0pO0SMTFG+6TsSF6UPXiHOhiPakDJOs0glT0BqXObxC9iLa87f2DMED5pHvw9RSNBDNb4pATaguTAO7zoeLtytENiCUtjB/lZzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469588; c=relaxed/simple;
	bh=5S/eCr84IqvxFoOtD38rMw+D2s1EBwWgY6WhDrkn7+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMNnvOCw7a7fV01eGMLKQJPQ9w4+RcQN8kI7ImtZIITxlfixL1GKDX4FgpzJeKDRags51khT0nx5/fzH83UbKRPc1QVZWI6aGRWyUlPGx9AtL2vBilU7/6UlmnXjhcNm4/8sydDRmAPI4L5UQ9aJ79opu5NFE4MebD6f8zAjZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gSV3IiK2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AWiH1aLF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gSV3IiK2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AWiH1aLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
	b=gSV3IiK2NPwSJeXUSu3Q7nbfyUJNem6KtptfMSHBSOfeKfX9v/NqX3jVpKVzcmgbzJJNAF
	tE9nJpxDhsBlOHpUxEXUbYjaq3IOrXmSx+boFn/HM+iWrbOS+XaiZn7RIWaSQkfPlM7tuB
	b83GglLGXvVxSVocTbTGQZorC0TdANw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-jhUV_5VeNY60GvLnJoOKtg-1; Thu, 15 Jan 2026 04:33:04 -0500
X-MC-Unique: jhUV_5VeNY60GvLnJoOKtg-1
X-Mimecast-MFC-AGG-ID: jhUV_5VeNY60GvLnJoOKtg_1768469583
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47ee71f0244so4653005e9.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 01:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768469583; x=1769074383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
        b=AWiH1aLFyzFT3ErQALbzAZ07BS7VdeyjOHXJIKRWk3FG1pmY8guJOf31OTjhgHMvip
         mOr2e3+9qnMWwLGf3lgt5FTe7pDmAhJYagvn0k7r0UvulpC0kv9aop0dgNIukrC8lGq3
         P3BulUasV7cByPZO35WFulJZQmeBj1UIEQhs3zTj9sSeHlrNR5GIJiei2cbY9uOnDKZX
         GncXWpQNHk6i4N4y0hGCsWTeVNcw/qyjD5H+sepJ58bCX/CGiKdlVyU++3DFwzt7zkBg
         S3dRTKo/MfzL3vHD7QtZ1E+aKZfu99BO6bRkcsVlmFZ8zOTaqOUXGNc5IXVkd1s3CL8h
         Lc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469583; x=1769074383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
        b=N8u1uNOxF84SS60rKH3CU7g5+B4J5d31xQ3oXmPjpVhZdfoYKBNSDwOmNuEELr+VK6
         jP3wxwZRsRUpYlZS0W7LBgLn9pDV8c9kxr2Es78jiIOtBFhP/ZxiPf764TefLY0SKj3l
         7OdeHL+Ijlh10Qh+mTGLF6d3SlEIdJ/Fti+gX7whYmubMxmCSgZQOg/as6MOZYutxecB
         kO97qZGv4WnsHyOu6U1t7pctyK3f5COE4EBQR03AasaTxWRpY4nyJjp0OLixFnPUZu3F
         s35R7SduHqeXrDyRvkPOSz2btUI1ohVbjvQhQOqBRT9xDeLFc0DsGkkTT7bcP2+i2yk/
         8aug==
X-Forwarded-Encrypted: i=1; AJvYcCUvylflW4yOSSwzI/MCnfaTHQJwQCpOueAnuWz0HnHp4NAR0rAmBKypKbMsdQGsCZ+YD/WvL29mfxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxnV2R1obxkgIUnTebl3G8aQT2kv1fG5GU8VmlNwjmFZXWb9Q
	s0xgWbiPE8ojHaEz15kxRwu+l+lQvqx8t4zeE3IKjx+rtrwpUY/M3s7HrDx4s+URkUFeOimiHtM
	JxXXFbjClutOCPGTjORzgR4CouIlki4zwb08jv9epHWjXYyk0Jekm64QjKbdNHA==
X-Gm-Gg: AY/fxX67VhCA1/Qu4jnjfELU3PKj1kKcMMxxVMHgyOqSW1NbjsVFzz43nLu29Nt5gTY
	9OeEE5IS2T+2Ct5iIUe+8bVofyWeQYvJk3ZVN/jxqYwnT6WPTsrC3TLvD2UXNii+sQd+6HaI1bC
	M57xGSwE1yKMEi2XnmBn3ubGMwJGyyAKug4SyTz6HcDqWiVWNN7udptJc8iB1RmV+FzFAp9aMhu
	R/l12g9UaGimjBZhqRmLIKRY071FEsGDxoomfzwGPMOf+GkufZi427+gmOiNdBzRx0NEJk3jqxv
	rWMIEZ54U3O8vAH2tKOCl/OgQU7gRg6QRGybkCfGaTBo4OIAltRfP1Yy96WUJVDxxLjGngqSP/a
	sG+dIgc80T1zRswKg++OHxnApzUA2Qw==
X-Received: by 2002:a05:600c:6610:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-47ee48271b8mr47954225e9.28.1768469583319;
        Thu, 15 Jan 2026 01:33:03 -0800 (PST)
X-Received: by 2002:a05:600c:6610:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-47ee48271b8mr47953965e9.28.1768469582848;
        Thu, 15 Jan 2026 01:33:02 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee97b2bebsm19745355e9.18.2026.01.15.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:33:02 -0800 (PST)
Date: Thu, 15 Jan 2026 04:32:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 00/23] mm: balloon infrastructure cleanups
Message-ID: <20260115043240-mutt-send-email-mst@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115092015.3928975-1-david@kernel.org>

On Thu, Jan 15, 2026 at 10:19:50AM +0100, David Hildenbrand (Red Hat) wrote:
> I started with wanting to remove the dependency of the balloon
> infrastructure on the page lock, but ended up performing various other
> cleanups, some of which I had on my todo list for years.
> 
> This series heavily cleans up and simplifies our balloon infrastructure,
> including our balloon page migration functionality.
> 
> With this series, we no longer make use of the page lock for PageOffline
> pages as part of the balloon infrastructure (preparing for memdescs
> where PageOffline pages won't have any such lock), and simplifies
> migration handling such that refcounting can more easily be adjusted
> later (long-term focus is for PageOffline pages to not have a refcount
> either).
> 
> Plenty of related cleanups.
> 
> Heavily compile-tested and heavily runtime-tested with virtio-balloon.
> PPC CMM and the VMware balloon are untested and I'd appreciate a helping
> hand from people that have suitable environments.
> 
> Not CCing maintainers for the vmscan.c and migrate.c change as they
> are rather trivial and I don't want to patchbomb them.

besides MAINTAINERS thing:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> --
> 
> This is based on mm/mm-unstable.
> 
> v1 -> v2:
> * Rebased to latest mm/mm-unstable without any conflicts
> * Minor patch description/subject and comment fixups
> * Retested
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: "Eugenio Pérez" <eperezma@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> 
> David Hildenbrand (Red Hat) (23):
>   vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
>   vmw_balloon: remove vmballoon_compaction_init()
>   powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
>   mm/balloon_compaction: centralize basic page migration handling
>   mm/balloon_compaction: centralize adjust_managed_page_count() handling
>   vmw_balloon: stop using the balloon_dev_info lock
>   mm/balloon_compaction: use a device-independent balloon (list) lock
>   mm/balloon_compaction: remove dependency on page lock
>   mm/balloon_compaction: make balloon_mops static
>   mm/balloon_compaction: drop fs.h include from balloon_compaction.h
>   drivers/virtio/virtio_balloon: stop using balloon_page_push/pop()
>   mm/balloon_compaction: remove balloon_page_push/pop()
>   mm/balloon_compaction: fold balloon_mapping_gfp_mask() into
>     balloon_page_alloc()
>   mm/balloon_compaction: move internal helpers to balloon_compaction.c
>   mm/balloon_compaction: assert that the balloon_pages_lock is held
>   mm/balloon_compaction: mark remaining functions for having proper
>     kerneldoc
>   mm/balloon_compaction: remove "extern" from functions
>   mm/vmscan: drop inclusion of balloon_compaction.h
>   mm: rename balloon_compaction.(c|h) to balloon.(c|h)
>   mm/kconfig: make BALLOON_COMPACTION depend on MIGRATION
>   mm: rename CONFIG_BALLOON_COMPACTION to CONFIG_BALLOON_MIGRATION
>   mm: rename CONFIG_MEMORY_BALLOON -> CONFIG_BALLOON
>   MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT
>     - BALLOON"
> 
>  .../admin-guide/mm/memory-hotplug.rst         |   8 +-
>  Documentation/core-api/mm-api.rst             |   2 +-
>  MAINTAINERS                                   |  12 +-
>  arch/powerpc/platforms/pseries/Kconfig        |   2 +-
>  arch/powerpc/platforms/pseries/cmm.c          |  53 +----
>  drivers/misc/Kconfig                          |   2 +-
>  drivers/misc/vmw_balloon.c                    | 105 +++-------
>  drivers/virtio/Kconfig                        |   2 +-
>  drivers/virtio/virtio_balloon.c               |  64 ++----
>  include/linux/balloon.h                       |  77 +++++++
>  include/linux/balloon_compaction.h            | 160 ---------------
>  include/linux/vm_event_item.h                 |   8 +-
>  mm/Kconfig                                    |  23 +--
>  mm/Makefile                                   |   2 +-
>  mm/{balloon_compaction.c => balloon.c}        | 194 +++++++++++++-----
>  mm/memory_hotplug.c                           |   4 +-
>  mm/migrate.c                                  |   2 +-
>  mm/vmscan.c                                   |   1 -
>  mm/vmstat.c                                   |   8 +-
>  19 files changed, 314 insertions(+), 415 deletions(-)
>  create mode 100644 include/linux/balloon.h
>  delete mode 100644 include/linux/balloon_compaction.h
>  rename mm/{balloon_compaction.c => balloon.c} (59%)
> 
> 
> base-commit: f8ed52ac0cfbddff992bb9600941bfe51e1e385a
> -- 
> 2.52.0

