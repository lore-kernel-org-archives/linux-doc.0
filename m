Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085461;
	b=1iS1xkOA/RNvxHI31ISllMVOD5VQU+MpLhVK2A29ckbdPDGOEYo0CEfTgxXOeF3zPcpv
	 RKPTZtU5+49ucVnSYLGO0BVt8RXe55sa2bmWoYoW3yd3tMi4AQCVZzRa0wtzBavxMYhwD
	 6d9RWiMgez8GI5PFci5ttI44QFy4JwJ+L9oKRUk3RiDjc1EHRTGT/iIJoHzycOI0mi+2j
	 Jqir64LSC7aWyt8jB4CmMTaHVKE17n8ZHP7jJ/vq7HIWg1fKrh1iF3WPm9N9ZhSrBr7DL
	 65hpAlmxysa8kdKimR1/HUvUSu94AWSqOxcB1biLuteYIAF82OH603Ut2YhTeGyHhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085461;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=yfuI/yQuKLje7JCp8sAUMNEURSvgN1RcCGOMjucNHBQ=;
	b=vpyiXDGgez2EVUlJXP30lPUmDhQuzCKdIERm8iZrv+aVYnYIKKmYWcs9SV09tDcmEuQ/
	 iWNcyS2n/ApCDCjYC+ugkLo811gn4mHKAwPieUmU1hGGzrt0n+1Pbrk2Oop6KHjAB2q34
	 WLhPMjqWpEhvlCiyMGfRyrp0/kvmGC4DcJEq7DnXIYeHjqGk8bCW2HbjEoCKDREiTG5T7
	 w/e/E8UP1LyxA+yn6+WAyk9GAnLhW/2cyEhSh8xjq126cSsxEzBUkmyM5drXU/dmDF1Ab
	 SO/iKNWhANPVDUv2nPne6ym/9djlISBhWPGgsWptM5HnXAV8t51PKBED3t0xlKJFg1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahkG59L9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE26606A320;
	Thu, 19 Nov 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahkG59L9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC8C1F000C5;
	Thu, 19 Nov 2026 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795085461;
	bh=yfuI/yQuKLje7JCp8sAUMNEURSvgN1RcCGOMjucNHBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ahkG59L9dcE4oY2xp+HrfLQSf7g8rFpsotvFwG75x/1ZyP/Bh85uerHgyhAly93Om
	 cKdmDBP75o98gpk588HUBuXcp79fJM/peujxMHMVas40lukKb+jfeDn4xit2/bJBSE
	 uzBOtyeEAoXAqZRcgzD75C5z0JpcYs3MbGDNWuu8eLHD14e0+UxgvckXHejIe8RxXW
	 EhEL3GYn9D8TATyT9Fo2j0vR8+sUjJmbkBcpee7DvX8IjR5cli7tXojZbj35AvEuDe
	 6jhNPmjO3eDcDe53iTyFvAyMFjMlMhDMb8G3FVZmjzeJ8Lz7dC5g0blte6gHdrE5LM
	 2kWOkOWV62mRw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Long Wei <longwei27@huawei.com>
Cc: <rppt@kernel.org>,  <pasha.tatashin@soleen.com>,  <pratyush@kernel.org>,
  <akpm@linux-foundation.org>,  <graf@amazon.com>,  <leitao@debian.org>,
  <corbet@lwn.net>,  <rdunlap@infradead.org>,  <linux-mm@kvack.org>,
  <kexec@lists.infradead.org>,  <linux-doc@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <hewenliang4@huawei.com>
Subject: Re: [PATCH v3] kho: do not expose incoming sub-blob contents in
 debugfs
In-Reply-To: <20261119095937.826980-1-longwei27@huawei.com> (Long Wei's
	message of "Thu, 19 Nov 2026 17:59:37 +0800")
References: <20261119095937.826980-1-longwei27@huawei.com>
Date: Thu, 19 Nov 2026 10:50:56 +0000
Message-ID: <2vxzik1t3xin.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 19 2026, Long Wei wrote:

> Incoming sub-blob pages are owned by their consumers and have independent
> lifetimes.  Some consumers, such as LUO, restore and free their state in
> early_initcall, i.e. before kho_init() (fs_initcall) builds the debugfs
> view:
>
>   early_initcall: luo_early_startup()
>                     -> kho_retrieve_subtree("LUO")
>                     -> kho_restore_free(luo_ser)   /* page is freed */
>
>   fs_initcall:    kho_init()
>                     -> kho_in_debugfs_init()
>                          -> phys_to_virt(luo_ser_phys)
>                          -> debugfs_create_blob("LUO", ...)
>
> debugfs therefore ends up pointing at a page that was already handed back
> to the page allocator, and reading the file triggers a use-after-free:
>
>   # cat /sys/kernel/debug/kho/in/sub_fdts/LUO
>   ==================================================================
>   BUG: KASAN: use-after-free in _copy_to_user+0x37/0x60
>   Read of size 32 at addr ffff88810309c000 by task cat/27436
>
>   Call Trace:
>    <TASK>
>    kasan_report+0xb9/0xf0
>    kasan_check_range+0x100/0x1b0
>    _copy_to_user+0x37/0x60
>    simple_read_from_buffer+0x77/0xd0
>    read_file_blob+0x75/0xa0
>    vfs_read+0x12d/0x520
>    ksys_read+0xc3/0x160
>    do_syscall_64+0x97/0x4b0
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
>
>   The buggy address belongs to the physical page:
>   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x1fd
>   pfn:0x10309c
>   flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
>   page_type: f0(buddy)
>   ==================================================================
>
> The page is already in the buddy allocator (page_type: f0(buddy),
> refcount 0), which confirms it was freed before the debugfs view was
> created.
>
> KHO does not own these pages, so it cannot safely expose their contents at
> all.  Drop the in/sub_fdts directory.  The incoming FDT is reserved by KHO
> and remains exposed as in/fdt, where the same metadata is available.
>
> The incoming sub-blob debugfs directory is gone, so remove its description
> from the KHO admin guide as well.
>
> Note that in/sub_fdts has exposed memory KHO does not own since
> commit c609c144b0e8 ("kexec: add KHO parsing support"), but the
> use-after-free only became reachable after commit d376e4b55c9a0
> ("liveupdate: centralize state management into struct luo_ser") which
> added kho_restore_free()
>
> Fixes: d376e4b55c9a0 ("liveupdate: centralize state management into struct luo_ser")
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Long Wei <longwei27@huawei.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
