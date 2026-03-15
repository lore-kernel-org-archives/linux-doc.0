Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2025DB12
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605691; cv=none; b=WpBrpOJgwNmy93hnAGmJlSDI7WNqmhmKIRGiCJNosb0NlSPqBIwam8TSCDHcl3Mxz130VseYPj/4UWFFIsZByZNDtmC/T43y5Hh2xZ0ikkVXYg8MfWI7VbB4dZtagpKZUbd/mntBYoOZ0E09kJk2/E4QEu00b+OpY4CyZ99zH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605691; c=relaxed/simple;
	bh=En2f87SpGqjeJA4L0F4oQmvXFvfIr6vn4EdyN9IaDsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxYtpqJ/n264+YH1eInE3DH+0sIBkzraMrwi2jYBNg2XHV+Y43nQY8STi2H8heV8hN92NfgX1Y0rgF4mNeh8C1C0MXk76mGehg4soTPHD0YGQM5hfTgwzZ8MJwri1ThFpca6Vm6npe51dJXOD/051xZjUeQKRwrLVsbOVRuoo1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3013EKT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3013EKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6421CC4CEF7;
	Sun, 15 Mar 2026 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773605691;
	bh=En2f87SpGqjeJA4L0F4oQmvXFvfIr6vn4EdyN9IaDsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3013EKTOM7JcoeF7FMTckvn3M85WdJsQnjVGSf129kiqON3uXwiHqCBMfefBllRW
	 Tm28Gx7J+Y3HVV1QVxqcTkU63UfxPOIFW+3IfuF+80vffHYzmloHVxKVFKlq2AH5pm
	 6o7PTERr8eig384l5701Pc4YEDHrm10zmC5sG9o9t6/xlC2rwIlzuI9tBvX3ieLrw/
	 ipVRU9yxyxW0GhPxYwnbhLYs7JVXS1tWtmrFuYwmba6EH1ARQjX8Abob9SjpyTyef0
	 tsqXLWs1FEpuVq+Tt9GeQn1xLf/uqT6Cr6FMTzDWlPl5tt0KPnwhtyKEUFEdO+Of8+
	 xB9bC5k3GjEww==
Date: Sun, 15 Mar 2026 20:14:47 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
Message-ID: <5a1581a3-c6da-4604-9c17-e9fdfaace94c@lucifer.local>
References: <20260314152538.100593-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314152538.100593-1-xaum.io@gmail.com>

NAK.

The degree of laziness here is really telling, so yet again I'm sorry I don't
believe you've put much effort into this.

You've not bothered cc'ing the right people, you didn't bother with anythign
other than a cookie-cutter commit message, there's a bunch of issues with the
docs even at a cursary glance.

On Sat, Mar 14, 2026 at 04:25:38PM +0100, Kit Dallege wrote:
> Fill in the shmfs.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.

>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>

NAK.

> ---
>  Documentation/mm/shmfs.rst | 114 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>
> diff --git a/Documentation/mm/shmfs.rst b/Documentation/mm/shmfs.rst
> index 8b01ebb4c30e..1dadf9b481ce 100644
> --- a/Documentation/mm/shmfs.rst
> +++ b/Documentation/mm/shmfs.rst
> @@ -3,3 +3,117 @@
>  ========================
>  Shared Memory Filesystem
>  ========================
> +
> +The shared memory filesystem (tmpfs, also known as shmem) provides an
> +in-memory filesystem used for ``/tmp`` mounts, POSIX shared memory
> +(``shm_open()``), System V shared memory, and anonymous shared mappings
> +created with ``mmap(MAP_SHARED | MAP_ANONYMOUS)``.  The implementation is
> +in ``mm/shmem.c``.

This is already wrong.

> +
> +.. contents:: :local:
> +
> +How It Works
> +============
> +
> +tmpfs stores file contents in the page cache using swap as its backing
> +store rather than a disk filesystem.  Pages are allocated on demand when
> +written to or faulted in.  When the system is under memory pressure, tmpfs
> +pages can be swapped out just like anonymous pages.

What is a 'backing store' what is a 'disk filesystem', 'written to or faulted
in' is wrong, etc.

I won't go on.

This would become 'development by review' and you'd take up HOURS of our time
while we do the actual work.

This isn't how contributions are supposed to work.

> +
> +This design means tmpfs files consume no disk space — their size is bounded
> +only by available memory and swap.  It also means tmpfs data does not
> +survive a reboot, making it suitable for scratch data that benefits from
> +memory-speed access without needing durability.
> +
> +Each tmpfs inode tracks two key counters: allocated pages (resident in
> +memory) and swapped pages (evicted to swap).  These are maintained by
> +the ``shmem_charge()`` and ``shmem_uncharge()`` accounting functions,
> +which keep the inode's block usage consistent with the filesystem's mount
> +limits.
> +
> +Page Cache Integration
> +======================
> +
> +tmpfs uses the kernel's page cache (xarray) to index its pages by file
> +offset.  When a page is read or faulted in, the page cache is checked
> +first.  If the page has been swapped out, a swap entry is found in its
> +place, and the page is swapped back in transparently.
> +
> +When a page is added to the cache for a tmpfs file, it replaces any
> +existing swap entry at that offset.  When a page is evicted by reclaim,
> +a swap entry takes its place.  Shadow entries (see
> +Documentation/mm/page_reclaim.rst) may also be stored to support working
> +set detection.
> +
> +Swap Integration
> +================
> +
> +Under memory pressure, the reclaim path can evict tmpfs pages to swap just
> +like anonymous pages.  This is transparent to the filesystem — the page
> +cache slot simply transitions from holding a folio to holding a swap entry.
> +
> +When a process accesses a swapped-out tmpfs page, the page fault handler
> +reads the swap entry from the page cache, allocates a new page, reads the
> +data from swap, and inserts the page back into the cache.  This swap-in
> +path is specific to shmem and handles locking between concurrent faults
> +on the same page.
> +
> +Huge Page Support
> +=================
> +
> +tmpfs can allocate transparent huge pages for its files.  The ``huge=``
> +mount option controls the policy:
> +
> +- ``never``: only base pages (default).
> +- ``always``: attempt huge page allocation for every new page.
> +- ``within_size``: use huge pages only within the file's current size.
> +- ``advise``: use huge pages only for mappings with ``MADV_HUGEPAGE``.
> +
> +When a huge page is allocated but only partially used (e.g., a file is
> +smaller than a huge page), memory is wasted.  To mitigate this, tmpfs
> +registers a shrinker that identifies huge pages where the file has been
> +truncated or punched below the huge page boundary, and splits them back
> +into base pages so the unused portion can be reclaimed.
> +
> +Accounting and Limits
> +=====================
> +
> +Mount Options
> +-------------
> +
> +tmpfs mounts accept ``size=`` and ``nr_inodes=`` options that cap the
> +total blocks and inodes in the filesystem.  Every page allocation is
> +checked against the block limit; if the limit would be exceeded, the
> +allocation fails with ``ENOSPC``.
> +
> +These limits are enforced in-kernel and apply to all users of the
> +filesystem.  They can be changed at remount time.
> +
> +Quota Support
> +-------------
> +
> +With ``CONFIG_TMPFS_QUOTA``, tmpfs supports user and group quotas.  Each
> +allocated block is charged to the owning user/group, and allocations fail
> +if the quota is exceeded.  Quota state is stored in memory and does not
> +persist across mounts.
> +
> +Memory Cgroups
> +--------------
> +
> +tmpfs pages are charged to the memory cgroup of the process that
> +instantiates them.  This means tmpfs memory counts toward cgroup limits
> +and can trigger cgroup-level reclaim.  Swapping a tmpfs page out and back
> +in preserves its cgroup association.
> +
> +fallocate
> +=========
> +
> +tmpfs supports ``fallocate()`` to preallocate space for a file.
> +Preallocated pages are allocated and inserted into the page cache
> +immediately, guaranteeing that subsequent writes will not fail with
> +``ENOSPC``.
> +
> +``FALLOC_FL_PUNCH_HOLE`` is also supported: it removes pages from a range
> +of the file and returns them to the filesystem's free pool.  This is used
> +by applications that want to release portions of a tmpfs file without
> +truncating it.
> --
> 2.53.0
>
>
>
