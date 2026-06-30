Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA0331ED9;
	Tue, 30 Jun 2026 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826624; cv=none; b=uKyX3IOCWSTkdflft6phR9HjIsQuyXI0Wx9EDxtkIrYb5JHDotmxXObSEnBDsPOC9vg+kWtok8JmWj7GmFKwB3aFDxQYn21qkj8dNGfgQ7ScNEdMpqx7nLX8jAHNBYqHbo77McPATg7xiSBc99OHNyhlJdyt/TsfcgiNGhvk1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826624; c=relaxed/simple;
	bh=e6q1HYS5ZVIixzFRM5+bj3uHriCxquaaQfAVbrCNxIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+GcwAqeWUttUYYdkaGMy717tcgNHbpZ9SHZcht3dy0NahQxuo9VGZBDGGwv4044l739pJzP6EOrTKj1qtJFIU6AmCt7/f3/9DL/rQUIFItD1hi42G6FByQbrel0e7uP62aUM7gxg5CZvKy8IAAa0GAVshw6/BYLLfxM3IWTQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXPllIcK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXPllIcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9A11F000E9;
	Tue, 30 Jun 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826622;
	bh=380p0rp0UfhHz5IK1FPs/y6KNtuFKr5BHcxENu/Uulg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dXPllIcKlMxuwKrHPIViRviAqoPy3aP7nGBNIeRVjDV2KFDot1oosC89ohiLZxrbi
	 kvQvUlSZ3eKqH10A/xMTVO8H5fKQiPrGR/UTOsH5Pe5VpJG2Nob3U5Nlt3N7tcMIu1
	 8rb0VTap+noiGpEz8a1Fj7t3WVR+jvYO8ouM6pQpcO35Qkon+pqZgR9px9YJ40Rco8
	 MKy2FuQLhW1auMHOgZYspFZnMoZ6ycEqIe3UCRKbJ7CRbZNFDaOzB9Q/V8Dg9KRrWf
	 V3Ul+0Idm293H2hTr9ujYCZx10zqwemeBXEDVIhotPR1zBbk6nYF6+Qwu08xJhFzOQ
	 lDLYCa2t4Ml8A==
Message-ID: <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
Date: Tue, 30 Jun 2026 15:36:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
To: Hugh Dickins <hughd@google.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 08:19, Hugh Dickins wrote:
> On Mon, 15 Jun 2026, David Hildenbrand (Arm) wrote:
>> On 6/12/26 23:26, Hugh Dickins wrote:
>>> ...
>>>
>>> The page table entry is BUGgily Bad: we want to see what it looks like
>>> (sometimes, a sequence of bad page map entries may even show up as ASCII).
>>
>> But is printing raw page table entries really what we want? I guess to detect
>> "random corruption" it might help sometimes.
> 
> Yes, that's what it's for. What we really want is to understand what went
> wrong: that's too much to ask of a printk, but it can give us a good clue.
> 
>>
>> And do we really need information about the full page table walk, or is the last
>> level good enough?
> 
> Page table entry and pmd entry are good enough: higher levels got
> added at some stage, but they are unlikely to be useful here.

Yes, I added them when we're processing PUD entries we'd also want
P4D entry + PUD entry.

This is one approach of having the printing be done mostly
manually, supporting 32, 64 and 128bit pte_val(). As raised by Ryan,
using local bufs to store the data to not involve printk.


I played with printing the byte stream manually, but didn't really like it.

Gave it a quick test and it seems to do its trick. I have the feeling that
this can be beautified a bit more.


From 05af7317b126991a61b0a3d01c2863ce5a578d1b Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Tue, 30 Jun 2026 15:23:02 +0200
Subject: [PATCH] tmp

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/memory.c | 110 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 23 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ff338c2abe923..ad39cafe110f9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -519,9 +519,57 @@ static bool is_bad_page_map_ratelimited(void)
 	return false;
 }
 
+#define PTVAL_STR_MAX	(sizeof(u64) * 4 + 1)
+
+static void ptval_bytes_to_str(char *buf, size_t buf_size,
+		const void *entry, size_t entry_size)
+{
+	if (WARN_ON_ONCE(buf_size < entry_size * 2 + 1)) {
+		snprintf(buf, buf_size, "overflow");
+		return;
+	}
+
+	switch (entry_size) {
+	case sizeof(u32):
+		snprintf(buf, buf_size, "%08x", *(const u32 *)entry);
+		break;
+	case sizeof(u64):
+		snprintf(buf, buf_size, "%016llx",
+			 (unsigned long long)*(const u64 *)entry);
+		break;
+	case sizeof(u64) * 2: {
+		const u64 *val = entry;
+
+		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+			snprintf(buf, buf_size, "%016llx%016llx",
+				 (unsigned long long)val[0],
+				 (unsigned long long)val[1]);
+		else
+			snprintf(buf, buf_size, "%016llx%016llx",
+				 (unsigned long long)val[1],
+				 (unsigned long long)val[0]);
+		break;
+	}
+	default:
+		snprintf(buf, buf_size, "unsupported");
+		break;
+	}
+}
+
+#define ptval_to_str(buf, val)						\
+	do {								\
+		typeof(val) __val = (val);				\
+									\
+		ptval_bytes_to_str((buf), sizeof(buf), &__val,		\
+				   sizeof(__val));			\
+	} while (0)
+
 static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
 {
-	unsigned long long pgdv, p4dv, pudv, pmdv;
+	char pgd_str[PTVAL_STR_MAX];
+	char p4d_str[PTVAL_STR_MAX];
+	char pud_str[PTVAL_STR_MAX];
+	char pmd_str[PTVAL_STR_MAX];
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
@@ -532,34 +580,34 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	 * see locking requirements for print_bad_page_map().
 	 */
 	pgdp = pgd_offset(mm, addr);
-	pgdv = pgd_val(*pgdp);
+	ptval_to_str(pgd_str, pgd_val(*pgdp));
 
 	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
-		pr_alert("pgd:%08llx\n", pgdv);
+		pr_alert("pgd: %s\n", pgd_str);
 		return;
 	}
 
 	p4dp = p4d_offset(pgdp, addr);
 	p4d = p4dp_get(p4dp);
-	p4dv = p4d_val(p4d);
+	ptval_to_str(p4d_str, p4d_val(p4d));
 
 	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
-		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
+		pr_alert("pgd: %s p4d: %s\n", pgd_str, p4d_str);
 		return;
 	}
 
 	pudp = pud_offset(p4dp, addr);
 	pud = pudp_get(pudp);
-	pudv = pud_val(pud);
+	ptval_to_str(pud_str, pud_val(pud));
 
 	if (!pud_present(pud) || pud_leaf(pud)) {
-		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
+		pr_alert("pgd: %s p4d: %s pud: %s\n", pgd_str, p4d_str, pud_str);
 		return;
 	}
 
 	pmdp = pmd_offset(pudp, addr);
 	pmd = pmdp_get(pmdp);
-	pmdv = pmd_val(pmd);
+	ptval_to_str(pmd_str, pmd_val(pmd));
 
 	/*
 	 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
@@ -567,8 +615,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	 * doing another map would be bad. print_bad_page_map() should
 	 * already take care of printing the PTE.
 	 */
-	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
-		 p4dv, pudv, pmdv);
+	pr_alert("pgd: %s p4d: %s pud: %s pmd: %s\n", pgd_str, p4d_str, pud_str,
+		 pmd_str);
 }
 
 /*
@@ -584,10 +632,11 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
  * page table lock.
  */
 static void print_bad_page_map(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long long entry, struct page *page,
-		enum pgtable_level level)
+		unsigned long addr, const void *entry, size_t entry_size,
+		struct page *page, enum pgtable_level level)
 {
 	struct address_space *mapping;
+	char entry_str[PTVAL_STR_MAX];
 	pgoff_t index;
 
 	if (is_bad_page_map_ratelimited())
@@ -596,8 +645,9 @@ static void print_bad_page_map(struct vm_area_struct *vma,
 	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
 	index = linear_page_index(vma, addr);
 
-	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
-		 pgtable_level_to_str(level), entry);
+	ptval_bytes_to_str(entry_str, sizeof(entry_str), entry, entry_size);
+	pr_alert("BUG: Bad page map in process %s  %s: %s", current->comm,
+		 pgtable_level_to_str(level), entry_str);
 	__print_bad_page_map_pgtable(vma->vm_mm, addr);
 	if (page)
 		dump_page(page, "bad page map");
@@ -627,8 +677,14 @@ static inline bool pgtable_level_has_pxx_special(enum pgtable_level level)
 	}
 }
 
-#define print_bad_pte(vma, addr, pte, page) \
-	print_bad_page_map(vma, addr, pte_val(pte), page, PGTABLE_LEVEL_PTE)
+static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
+			  pte_t pte, struct page *page)
+{
+	typeof(pte_val(pte)) entry = pte_val(pte);
+
+	print_bad_page_map(vma, addr, &entry, sizeof(entry), page,
+			   PGTABLE_LEVEL_PTE);
+}
 
 /**
  * __vm_normal_page() - Get the "struct page" associated with a page table entry.
@@ -636,8 +692,9 @@ static inline bool pgtable_level_has_pxx_special(enum pgtable_level level)
  * @addr: The address where the page table entry is mapped.
  * @pfn: The PFN stored in the page table entry.
  * @special: Whether the page table entry is marked "special".
- * @level: The page table level for error reporting purposes only.
  * @entry: The page table entry value for error reporting purposes only.
+ * @entry_size: The size of @entry.
+ * @level: The page table level for error reporting purposes only.
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
@@ -697,7 +754,7 @@ static inline bool pgtable_level_has_pxx_special(enum pgtable_level level)
  */
 static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long pfn, bool special,
-		unsigned long long entry, enum pgtable_level level)
+		const void *entry, size_t entry_size, enum pgtable_level level)
 {
 	if (pgtable_level_has_pxx_special(level)) {
 		if (unlikely(special)) {
@@ -710,7 +767,8 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 			if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
 				return NULL;
 
-			print_bad_page_map(vma, addr, entry, NULL, level);
+			print_bad_page_map(vma, addr, entry, entry_size, NULL,
+					   level);
 			return NULL;
 		}
 		/*
@@ -741,7 +799,7 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 
 	if (unlikely(pfn > highest_memmap_pfn)) {
 		/* Corrupted page table entry. */
-		print_bad_page_map(vma, addr, entry, NULL, level);
+		print_bad_page_map(vma, addr, entry, entry_size, NULL, level);
 		return NULL;
 	}
 	/*
@@ -767,8 +825,10 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 			    pte_t pte)
 {
+	typeof(pte_val(pte)) entry = pte_val(pte);
+
 	return __vm_normal_page(vma, addr, pte_pfn(pte), pte_special(pte),
-				pte_val(pte), PGTABLE_LEVEL_PTE);
+				&entry, sizeof(entry), PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -809,8 +869,10 @@ struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd)
 {
+	typeof(pmd_val(pmd)) entry = pmd_val(pmd);
+
 	return __vm_normal_page(vma, addr, pmd_pfn(pmd), pmd_special(pmd),
-				pmd_val(pmd), PGTABLE_LEVEL_PMD);
+				&entry, sizeof(entry), PGTABLE_LEVEL_PMD);
 }
 
 /**
@@ -850,8 +912,10 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 struct page *vm_normal_page_pud(struct vm_area_struct *vma,
 		unsigned long addr, pud_t pud)
 {
+	typeof(pud_val(pud)) entry = pud_val(pud);
+
 	return __vm_normal_page(vma, addr, pud_pfn(pud), pud_special(pud),
-				pud_val(pud), PGTABLE_LEVEL_PUD);
+				&entry, sizeof(entry), PGTABLE_LEVEL_PUD);
 }
 #endif
 
-- 
2.43.0


-- 
Cheers,

David
