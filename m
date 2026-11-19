Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080816;
	b=bDLBlOJw75svztILKm3RvTpm4e9Ew3Wrkaj/al+2iUU0M6/HCtpJlTi2okh5vM7OVZrV
	 wR+jGlWFPSZxFPgMPOiJG3e9V6bIGJBqhp8d/GnJf6hEStK7MghV3RNGgCTp5SFLIPN49
	 s0nxhNPmVZbx0RmBYEnmfL2jf0VNy82gQJ2ST4HInsEKU35zPdWaesc+h128H6gteCfv7
	 ehFA2zmMiu7v4unh7Ul3KYkNyFECHhdPe5VixD/6bnmatp+WR8RFe06FroqFvi0m/4rET
	 fLbanWfYtzqJJEIrm5LcIug2eEKhYvFcaqyRJrjtcG255TQkET6A8ldayP8jKzVyiVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080816;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zs8KmS6M0tc9kdI4/Q5qCxRWf3GKyv2JX51WYmX/Mp4=;
	b=yE/00pzIqTTE4hVvL4WuwWbXlaG3k3n9Ch2KEKTU4nepjsCzbwvisOnamxWx/F+Ox1p3
	 qx+XNjoG2aWIv6MBV1m3Qxe10/qUI0t55YGas+vFONR2HaL70S8T3baUcn4fm1AwimpZE
	 DPxXJgNUiZTpoWdYrFVvY3v42X1Hf8isrfe3AkTLkLirWD6Oe76sIhdP1CXnfp514ZOsJ
	 Y0xhjFRve+jKlv2NmBHunQIchrxydm7NFJlbd7Z8sUB3IM0qQTYMwvBcrn1WH1TfaKEiW
	 mAm+dXUxWQ8a5jZz5VjxFxEbLR/ZoYZaoygaY+A7kklgoLfK6VUrB1pNwMNsOhaBiBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngrIqHBj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB0606A320;
	Thu, 19 Nov 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngrIqHBj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51011F000C9;
	Thu, 19 Nov 2026 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080816;
	bh=zs8KmS6M0tc9kdI4/Q5qCxRWf3GKyv2JX51WYmX/Mp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ngrIqHBjgVYdx/F+VW2lBwdufHaaLpZ49uNS+5QElhcbhKI7WUfcXO5XcpWxdaZer
	 5I12Pj2zNHxyR7JKGqjEageIt60T85FtPYb3L9n8ToxBAgovwz/E5D96mwlOhhniuu
	 OG/U8Ui1vqEh3B5gxHtEQCACMhuUCYlBkRdaipBu3WNcz7svfU/221+kSCtmSYiDDL
	 gryUxrqGnwNwCjVPBAuiCKfrgkVk7mEsXDY4Qa1F086QTGLabM4C+Y8OL6/Vn2nuTA
	 75gwcgYKo4KXq6XplCTi9qW9uo63hudHLggJNcjcaJKqIirxi4XXXGk0X74An23PVO
	 KK5RxRkZQqGUg==
Date: Thu, 19 Nov 2026 09:33:28 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH] Docs/mm: fix stale split page table lock references
Message-ID: <av7CVzXLButoMsSi@gremlin>
References: <32FBD023F945BCCE+20261119074854.252609-1-zhaozhengzhuo@uniontech.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32FBD023F945BCCE+20261119074854.252609-1-zhaozhengzhuo@uniontech.com>

On Thu, Nov 19, 2026 at 03:48:53PM +0800, zhaozhengzhuo wrote:
> The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
> into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
> Documentation/mm files still refer to the old names.
>
> Update both references.
>
> Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
> Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>

Seems reasonable, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  Documentation/mm/process_addrs.rst         | 2 +-
>  Documentation/mm/split_page_table_lock.rst | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> index 04b649818cc1..0b6355e6d1d5 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -659,7 +659,7 @@ acquired in :c:func:`!__p4d_alloc`, :c:func:`!__pud_alloc` and
>     references the :c:member:`!mm->page_table_lock`.
>
>  Allocating a PTE will either use the :c:member:`!mm->page_table_lock` or, if
> -:c:macro:`!USE_SPLIT_PMD_PTLOCKS` is defined, a lock embedded in the PMD
> +:c:macro:`!CONFIG_SPLIT_PMD_PTLOCKS` is enabled, a lock embedded in the PMD
>  physical page metadata in the form of a :c:struct:`!struct ptdesc`, acquired by
>  :c:func:`!pmd_ptdesc` called from :c:func:`!pmd_lock` and ultimately
>  :c:func:`!__pte_alloc`.
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index cc3cd46abd1b..ce7908bebce9 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -37,9 +37,11 @@ There are helpers to lock/unlock a table and other accessor functions:
>   - pmd_lockptr()
>  	returns pointer to PMD table lock;
>
> -Split page table lock for PTE tables is enabled compile-time if
> -CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
> -If split lock is disabled, all tables are guarded by mm->page_table_lock.
> +Split page table lock for PTE tables is enabled at compile time when
> +CONFIG_SPLIT_PTE_PTLOCKS is enabled.  This option requires CONFIG_MMU and
> +CONFIG_SMP, with CONFIG_NR_CPUS set to at least 4 (see mm/Kconfig for
> +architecture-specific restrictions).  If split lock is disabled, all
> +tables are guarded by mm->page_table_lock.
>
>  Split page table lock for PMD tables is enabled, if it's enabled for PTE
>  tables and the architecture supports it (see below).
> --
> 2.50.1
>

--
Cheers, Lorenzo
