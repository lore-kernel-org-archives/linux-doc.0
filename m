Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4E224D6;
	Sat, 27 Jun 2026 18:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782583546; cv=none; b=alx5j6hXqr2aHQucBIdR27hNUEg03YYl8aVqSUFLnTl51xlt88FCrCJNijg1u+FhT+ayrDzVRFCuZIwiLMSgTq8EnkQdKHB4/kAiSA2x/rO66j5dKEBeVYsS6Xx9R8AQas6aQ9Qt7sGuw3BLXrCTVH7/daOYbLT/0Pf4lOLtUdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782583546; c=relaxed/simple;
	bh=pTqX7+M4GXyRhqSfiMqvAZ7aWvXHWvkQa/Z0wLMrG+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ou8+GzcHJcvk16X+tr9sIFiQgIC+DKj5UcAg88goFY2yJcz+0Vh7DqGkf/EuojVssszIOBNkw1IRobDwA89fYqD/Ocbr/42UWUpWu0P5+dSXl2ne2J/5p4RyRVbTo7ID+GqcVCJ+k5X5u5ihGT+SEc9aeIKXYz+hg+t6JECHg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sM0/6iFI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sM0/6iFI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=2uYEpyqVz1KpeR16cAXx1a1Cm6iq2umu7tBDggjjrWQ=; b=sM0/6iFIF2eh297kaZ/SR2rwnx
	jjLQF+pSNgETkG/t953bmsrRGYVBaviNKgOe5mWb476nr/Qu+cmyPK4CFeKhKrBjiop/8qFTDXGgt
	4KEYGruHNehNtHcaPFNVDtpAnd6BGqYt4ifHspkkieaveDXjL1Smd+5qVIn2NZ3yH9/lSs2cZMfPi
	28pJvqcYU7bTDc3agqD/pr1PuV1mxJOFGJA3xpa6O5EqvKzfytwEM0F6zSWeU54eqm6j3u09tRRAv
	oYsx4D905RWVVJEYnUTYzeCTcJqZDdkAM/u5bP0xcS27XvjfDmWRkc+uBLvXVi1KjmlDpJXhAJB6I
	E7ADlaWA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdXPO-0000000Ch6S-1U1S;
	Sat, 27 Jun 2026 18:05:38 +0000
Message-ID: <3975aa5f-a959-41da-a312-36c1ab67120f@infradead.org>
Date: Sat, 27 Jun 2026 11:05:37 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: Fix brackets
To: Manuel Ebner <manuelebner@mailbox.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shakeel Butt
 <shakeel.butt@linux.dev>,
 "open list:HMM - Heterogeneous Memory Management" <linux-mm@kvack.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260627093258.31265-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260627093258.31265-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/26 2:32 AM, Manuel Ebner wrote:
> Remove unnecessary ')' and missing '('.
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

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

-- 
~Randy
