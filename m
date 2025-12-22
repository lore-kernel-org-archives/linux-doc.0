Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1B32142A
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416369; cv=none; b=Ysj5tlvFABsaLTPcK8wLQCMtS+F6jW0bD8EMhXduawag2hjJtvRI0eKeDatklbmXqcQfxwgxoNm53cmqETu2ks6sWG1hOnz0VVe3Q0f7NsQUpXnQUfz4455jbDYQ18QpbwWhK/VtLfDZ+pOg4/ql1AvGrv/5v+DnArX8MKQARNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416369; c=relaxed/simple;
	bh=hoKW+SrdwdbA7KUB3oH5PiyNN8Xl+2wJ6zVxeJkwgWo=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=cNzBIh4XsWoxA1RQkKAidbF170wI2kSI6CZsLM+//uEk1l82rTI/ScarzMQXGHFOiuEEdxUT8H2kuoQaff8xAJ/nwhPB7HKZrstBkryC6F4f1MufO80jI6bYroVraItUbtLM4gDt5QwhmjH69b6AQH8px2mK1OzzFHzX1xv9ieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s6CDSNhT; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s6CDSNhT"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766416354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZWUAPwBe5grbTomY7+OIbrJoCs1boY/dcPlBY3RwfQ=;
	b=s6CDSNhTeUcLX6mbe16KdLKB57o0W1DSqfAwgxRlAue6Lcg1z1IkqK5ciLllee0/g5vmHw
	2bbYuRf/3u0Kk9wZFQdM2DqKxnIvtdaPufBQR8Fw1k01jtmcxaGzaNIk5Zc9Q5TELUfpaa
	SG89We/g9XbMXnyuw9BmhC2R7diHPPI=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCHv2 08/14] mm/hugetlb: Refactor code around vmemmap_walk
Date: Mon, 22 Dec 2025 23:11:46 +0800
Message-Id: <DC02711B-70F3-47B8-B8BE-1C0F3FE43780@linux.dev>
References: <cogzomaems6f4v2ihijwd3qoq5mb6g7lr37xrrwynbdmjjgy7y@5dytmftheuhz>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
In-Reply-To: <cogzomaems6f4v2ihijwd3qoq5mb6g7lr37xrrwynbdmjjgy7y@5dytmftheuhz>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 22, 2025, at 23:03, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> =EF=BB=BFOn Mon, Dec 22, 2025 at 01:54:47PM +0800, Muchun Song wrote:
>>=20
>>=20
>>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>> To prepare for removing fake head pages, the vmemmap_walk code is being r=
eworked.
>>>=20
>>> The reuse_page and reuse_addr variables are being eliminated. There will=

>>> no longer be an expectation regarding the reuse address in relation to
>>> the operated range. Instead, the caller will provide head and tail
>>> vmemmap pages, along with the vmemmap_start address where the head page
>>> is located.
>>>=20
>>> Currently, vmemmap_head and vmemmap_tail are set to the same page, but
>>> this will change in the future.
>>>=20
>>> The only functional change is that __hugetlb_vmemmap_optimize_folio()
>>> will abandon optimization if memory allocation fails.
>>>=20
>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>> ---
>>>  mm/hugetlb_vmemmap.c | 198 ++++++++++++++++++-------------------------
>>>  1 file changed, 83 insertions(+), 115 deletions(-)
>>>=20
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index ba0fb1b6a5a8..d18e7475cf95 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -24,8 +24,9 @@
>>>   *
>>>   * @remap_pte:        called for each lowest-level entry (PTE).
>>>   * @nr_walked:        the number of walked pte.
>>> - * @reuse_page:        the page which is reused for the tail vmemmap pa=
ges.
>>> - * @reuse_addr:        the virtual address of the @reuse_page page.
>>> + * @vmemmap_start:    the start of vmemmap range, where head page is lo=
cated
>>> + * @vmemmap_head:    the page to be installed as first in the vmemmap r=
ange
>>> + * @vmemmap_tail:    the page to be installed as non-first in the vmemm=
ap range
>>>   * @vmemmap_pages:    the list head of the vmemmap pages that can be fr=
eed
>>>   *            or is mapped from.
>>>   * @flags:        used to modify behavior in vmemmap page table walking=

>>> @@ -34,11 +35,14 @@
>>>  struct vmemmap_remap_walk {
>>>      void            (*remap_pte)(pte_t *pte, unsigned long addr,
>>>                           struct vmemmap_remap_walk *walk);
>>> +
>>>      unsigned long        nr_walked;
>>> -    struct page        *reuse_page;
>>> -    unsigned long        reuse_addr;
>>> +    unsigned long        vmemmap_start;
>>> +    struct page        *vmemmap_head;
>>> +    struct page        *vmemmap_tail;
>>>      struct list_head    *vmemmap_pages;
>>> +
>>>  /* Skip the TLB flush when we split the PMD */
>>>  #define VMEMMAP_SPLIT_NO_TLB_FLUSH    BIT(0)
>>>  /* Skip the TLB flush when we remap the PTE */
>>> @@ -140,14 +144,7 @@ static int vmemmap_pte_entry(pte_t *pte, unsigned l=
ong addr,
>>>  {
>>>      struct vmemmap_remap_walk *vmemmap_walk =3D walk->private;
>>> -    /*
>>> -     * The reuse_page is found 'first' in page table walking before
>>> -     * starting remapping.
>>> -     */
>>> -    if (!vmemmap_walk->reuse_page)
>>> -        vmemmap_walk->reuse_page =3D pte_page(ptep_get(pte));
>>> -    else
>>> -        vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>>> +    vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>>>      vmemmap_walk->nr_walked++;
>>>      return 0;
>>> @@ -207,18 +204,12 @@ static void free_vmemmap_page_list(struct list_hea=
d *list)
>>>  static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
>>>                    struct vmemmap_remap_walk *walk)
>>>  {
>>> -    /*
>>> -     * Remap the tail pages as read-only to catch illegal write operati=
on
>>> -     * to the tail pages.
>>> -     */
>>> -    pgprot_t pgprot =3D PAGE_KERNEL_RO;
>>>      struct page *page =3D pte_page(ptep_get(pte));
>>>      pte_t entry;
>>>      /* Remapping the head page requires r/w */
>>> -    if (unlikely(addr =3D=3D walk->reuse_addr)) {
>>> -        pgprot =3D PAGE_KERNEL;
>>> -        list_del(&walk->reuse_page->lru);
>>> +    if (unlikely(addr =3D=3D walk->vmemmap_start)) {
>>> +        list_del(&walk->vmemmap_head->lru);
>>>          /*
>>>           * Makes sure that preceding stores to the page contents from
>>> @@ -226,9 +217,16 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned l=
ong addr,
>>>           * write.
>>>           */
>>>          smp_wmb();
>>> +
>>> +        entry =3D mk_pte(walk->vmemmap_head, PAGE_KERNEL);
>>> +    } else {
>>> +        /*
>>> +         * Remap the tail pages as read-only to catch illegal write
>>> +         * operation to the tail pages.
>>> +         */
>>> +        entry =3D mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
>>>      }
>>> -    entry =3D mk_pte(walk->reuse_page, pgprot);
>>>      list_add(&page->lru, walk->vmemmap_pages);
>>>      set_pte_at(&init_mm, addr, pte, entry);
>>>  }
>>> @@ -255,16 +253,13 @@ static inline void reset_struct_pages(struct page *=
start)
>>>  static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
>>>                  struct vmemmap_remap_walk *walk)
>>>  {
>>> -    pgprot_t pgprot =3D PAGE_KERNEL;
>>>      struct page *page;
>>>      void *to;
>>> -    BUG_ON(pte_page(ptep_get(pte)) !=3D walk->reuse_page);
>>> -
>>>      page =3D list_first_entry(walk->vmemmap_pages, struct page, lru);
>>>      list_del(&page->lru);
>>>      to =3D page_to_virt(page);
>>> -    copy_page(to, (void *)walk->reuse_addr);
>>> +    copy_page(to, (void *)walk->vmemmap_start);
>>>      reset_struct_pages(to);
>>>      /*
>>> @@ -272,7 +267,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned=
 long addr,
>>>       * before the set_pte_at() write.
>>>       */
>>>      smp_wmb();
>>> -    set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
>>> +    set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL));
>>>  }
>>>  /**
>>> @@ -282,33 +277,29 @@ static void vmemmap_restore_pte(pte_t *pte, unsign=
ed long addr,
>>>   *             to remap.
>>>   * @end:       end address of the vmemmap virtual address range that we=
 want to
>>>   *             remap.
>>> - * @reuse:     reuse address.
>>> - *
>>>   * Return: %0 on success, negative error code otherwise.
>>>   */
>>> -static int vmemmap_remap_split(unsigned long start, unsigned long end,
>>> -                   unsigned long reuse)
>>> +static int vmemmap_remap_split(unsigned long start, unsigned long end)
>>>  {
>>>      struct vmemmap_remap_walk walk =3D {
>>>          .remap_pte    =3D NULL,
>>> +        .vmemmap_start    =3D start,
>>>          .flags        =3D VMEMMAP_SPLIT_NO_TLB_FLUSH,
>>>      };
>>> -    /* See the comment in the vmemmap_remap_free(). */
>>> -    BUG_ON(start - reuse !=3D PAGE_SIZE);
>>> -
>>> -    return vmemmap_remap_range(reuse, end, &walk);
>>> +    return vmemmap_remap_range(start, end, &walk);
>>>  }
>>>  /**
>>>   * vmemmap_remap_free - remap the vmemmap virtual address range [@start=
, @end)
>>> - *            to the page which @reuse is mapped to, then free vmemmap
>>> - *            which the range are mapped to.
>>> + *            to use @vmemmap_head/tail, then free vmemmap which
>>> + *            the range are mapped to.
>>>   * @start:    start address of the vmemmap virtual address range that w=
e want
>>>   *        to remap.
>>>   * @end:    end address of the vmemmap virtual address range that we wa=
nt to
>>>   *        remap.
>>> - * @reuse:    reuse address.
>>> + * @vmemmap_head: the page to be installed as first in the vmemmap rang=
e
>>> + * @vmemmap_tail: the page to be installed as non-first in the vmemmap r=
ange
>>>   * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is ca=
llers
>>>   *        responsibility to free pages.
>>>   * @flags:    modifications to vmemmap_remap_walk flags
>>> @@ -316,69 +307,40 @@ static int vmemmap_remap_split(unsigned long start=
, unsigned long end,
>>>   * Return: %0 on success, negative error code otherwise.
>>>   */
>>>  static int vmemmap_remap_free(unsigned long start, unsigned long end,
>>> -                  unsigned long reuse,
>>> +                  struct page *vmemmap_head,
>>> +                  struct page *vmemmap_tail,
>>>                    struct list_head *vmemmap_pages,
>>>                    unsigned long flags)
>>>  {
>>>      int ret;
>>>      struct vmemmap_remap_walk walk =3D {
>>>          .remap_pte    =3D vmemmap_remap_pte,
>>> -        .reuse_addr    =3D reuse,
>>> +        .vmemmap_start    =3D start,
>>> +        .vmemmap_head    =3D vmemmap_head,
>>> +        .vmemmap_tail    =3D vmemmap_tail,
>>>          .vmemmap_pages    =3D vmemmap_pages,
>>>          .flags        =3D flags,
>>>      };
>>> -    int nid =3D page_to_nid((struct page *)reuse);
>>> -    gfp_t gfp_mask =3D GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN;
>>> +
>>> +    ret =3D vmemmap_remap_range(start, end, &walk);
>>> +    if (!ret || !walk.nr_walked)
>>> +        return ret;
>>> +
>>> +    end =3D start + walk.nr_walked * PAGE_SIZE;
>>>      /*
>>> -     * Allocate a new head vmemmap page to avoid breaking a contiguous
>>> -     * block of struct page memory when freeing it back to page allocat=
or
>>> -     * in free_vmemmap_page_list(). This will allow the likely contiguo=
us
>>> -     * struct page backing memory to be kept contiguous and allowing fo=
r
>>> -     * more allocations of hugepages. Fallback to the currently
>>> -     * mapped head page in case should it fail to allocate.
>>> +     * vmemmap_pages contains pages from the previous vmemmap_remap_ran=
ge()
>>> +     * call which failed.  These are pages which were removed from
>>> +     * the vmemmap. They will be restored in the following call.
>>>       */
>>> -    walk.reuse_page =3D alloc_pages_node(nid, gfp_mask, 0);
>>> -    if (walk.reuse_page) {
>>> -        copy_page(page_to_virt(walk.reuse_page),
>>> -              (void *)walk.reuse_addr);
>>> -        list_add(&walk.reuse_page->lru, vmemmap_pages);
>>> -        memmap_pages_add(1);
>>> -    }
>>> +    walk =3D (struct vmemmap_remap_walk) {
>>> +        .remap_pte    =3D vmemmap_restore_pte,
>>> +        .vmemmap_start    =3D start,
>>> +        .vmemmap_pages    =3D vmemmap_pages,
>>> +        .flags        =3D 0,
>>> +    };
>>> -    /*
>>> -     * In order to make remapping routine most efficient for the huge p=
ages,
>>> -     * the routine of vmemmap page table walking has the following rule=
s
>>> -     * (see more details from the vmemmap_pte_range()):
>>> -     *
>>> -     * - The range [@start, @end) and the range [@reuse, @reuse + PAGE_=
SIZE)
>>> -     *   should be continuous.
>>> -     * - The @reuse address is part of the range [@reuse, @end) that we=
 are
>>> -     *   walking which is passed to vmemmap_remap_range().
>>> -     * - The @reuse address is the first in the complete range.
>>> -     *
>>> -     * So we need to make sure that @start and @reuse meet the above ru=
les.
>>> -     */
>>> -    BUG_ON(start - reuse !=3D PAGE_SIZE);
>>> -
>>> -    ret =3D vmemmap_remap_range(reuse, end, &walk);
>>> -    if (ret && walk.nr_walked) {
>>> -        end =3D reuse + walk.nr_walked * PAGE_SIZE;
>>> -        /*
>>> -         * vmemmap_pages contains pages from the previous
>>> -         * vmemmap_remap_range call which failed.  These
>>> -         * are pages which were removed from the vmemmap.
>>> -         * They will be restored in the following call.
>>> -         */
>>> -        walk =3D (struct vmemmap_remap_walk) {
>>> -            .remap_pte    =3D vmemmap_restore_pte,
>>> -            .reuse_addr    =3D reuse,
>>> -            .vmemmap_pages    =3D vmemmap_pages,
>>> -            .flags        =3D 0,
>>> -        };
>>> -
>>> -        vmemmap_remap_range(reuse, end, &walk);
>>> -    }
>>> +    vmemmap_remap_range(start + PAGE_SIZE, end, &walk);
>>=20
>> The reason we previously passed the "start" address
>> was to perform a TLB flush within that address range.
>> So he startaddress is still necessary.
>=20
> Good catch.
>=20
>>>      return ret;
>>>  }
>>> @@ -415,29 +377,27 @@ static int alloc_vmemmap_page_list(unsigned long s=
tart, unsigned long end,
>>>   *        to remap.
>>>   * @end:    end address of the vmemmap virtual address range that we wa=
nt to
>>>   *        remap.
>>> - * @reuse:    reuse address.
>>>   * @flags:    modifications to vmemmap_remap_walk flags
>>>   *
>>>   * Return: %0 on success, negative error code otherwise.
>>>   */
>>>  static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
>>> -                   unsigned long reuse, unsigned long flags)
>>> +                   unsigned long flags)
>>>  {
>>>      LIST_HEAD(vmemmap_pages);
>>>      struct vmemmap_remap_walk walk =3D {
>>>          .remap_pte    =3D vmemmap_restore_pte,
>>> -        .reuse_addr    =3D reuse,
>>> +        .vmemmap_start    =3D start,
>>>          .vmemmap_pages    =3D &vmemmap_pages,
>>>          .flags        =3D flags,
>>>      };
>>> -    /* See the comment in the vmemmap_remap_free(). */
>>> -    BUG_ON(start - reuse !=3D PAGE_SIZE);
>>> +    start +=3D HUGETLB_VMEMMAP_RESERVE_SIZE;
>>>      if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
>>>          return -ENOMEM;
>>> -    return vmemmap_remap_range(reuse, end, &walk);
>>> +    return vmemmap_remap_range(start, end, &walk);
>>>  }
>>>  DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
>>> @@ -454,8 +414,7 @@ static int __hugetlb_vmemmap_restore_folio(const str=
uct hstate *h,
>>>                         struct folio *folio, unsigned long flags)
>>>  {
>>>      int ret;
>>> -    unsigned long vmemmap_start =3D (unsigned long)&folio->page, vmemma=
p_end;
>>> -    unsigned long vmemmap_reuse;
>>> +    unsigned long vmemmap_start, vmemmap_end;
>>>      VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
>>>      VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
>>> @@ -466,18 +425,16 @@ static int __hugetlb_vmemmap_restore_folio(const s=
truct hstate *h,
>>>      if (flags & VMEMMAP_SYNCHRONIZE_RCU)
>>>          synchronize_rcu();
>>> +    vmemmap_start    =3D (unsigned long)folio;
>>>      vmemmap_end    =3D vmemmap_start + hugetlb_vmemmap_size(h);
>>> -    vmemmap_reuse    =3D vmemmap_start;
>>> -    vmemmap_start    +=3D HUGETLB_VMEMMAP_RESERVE_SIZE;
>>>      /*
>>>       * The pages which the vmemmap virtual address range [@vmemmap_star=
t,
>>> -     * @vmemmap_end) are mapped to are freed to the buddy allocator, an=
d
>>> -     * the range is mapped to the page which @vmemmap_reuse is mapped t=
o.
>>> +     * @vmemmap_end) are mapped to are freed to the buddy allocator.
>>>       * When a HugeTLB page is freed to the buddy allocator, previously
>>>       * discarded vmemmap pages must be allocated and remapping.
>>>       */
>>> -    ret =3D vmemmap_remap_alloc(vmemmap_start, vmemmap_end, vmemmap_reu=
se, flags);
>>> +    ret =3D vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
>>>      if (!ret) {
>>>          folio_clear_hugetlb_vmemmap_optimized(folio);
>>>          static_branch_dec(&hugetlb_optimize_vmemmap_key);
>>> @@ -565,9 +522,9 @@ static int __hugetlb_vmemmap_optimize_folio(const st=
ruct hstate *h,
>>>                          struct list_head *vmemmap_pages,
>>>                          unsigned long flags)
>>>  {
>>> -    int ret =3D 0;
>>> -    unsigned long vmemmap_start =3D (unsigned long)&folio->page, vmemma=
p_end;
>>> -    unsigned long vmemmap_reuse;
>>> +    unsigned long vmemmap_start, vmemmap_end;
>>> +    struct page *vmemmap_head, *vmemmap_tail;
>>> +    int nid, ret =3D 0;
>>>      VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
>>>      VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
>>> @@ -592,18 +549,31 @@ static int __hugetlb_vmemmap_optimize_folio(const s=
truct hstate *h,
>>>       */
>>>      folio_set_hugetlb_vmemmap_optimized(folio);
>>> +    nid =3D folio_nid(folio);
>>> +    vmemmap_head =3D alloc_pages_node(nid, GFP_KERNEL, 0);
>>=20
>> Why did you choose to change the gfpmask (previous is
>> GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN)?
>=20
> Because I removed the fallback for allocation failure. Trying harder and
> warn if the allocation failed is justified without the fallback path.
>=20
>>> +
>>> +    if (!vmemmap_head) {
>>> +        ret =3D -ENOMEM;
>>=20
>> Why did you choose to change the allocation-failure
>> behavior? Replacing the head page isn=E2=80=99t mandatory;
>> it=E2=80=99s only nice-to-have.
>=20
> I would require to extract the vmemmap_head page from page tables which
> I found to be useless complication that never will get executed and
> therefore tested.
>=20
> If we failed to allocate a single page here, we are in OOM territory. It
> is not time to play with huge page allocation.

Alright, you=E2=80=99ve convinced me.

>=20
>>> +        goto out;
>>> +    }
>>> +
>>> +    copy_page(page_to_virt(vmemmap_head), folio);
>>> +    list_add(&vmemmap_head->lru, vmemmap_pages);
>>> +    memmap_pages_add(1);
>>> +
>>> +    vmemmap_tail    =3D vmemmap_head;
>>> +    vmemmap_start    =3D (unsigned long)folio;
>>>      vmemmap_end    =3D vmemmap_start + hugetlb_vmemmap_size(h);
>>> -    vmemmap_reuse    =3D vmemmap_start;
>>> -    vmemmap_start    +=3D HUGETLB_VMEMMAP_RESERVE_SIZE;
>>>      /*
>>> -     * Remap the vmemmap virtual address range [@vmemmap_start, @vmemma=
p_end)
>>> -     * to the page which @vmemmap_reuse is mapped to.  Add pages previo=
usly
>>> -     * mapping the range to vmemmap_pages list so that they can be free=
d by
>>> -     * the caller.
>>> +     * Remap the vmemmap virtual address range [@vmemmap_start, @vmemma=
p_end).
>>> +     * Add pages previously mapping the range to vmemmap_pages list so t=
hat
>>> +     * they can be freed by the caller.
>>>       */
>>> -    ret =3D vmemmap_remap_free(vmemmap_start, vmemmap_end, vmemmap_reus=
e,
>>> +    ret =3D vmemmap_remap_free(vmemmap_start, vmemmap_end,
>>> +                 vmemmap_head, vmemmap_tail,
>>>                   vmemmap_pages, flags);
>>> +out:
>>>      if (ret) {
>>>          static_branch_dec(&hugetlb_optimize_vmemmap_key);
>>>          folio_clear_hugetlb_vmemmap_optimized(folio);
>>> @@ -632,21 +602,19 @@ void hugetlb_vmemmap_optimize_folio(const struct h=
state *h, struct folio *folio)
>>>  static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct f=
olio *folio)
>>>  {
>>> -    unsigned long vmemmap_start =3D (unsigned long)&folio->page, vmemma=
p_end;
>>> -    unsigned long vmemmap_reuse;
>>> +    unsigned long vmemmap_start, vmemmap_end;
>>>      if (!vmemmap_should_optimize_folio(h, folio))
>>>          return 0;
>>> +    vmemmap_start    =3D (unsigned long)folio;
>>>      vmemmap_end    =3D vmemmap_start + hugetlb_vmemmap_size(h);
>>> -    vmemmap_reuse    =3D vmemmap_start;
>>> -    vmemmap_start    +=3D HUGETLB_VMEMMAP_RESERVE_SIZE;
>>>      /*
>>>       * Split PMDs on the vmemmap virtual address range [@vmemmap_start,=

>>>       * @vmemmap_end]
>>>       */
>>> -    return vmemmap_remap_split(vmemmap_start, vmemmap_end, vmemmap_reus=
e);
>>> +    return vmemmap_remap_split(vmemmap_start, vmemmap_end);
>>>  }
>>>  static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
>>=20
>=20
> --
>  Kiryl Shutsemau / Kirill A. Shutemov
