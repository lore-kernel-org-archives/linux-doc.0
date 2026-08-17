Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0C40A944;
	Mon, 17 Aug 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966726; cv=none; b=duuzJ8C51SbSpHjyj/wJgD8AdRkGXRib8Ybpjc9TrcFxjibqbttmAJkSnJ6DHBHgfHqhuaxFdfNevSE/vKNS+6EePGKc+n2xFqIwaMYAWSCKaF9vdNwO35CFYPo/U+SWE8wYqN4wc6qLnBuyMJaHwzgEjEavygq728ZEvyognMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966726; c=relaxed/simple;
	bh=U6BBy2/b5aoKeWQOeV7/KGt+NryFfDAsGjg0Q0NO8D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auH/ttTm2GLSE/0Z8DDdnhtdKCpulJOmEHkU8gRe30iQ+aZGf+6M24geAbwjFT/y/DFCSgRshAfKDZ0lBRAS40yCvm1swgAeQFb70kecDuPsjmVnysEQVmKBtfdSjhDvt+fxgTvcYUWhiE4YDO2GZ3f93eg34mHagbmei43RWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amvVG5ic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amvVG5ic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A01F00A3A;
	Mon, 17 Aug 2026 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786966725;
	bh=Kz5p/H0TIZKomsHJng/nr5w+ftLpRUyUqVulCAYcvP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=amvVG5icoRLGLTkN+kl08tXSEf0mSAQIWZx5Cm6O/l274LtGPX2bSEA+FNnog0COq
	 85aHOeYtR2MhelU0R3OlN1lJkvEZohbaVkUwTchFvrkqTwaR1sQQtXIkfoBQtdgKOO
	 LPP2wu7WyuUNOM7ZEcOZS6Vnfl6qmAu/aBIcHwb3HyRXR22N9ihRrMkm9B7H9hq/1v
	 HOUVxTSFbLNBLClRy5kIRFZUMWVA8004T5pkZM/bWFfzbCExMvCdTvs2qiWcg3GTxM
	 afb7lWV54TiyPsCApKQyB01yxNgzjJzlBaKU8w5KRcvMJcd+mNuvOb+7KgnLWDzIiC
	 syq+PN1giBaOQ==
Date: Mon, 17 Aug 2026 12:38:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 6/7] mm/khugepaged: unmap pte before releasing vma
 write lock
Message-ID: <aoLyqr_LZ42Kv6GM@lucifer>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>

On Tue, Aug 11, 2026 at 06:48:38AM -0600, Nico Pache (Red Hat) wrote:
> We are currently dropping the anon_vma write lock before unmapping the
> PTE. Although this is safe, due to us still holding the mmap_write_lock,
> its safer and less confusing to switch the order of these two operations.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/khugepaged.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b7372aba4417..0ba637df9c48 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1546,10 +1546,10 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
>
>  	result = SCAN_SUCCEED;
>  out_up_write:
> -	if (anon_vma_locked)
> -		anon_vma_unlock_write(vma->anon_vma);
>  	if (pte)
>  		pte_unmap(pte);
> +	if (anon_vma_locked)
> +		anon_vma_unlock_write(vma->anon_vma);
>  	mmap_write_unlock(mm);
>  out_nolock:
>  	if (folio)
>
> --
> 2.55.0
>

--
Cheers, Lorenzo
