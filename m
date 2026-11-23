Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451307;
	b=2ey0e3b69x6+pxg98NOzff/KJcvQpLzl/lGnc49jWfyRZORL5ESmNonF7KIdgiVVzBtJ
	 lDwalZMror7yI5WveZF3n299ga8+4NEuhhEl47Uc+TfXXoz/k5VoMQA0aUYyNBkP0/+fU
	 yqxXY6wfmCmCkMFPD4S2snEw/+EMfQLRJDeCniAjBdHDSXemfNQGkJ1iqUPkc6HStYexR
	 eGzbEzVFqQpsFvwWHW4Jmu10Jc9vnDGEbkwpovuSygXV5gAWE5Flhi0jWbzD8BX80ILiy
	 S7PFSkL8QOsLRD8hakpDxkAd8VpcGBZx4ODU1LEeBdnb2vBRK6DV75beoCDnQi3G+8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451307;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HoffiGSe9lw4TF78z8YL8hpSMNdnj0ja/nyeeNcyrXk=;
	b=BbnzrqvB3ySa8cNteeUvbWCZzN25aW9ozGDU+PLn+3P+SExCsWjOK6fa51kxxiUSU7TH
	 7VHYijRUPn2kFDMKiWWbDI8SzXLTeDUFS62efHEv4edvE8cn5Eelh3SH5Q2LOATGeASHG
	 MlDICimTn0G9m8WU4PDCT7PGIpNiUNEJDadnEs9dAsYQXP2cmukyDahWyiqJMBIofLMGr
	 HVH4Swwjb9yxWioyWYS9A+64WRuODaQNOPpKVLImXeWuiyIYbIQywGAc9AFgG586iPE9U
	 oHAAPAi725ycBYIKrNp/C1wfrb91HGQKxwCMOCyy++5T7ih5hkFrLolkIFrQzpzkMHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eCqd/aEU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DFD606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCqd/aEU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC671F000C6;
	Mon, 23 Nov 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451307;
	bh=HoffiGSe9lw4TF78z8YL8hpSMNdnj0ja/nyeeNcyrXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eCqd/aEUFhcobkHvIRtslNYaDGlGNpaRXJC8alAL83lgKuviAeuU6mdUDav93Pgy9
	 8VxMUIjUigeixYM5oHGcipMNKKyAnLHLBRF0M8X2FZL+yd6mEMvwsvhcG6Q77MOb/W
	 /C6GhffmiD/GB8EILT+jsP7PY/U7eXGiL7153iHCwCGNoLriv5QdnAX6jNlYb+QUda
	 x/j4wWLxjhYqUjTIcXxQh5EP4E8jgrRney/i8h4DhayasETzlK5VyJOdMZHXtXqpZ5
	 ulFM1trBjMGmlrF/sKyKSYrc3m9t9ga5qzUNDoY9tO5mhol8107rllA42p1i/GmryX
	 n/eAjsBpPfIog==
Message-ID: <377c4f51-8c52-44e8-a282-097f3b6905b9@kernel.org>
Date: Mon, 23 Nov 2026 17:28:20 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/rmap: correct VMA write lock position in lock
 ordering
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Rik van Riel
 <riel@surriel.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 17:10, Lorenzo Stoakes (ARM) wrote:
> The list at the top of mm/rmap.c is taken to be the canonical order in
> which locks must be taken in mm to avoid lock inversion.
> 
> However, VMA write locks appear to be misplaced. These were added there by
> commit 55fd6fccad31 ("mm/khugepaged: write-lock VMA while collapsing a huge
> page"), which was focused on expressing the dependency of locks after VMA
> locks in the ordering on them, disregarding those prior to it.
> 
> Of course, a VMA write lock requires an mmap write lock to be held, so this
> leaves three locks to consider:
> 
> mapping->invalidate_lock (in filemap_fault)
> folio_lock
> hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
> 
> Each of these locks is either downstream of a VMA, or is not able to
> acquire a VMA lock at all (e.g. in an rmap operation).
> 
> This is because accessing a VMA's file (thus mapping), traversing page
> tables to a folio, or interacting with hugetlbfs requires the VMA to be
> stabilised in the first instance.
> 
> Nothing in the kernel takes any of these 3 locks before a VMA lock, and
> indeed in each case that a VMA lock is taken it is taken before - so the
> kernel is already violating the ordering as-written.
> 
> So fix it. Also add [_killable] to reflect the existence of
> vma_start_write_killable().
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> v2:
> * Updated docs to reflect change as per Suren.
> 
> v1:
> https://lore.kernel.org/r/20261121-fix-rmap-lock-ordering-vma-locks-v1-1-952c0dd5bc3a@kernel.org
> ---
>  Documentation/mm/process_addrs.rst | 8 ++++----
>  mm/rmap.c                          | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> index 04b649818cc1..40be3a46a521 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -418,10 +418,10 @@ ordering of locks within memory management code:
>  
>    inode->i_rwsem        (while writing or truncating, not reading or faulting)
>      mm->mmap_lock
> -      mapping->invalidate_lock (in filemap_fault)
> -        folio_lock
> -          hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
> -            vma_start_write
> +      vma_start_write[_killable]
> +        mapping->invalidate_lock (in filemap_fault)
> +          folio_lock
> +            hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
>                mapping->i_mmap_rwsem
>                  anon_vma->rwsem
>                    mm->page_table_lock or pte_lock
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 65646ed6fc45..55367e7d3eec 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -22,10 +22,10 @@
>   *
>   * inode->i_rwsem	(while writing or truncating, not reading or faulting)
>   *   mm->mmap_lock
> - *     mapping->invalidate_lock (in filemap_fault)
> - *       folio_lock
> - *         hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
> - *           vma_start_write
> + *     vma_start_write[_killable]
> + *       mapping->invalidate_lock (in filemap_fault)
> + *         folio_lock
> + *           hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
>   *             mapping->i_mmap_rwsem
>   *               anon_vma->rwsem
>   *                 mm->page_table_lock or pte_lock
> 

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Queuing this in a sec ...

-- 
Cheers,

David
