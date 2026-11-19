Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076796;
	b=wtVBa+gFUCrTGKahlidGbd4r58vOKTKMAzUv4sCczcj7i3knO9/hjDShKu1Dih+94Nxb
	 v/nQDqEFPp0B1xmVd2q4e+Hlpe2Omd3NAlIWdu8oZIAjwDrbXnXUM5e6cwOW6eUuOo5sU
	 0D9OgUJ+XXmC+7SLyoerY/EHzUjPeIClSThvcd/fgpA+Otc8eswfqzY0Ck5T0Hp3PWbqq
	 JflgI1x85gfo0piRLfeGXB0YNpkS51b8L+/cDx9jVfAEbnd80hHwpsryE6MappfisNhwj
	 Q9oKTHX/XeuHZ9cVIDMc9SqRawp1cYbNaX2G7/CUebKKoLQ2GpBOUV3Is0V8mNso8pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076796;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=jSCtwnWUqF8YnYGIgXEXWun4ZyiCBhUzU9yeZz4svZQ=;
	b=Jnp9GN1zUqILLx6170PwNuC616U9lbuzW8qAyUV26P+qrhmfF/+HuLR/EMebCuDEZGyy
	 i+hGQGGajuZc1HKINNRcxVSIZU+2AcXMxgS2kUrze288gSIUHLFJLD0O0jwzgwbvhj1jA
	 1AK+8dkQ5Wl4hNjh1PI+oYuXNXFilPB15+Jdg+rtv9Ul4ijsMuRPVKBJjH9+S/VCibJmU
	 jAgrmK8fAAvoHsNY5KJOgOyMbkulkRJDPbbpIXMFxqJWv5De2i3FV3NH7V4sJuEa+40/L
	 o50qA4bCe0W9eduSUQ2Wq/S9hJR4VpuBvMCz5vmPcSLt514rxRNYfdhoWTzqT1CB4Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmEtFyZi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59B60A261B;
	Thu, 19 Nov 2026 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmEtFyZi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBE51F000C6;
	Thu, 19 Nov 2026 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076796;
	bh=jSCtwnWUqF8YnYGIgXEXWun4ZyiCBhUzU9yeZz4svZQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nmEtFyZiww1LJNKlUpo4ZjlAKUT7UsDEi3xnuE7TENc3M5NLKwSnx/kV9xNf2uKsg
	 JeAcPslwklvyugoXMQxbyHqifsGyAPtdOTHWrUS2PNNzoXMZ7pm6iX8UzczXiaRKcc
	 7tHa2qgTya3FigLBDL/BEeGoVsfhH0ceSXyBU09bGs1M198jn1Apg2Ir40RkzY2vSL
	 IMT9EgkHOaBOdbUWOytTAqNWyserWZwE+VVswtUfYCe6Y80VcnCn4QEfQwpA2MNK2a
	 3gWjbg07bIYFNnx7wcVacHuX2C/kx3dKp7fasreNjzfc67XRyHR+xj4VxBivad1BR/
	 E/mGJ0+/t2qDQ==
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] kho: do not expose incoming sub-blob contents
 in debugfs
From: Mike Rapoport <rppt@kernel.org>
To: Long Wei <longwei27@huawei.com>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 akpm@linux-foundation.org, graf@amazon.com, leitao@debian.org, 
 corbet@lwn.net, rdunlap@infradead.org, linux-mm@kvack.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20261119063800.698863-2-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261119063800.698863-1-longwei27@huawei.com>
 <20261119063800.698863-2-longwei27@huawei.com>
Date: Thu, 19 Nov 2026 10:26:26 +0200
Message-Id: <179507678647.425130.8287708904179232007.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

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
> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
> Signed-off-by: Long Wei <longwei27@huawei.com>

The change is fine, but the Fixes: tag should name the commit that
made the use-after-free reachable.

c609c144b0e8 ("kexec: add KHO parsing support") added in/sub_fdts, but
only memblock consumed an incoming sub-tree back then, and it never
freed it. Preserved pages that nobody restores stay reserved, so the
debugfs blobs pointed at valid memory. The same was true for test_kho
and for LUO while it kept luo_global.fdt_in.

The page is first freed early in boot by d376e4b55c9a0 ("liveupdate:
centralize state management into struct luo_ser"). That commit added
kho_restore_free(luo_ser) to luo_early_startup(), and it is the path
in the changelog and the KASAN report. It went into v7.2-rc1.

Pasha asked for c609c144b0e8 in v1 because in/sub_fdts never owned
those pages. That is a fair point about the design, but with that tag
stable will try to backport the patch to every tree since v6.16. There
is no bug in those trees, and the code there lives in
kernel/kexec_handover.c, so the patch won't apply. I'd use

  Fixes: d376e4b55c9a0 ("liveupdate: centralize state management into struct luo_ser")

and say in the changelog that in/sub_fdts has exposed memory KHO does not
own since c609c144b0e8.

-- 
Sincerely yours,
Mike.

