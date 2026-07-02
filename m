Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BB2243964;
	Thu,  2 Jul 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782966599; cv=none; b=URFDo8rBFG+Y7qIyZI2PhnyM48cmsBqzBYik5ljScbW8u8Fs7lLvxmcc1jsivBaCVabrVq0Enop/KnrEc7njVrVKy19S/qzrlo64rGloNIELkNPTlQ5SBGdbQIcwIF7hYUG592wkEuzTMHzkdopW3NfuWRujIblEnfIFURgFWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782966599; c=relaxed/simple;
	bh=Y9h0JPhXA+HyjARHUiHBjNIEFlUqZBKIAi+lwAhYOLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvDqgm3HD5KOIdXCdrvrvmnwKgGg6CvJWP9fPbkDJgCmyBhO8ffTFKix8zBNDLCW38pYxuBqKDZzqPJllGMdSp8tC5AmUXYRzphq8T0P6pmCy2BKmpuN19zGbBIfY6Vr6wTTWx1+myU+4S+KQhPDoutaEnWpEJqeVHlGMUp3vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GZE661U/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GZE661U/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF0041FCD;
	Wed,  1 Jul 2026 21:29:51 -0700 (PDT)
Received: from [10.163.170.96] (unknown [10.163.170.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9331A3F905;
	Wed,  1 Jul 2026 21:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782966596; bh=Y9h0JPhXA+HyjARHUiHBjNIEFlUqZBKIAi+lwAhYOLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GZE661U/MX7b2kovC45juhjEWE++jycRdLwA71aNsQ9E99DLZOohzsFOIZAly30rt
	 JZvK52KC/yD7wj2/GbNUZBE/Q6V6rjEIyfre3FBh1FXLkKWTYstRxgIp9qmiKEx/48
	 goF5T2oKG69m/i3jdkYVSD5HTFdSYwAm7GOZVOXQ=
Message-ID: <5a8e82f3-ed21-48a8-af3c-36a08fd2b0ec@arm.com>
Date: Thu, 2 Jul 2026 09:59:49 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Hugh Dickins <hughd@google.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <20260610043545.3725735-4-anshuman.khandual@arm.com>
 <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
 <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
 <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
 <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
 <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/06/26 7:06 PM, David Hildenbrand (Arm) wrote:
> On 6/16/26 08:19, Hugh Dickins wrote:
>> On Mon, 15 Jun 2026, David Hildenbrand (Arm) wrote:
>>> On 6/12/26 23:26, Hugh Dickins wrote:
>>>> ...
>>>>
>>>> The page table entry is BUGgily Bad: we want to see what it looks like
>>>> (sometimes, a sequence of bad page map entries may even show up as ASCII).
>>>
>>> But is printing raw page table entries really what we want? I guess to detect
>>> "random corruption" it might help sometimes.
>>
>> Yes, that's what it's for. What we really want is to understand what went
>> wrong: that's too much to ask of a printk, but it can give us a good clue.
>>
>>>
>>> And do we really need information about the full page table walk, or is the last
>>> level good enough?
>>
>> Page table entry and pmd entry are good enough: higher levels got
>> added at some stage, but they are unlikely to be useful here.
> 
> Yes, I added them when we're processing PUD entries we'd also want
> P4D entry + PUD entry.
> 
> This is one approach of having the printing be done mostly
> manually, supporting 32, 64 and 128bit pte_val(). As raised by Ryan,
> using local bufs to store the data to not involve printk.
> 
> 
> I played with printing the byte stream manually, but didn't really like it.
> 
> Gave it a quick test and it seems to do its trick. I have the feeling that
> this can be beautified a bit more.
> 
> 
> From 05af7317b126991a61b0a3d01c2863ce5a578d1b Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Tue, 30 Jun 2026 15:23:02 +0200
> Subject: [PATCH] tmp
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/memory.c | 110 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 87 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index ff338c2abe923..ad39cafe110f9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -519,9 +519,57 @@ static bool is_bad_page_map_ratelimited(void)
>  	return false;
>  }
>  
> +#define PTVAL_STR_MAX	(sizeof(u64) * 4 + 1)
> +
> +static void ptval_bytes_to_str(char *buf, size_t buf_size,
> +		const void *entry, size_t entry_size)
> +{
> +	if (WARN_ON_ONCE(buf_size < entry_size * 2 + 1)) {
> +		snprintf(buf, buf_size, "overflow");
> +		return;
> +	}
> +
> +	switch (entry_size) {
> +	case sizeof(u32):
> +		snprintf(buf, buf_size, "%08x", *(const u32 *)entry);
> +		break;
> +	case sizeof(u64):
> +		snprintf(buf, buf_size, "%016llx",
> +			 (unsigned long long)*(const u64 *)entry);
> +		break;
> +	case sizeof(u64) * 2: {

Could this be made sizeof(u128) instead ? But overall this
approach looks good.
> +		const u64 *val = entry;
> +
> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> +			snprintf(buf, buf_size, "%016llx%016llx",
> +				 (unsigned long long)val[0],
> +				 (unsigned long long)val[1]);
> +		else
> +			snprintf(buf, buf_size, "%016llx%016llx",
> +				 (unsigned long long)val[1],
> +				 (unsigned long long)val[0]);
> +		break;
> +	}
> +	default:
> +		snprintf(buf, buf_size, "unsupported");
> +		break;
> +	}
> +}
> +
> +#define ptval_to_str(buf, val)						\
> +	do {								\
> +		typeof(val) __val = (val);				\
> +									\
> +		ptval_bytes_to_str((buf), sizeof(buf), &__val,		\
> +				   sizeof(__val));			\
> +	} while (0)
> +
>  static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
>  {
> -	unsigned long long pgdv, p4dv, pudv, pmdv;
> +	char pgd_str[PTVAL_STR_MAX];
> +	char p4d_str[PTVAL_STR_MAX];
> +	char pud_str[PTVAL_STR_MAX];
> +	char pmd_str[PTVAL_STR_MAX];
>  	p4d_t p4d, *p4dp;
>  	pud_t pud, *pudp;
>  	pmd_t pmd, *pmdp;
> @@ -532,34 +580,34 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>  	 * see locking requirements for print_bad_page_map().
>  	 */
>  	pgdp = pgd_offset(mm, addr);
> -	pgdv = pgd_val(*pgdp);
> +	ptval_to_str(pgd_str, pgd_val(*pgdp));
>  
>  	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
> -		pr_alert("pgd:%08llx\n", pgdv);
> +		pr_alert("pgd: %s\n", pgd_str);
>  		return;
>  	}
>  
>  	p4dp = p4d_offset(pgdp, addr);
>  	p4d = p4dp_get(p4dp);
> -	p4dv = p4d_val(p4d);
> +	ptval_to_str(p4d_str, p4d_val(p4d));
>  
>  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
> -		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
> +		pr_alert("pgd: %s p4d: %s\n", pgd_str, p4d_str);
>  		return;
>  	}
>  
>  	pudp = pud_offset(p4dp, addr);
>  	pud = pudp_get(pudp);
> -	pudv = pud_val(pud);
> +	ptval_to_str(pud_str, pud_val(pud));
>  
>  	if (!pud_present(pud) || pud_leaf(pud)) {
> -		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
> +		pr_alert("pgd: %s p4d: %s pud: %s\n", pgd_str, p4d_str, pud_str);
>  		return;
>  	}
>  
>  	pmdp = pmd_offset(pudp, addr);
>  	pmd = pmdp_get(pmdp);
> -	pmdv = pmd_val(pmd);
> +	ptval_to_str(pmd_str, pmd_val(pmd));
>  
>  	/*
>  	 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
> @@ -567,8 +615,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>  	 * doing another map would be bad. print_bad_page_map() should
>  	 * already take care of printing the PTE.
>  	 */
> -	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
> -		 p4dv, pudv, pmdv);
> +	pr_alert("pgd: %s p4d: %s pud: %s pmd: %s\n", pgd_str, p4d_str, pud_str,
> +		 pmd_str);
>  }
>  
>  /*
> @@ -584,10 +632,11 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>   * page table lock.
>   */
>  static void print_bad_page_map(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long long entry, struct page *page,
> -		enum pgtable_level level)
> +		unsigned long addr, const void *entry, size_t entry_size,
> +		struct page *page, enum pgtable_level level)
>  {
>  	struct address_space *mapping;
> +	char entry_str[PTVAL_STR_MAX];
>  	pgoff_t index;
>  
>  	if (is_bad_page_map_ratelimited())
> @@ -596,8 +645,9 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>  	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
>  	index = linear_page_index(vma, addr);
>  
> -	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
> -		 pgtable_level_to_str(level), entry);
> +	ptval_bytes_to_str(entry_str, sizeof(entry_str), entry, entry_size);
> +	pr_alert("BUG: Bad page map in process %s  %s: %s", current->comm,
> +		 pgtable_level_to_str(level), entry_str);
>  	__print_bad_page_map_pgtable(vma->vm_mm, addr);
>  	if (page)
>  		dump_page(page, "bad page map");
> @@ -627,8 +677,14 @@ static inline bool pgtable_level_has_pxx_special(enum pgtable_level level)
>  	}
>  }
>  
> -#define print_bad_pte(vma, addr, pte, page) \
> -	print_bad_page_map(vma, addr, pte_val(pte), page, PGTABLE_LEVEL_PTE)
> +static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
> +			  pte_t pte, struct page *page)
> +{
> +	typeof(pte_val(pte)) entry = pte_val(pte);
> +
> +	print_bad_page_map(vma, addr, &entry, sizeof(entry), page,
> +			   PGTABLE_LEVEL_PTE);
> +}
>  
>  /**
>   * __vm_normal_page() - Get the "struct page" associated with a page table entry.
> @@ -636,8 +692,9 @@ static inline bool pgtable_level_has_pxx_special(enum pgtable_level level)
>   * @addr: The address where the page table entry is mapped.
>   * @pfn: The PFN stored in the page table entry.
>   * @special: Whether the page table entry is marked "special".
> - * @level: The page table level for error reporting purposes only.
>   * @entry: The page table entry value for error reporting purposes only.
> + * @entry_size: The size of @entry.
> + * @level: The page table level for error reporting purposes only.
>   *
>   * "Special" mappings do not wish to be associated with a "struct page" (either
>   * it doesn't exist, or it exists but they don't want to touch it). In this
> @@ -697,7 +754,7 @@ static inline bool pgtable_level_has_pxx_special(enum pgtable_level level)
>   */
>  static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>  		unsigned long addr, unsigned long pfn, bool special,
> -		unsigned long long entry, enum pgtable_level level)
> +		const void *entry, size_t entry_size, enum pgtable_level level)
>  {
>  	if (pgtable_level_has_pxx_special(level)) {
>  		if (unlikely(special)) {
> @@ -710,7 +767,8 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>  			if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
>  				return NULL;
>  
> -			print_bad_page_map(vma, addr, entry, NULL, level);
> +			print_bad_page_map(vma, addr, entry, entry_size, NULL,
> +					   level);
>  			return NULL;
>  		}
>  		/*
> @@ -741,7 +799,7 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>  
>  	if (unlikely(pfn > highest_memmap_pfn)) {
>  		/* Corrupted page table entry. */
> -		print_bad_page_map(vma, addr, entry, NULL, level);
> +		print_bad_page_map(vma, addr, entry, entry_size, NULL, level);
>  		return NULL;
>  	}
>  	/*
> @@ -767,8 +825,10 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>  struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>  			    pte_t pte)
>  {
> +	typeof(pte_val(pte)) entry = pte_val(pte);
> +
>  	return __vm_normal_page(vma, addr, pte_pfn(pte), pte_special(pte),
> -				pte_val(pte), PGTABLE_LEVEL_PTE);
> +				&entry, sizeof(entry), PGTABLE_LEVEL_PTE);
>  }
>  
>  /**
> @@ -809,8 +869,10 @@ struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
>  struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>  				pmd_t pmd)
>  {
> +	typeof(pmd_val(pmd)) entry = pmd_val(pmd);
> +
>  	return __vm_normal_page(vma, addr, pmd_pfn(pmd), pmd_special(pmd),
> -				pmd_val(pmd), PGTABLE_LEVEL_PMD);
> +				&entry, sizeof(entry), PGTABLE_LEVEL_PMD);
>  }
>  
>  /**
> @@ -850,8 +912,10 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
>  struct page *vm_normal_page_pud(struct vm_area_struct *vma,
>  		unsigned long addr, pud_t pud)
>  {
> +	typeof(pud_val(pud)) entry = pud_val(pud);
> +
>  	return __vm_normal_page(vma, addr, pud_pfn(pud), pud_special(pud),
> -				pud_val(pud), PGTABLE_LEVEL_PUD);
> +				&entry, sizeof(entry), PGTABLE_LEVEL_PUD);
>  }
>  #endif
>  

