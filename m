Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F606FC5;
	Mon, 29 Jun 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727032; cv=none; b=V3hykvwOImB9rqMdJcpaC0gdU7RvRYfdNd6/MX5HR+cFHBJ/tZH8MuFshW/WzxrtaocU4lwKRLXr/h3/YAMaG6rJ8nyg+hWZ6UJn2xrQPZk+pW3pqrmzlm3DtpCElXDPY5VzrnsJfB3OTgH11wjTiEE8qoQM3/o3D5vv9eOXw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727032; c=relaxed/simple;
	bh=h3dGPeNyWz87aKbrKL4WVNyxPqRVI62wkt7zeY5sBKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYiQ2eGYJIJkisvD00PyVX88QmE4tOEDld3E7yQbmPx/+ybiFG8B6CPow0J6vDCt+mVh0LgQltv3HQt1j0FEyxQc6PZ68TIr/4mokQCjdQG5MSnwwHAulItgwJPgN/QRjsIYc9p7w7y/ZcDVSfdpMmVaIStUMKiN9tTouAVYtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kk26YqZk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kk26YqZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070E21F000E9;
	Mon, 29 Jun 2026 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727031;
	bh=Hm7uAuXqV83pH1WcLn0gFqC/C3n5BbfPtcxR9BhAvpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kk26YqZkaOzOyHBGvLH2I3k6ZIgsbpejLMKNX1uggbfg00ql+m6ITE5AivlZeIlUe
	 NoYLSoPHX5QnQarNtjvJggAs5ObhB2Ng6sA1FEaj2KYxKS25lGWJDYl8tS5JL+0/LP
	 T657DnAFLnzIEO4DWrYaylDmo7kCY0tWBecCf602uDcy1fstdla7kdT48LvT+OfVth
	 4S2gFKF1BuX7kCGMgoXI1Gh5x2kbURdgGraclZaKVuHTRkPMQeH+WYdlWKOv6oAqKV
	 xDsXNaRkCnpLZyllAbvyiZq/eSxywnXfXPczSic7bQEgQhxPMn1qTOi77AqfY+q3rt
	 E0Z79BLC+0a3A==
Date: Mon, 29 Jun 2026 10:57:02 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"open list:HMM - Heterogeneous Memory Management" <linux-mm@kvack.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs/mm: Fix brackets
Message-ID: <akJBDwtGX241WHxo@lucifer>
References: <20260627093258.31265-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627093258.31265-2-manuelebner@mailbox.org>

On Sat, Jun 27, 2026 at 11:32:59AM +0200, Manuel Ebner wrote:
> Remove unnecessary ')' and missing '('.

As per David this isn't correct :)

   "Correct typos in mm documentation by balancing parentheses"

?

<newline>

> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Thanks for fixing this!

With the commit message corrected, feel free to add:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  Documentation/mm/hmm.rst           | 4 ++--
>  Documentation/mm/process_addrs.rst | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> index 7d61b7a8b65b..54c461e7a143 100644
> --- a/Documentation/mm/hmm.rst
> +++ b/Documentation/mm/hmm.rst
> @@ -191,7 +191,7 @@ like a CPU page fault. The usage pattern is::
>        mmap_read_unlock(mm);
>
>        take_lock(driver->update);
> -      if (mmu_interval_read_retry(&ni, range.notifier_seq) {
> +      if (mmu_interval_read_retry(&ni, range.notifier_seq)) {
>            release_lock(driver->update);
>            goto again;
>        }
> @@ -316,7 +316,7 @@ between device driver specific code and shared common code:
>     system memory and device private memory.
>
>     One of the first steps migrate_vma_setup() does is to invalidate other
> -   device's MMUs with the ``mmu_notifier_invalidate_range_start(()`` and
> +   device's MMUs with the ``mmu_notifier_invalidate_range_start()`` and
>     ``mmu_notifier_invalidate_range_end()`` calls around the page table
>     walks to fill in the ``args->src`` array with PFNs to be migrated.
>     The ``invalidate_range_start()`` callback is passed a
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> index 851680ead45f..b391502fbfd6 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -724,7 +724,7 @@ the zap and the invocation of :c:func:`!free_pgtables`.
>
>  Since it is assumed that all such steps have been taken, page table entries are
>  cleared without page table locks (in the :c:func:`!pgd_clear`, :c:func:`!p4d_clear`,
> -:c:func:`!pud_clear`, and :c:func:`!pmd_clear` functions.
> +:c:func:`!pud_clear`, and :c:func:`!pmd_clear` functions).
>
>  .. note:: It is possible for leaf page tables to be torn down independent of
>            the page tables above it as is done by
> --
> 2.54.0
>

Cheers, Lorenzo
