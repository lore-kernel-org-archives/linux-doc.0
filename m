Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0CF30FF20
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728215; cv=none; b=f/iezTA+k0IUYCzUl6aX+mUgNDn/j/GVpSYBwX28dSA2Mfd17cDK7oeDLI4GN7u5j9yDbINQ6iUchmOtfr024TdNXDxKfh2sI//xa8qCoagof6zCNlSAF4+V5r0Rfm6ULrSXl9PdxhxgjjwZuT54BEHLBUXJ3UmgFzK/czlABk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728215; c=relaxed/simple;
	bh=h69DMhizz7GQuEtA8+nKdmcd5/kM4PybKsrv+/AlTiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMio7tuXO+f7SWX7OjSr60bnRZKGP2XbTfVhy8chux/DUNoaEjZc7HAxNUf7u9oZCxMijNnFhi9tfnGUbZeZtb0SAOqBziBOl877mD41JWiUQsQflVp4uPOBKiqKfHa6boFL785EdILR75EIaTEa49o7N7sT3z81ZddxintiMtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ousvq8KF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ousvq8KF"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-682714e8f9eso3128126a12.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 20:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728212; x=1779333012; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlbDhq6aISwbZIxdN2UdK6Cpe+bP5kOge+A9i5gYUKM=;
        b=Ousvq8KFMWf1oUZ/niMckBRnCMXjMzav2V6+2SdHbXsQUwpKTH0XnVUS6SOutNk/0H
         shEOqjlrAeMjChA9bJbfLlNHk8D4ecxXbGHv8LNBe3zeAbLrDN9EeOZyANUPDMxBorFH
         iTqKCPrKRYv3/iuv9HdXFPWCuobJ6iS8A7imcMAOH+MngpKEGivc/+oJOpKsBASQ8v+T
         8P64VJvWJiAsRF9V+dUAry8g9Oum4stYjJRpDIO249e28j5mQUKBLOSK43NI1jOfFJPR
         6/QlgpndfjA4Fcf/3l5SP8pZxHqR76FR+QkiaMuuzzOYzKbFPxlkS/burQR/F8nxyMgF
         FU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728212; x=1779333012;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlbDhq6aISwbZIxdN2UdK6Cpe+bP5kOge+A9i5gYUKM=;
        b=cD/u3BTc+WeQaQ8PXCpYijDA3d7f1AOpEwHOx8rD8dlJPiaQ1HJlC4VDhTYG+TAhOM
         oXSGcZlqvbwn78u0PTigpp6XL5ZGIAuKxmg+9WCytdWXz/9qaGN8e6RjpQliBXtHjjvW
         EZCe42+PhOzmuLuZB6jp3AIGVatYic1AXhwvnbE2rERHqXLljGkVvkn3KCtdUvsFO5pz
         oCi+fhy0slhlBza7ZuywXvnHYp4NvSRfAhMZxQpNqIDjj0StlU5uatmoLCEMOsZyHjBq
         ZwWopt1Zn7hYEtE7s6kcAAozmmPSO0C9koNAE/hU1Ig3ShJ/CbKT8nlQEp/XlCYVmKAq
         kisw==
X-Forwarded-Encrypted: i=1; AFNElJ90dAfCMwtlFHDC+VWbP1pGg8WKHt4Mm8rJFy1XwJZdSB7JA3yCdM9kj5jTJJk8JlsyhmlsJORguX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gm2aa2a5a97N2s/wpgb+fp7IixNwIEMCYab4czuVyLifTmIT
	51T29R5ph3AAGVI1mpGdjT6H3XStpP+WMtOiB2y91SbqyVaS13AV2oDf
X-Gm-Gg: Acq92OHv6FwFnFvFXDgFNmnv5/Uwh710dplIwiNWT3yb8oniKAg01bIGAUn199dawTv
	Vnfh4Cdt7zDN1LJyz55RCiiudqYs/cqzSvLy+MyJWte6uANWU+gzVUOBz7juM0rAcmL32w5Y3O6
	b/Jshg2xiYeRfm8MjlOPO8L1gg+o/PmkWWGfzauDVQOo8Mc+9cs6CYCmJyugNVuM/BdsXQzmIrf
	nBHUUapKbz61g9WBMcnkwOqoyRJ08fm0iP4pOF/szvutTiD334zWIY1B/rf47xel7nOSvuO1SzN
	bMkGw+zmI0kul5PcYqB6Js4vqzTVeOuaIn1snL1E7cKpVxXm4uRV4tjvlyFYzBzdu/cw1zp6/Lw
	U5PEZdhh1xldvRZfvwzB7E5mEAX8ypLffCLnqRrGUXDarjiUNpAoKG/zLNXykdEAMKYTPp5Bw0G
	3jmqiMUoduEniMReCtTDr3zw==
X-Received: by 2002:a05:6402:4584:b0:674:6c1f:e8d2 with SMTP id 4fb4d7f45d1cf-6830b5021b7mr1031042a12.15.1778728211703;
        Wed, 13 May 2026 20:10:11 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670a00sm268141a12.20.2026.05.13.20.10.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2026 20:10:10 -0700 (PDT)
Date: Thu, 14 May 2026 03:10:10 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: npache@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
	akpm@linux-foundation.org, anshuman.khandual@arm.com,
	apopple@nvidia.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, byungchul@sk.com,
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com,
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com,
	jack@suse.cz, jackmanb@google.com, jannh@google.com,
	jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org,
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com,
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com,
	raquini@redhat.com, rdunlap@infradead.org,
	richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org,
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com,
	sunnanyong@huawei.com, surenb@google.com,
	thomas.hellstrom@linux.intel.com, tiwai@suse.de,
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org,
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com,
	ziy@nvidia.com, zokeefe@google.com
Subject: Re: [PATCH mm-unstable v17 04/14] mm/khugepaged: generalize
 __collapse_huge_page_* for mTHP support
Message-ID: <20260514031009.f66cgop3ctgiqxz3@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260511185817.686831-5-npache@redhat.com>
 <20260512074202.10253-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512074202.10253-1-lance.yang@linux.dev>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, May 12, 2026 at 03:42:02PM +0800, Lance Yang wrote:
>
>On Mon, May 11, 2026 at 12:58:04PM -0600, Nico Pache wrote:
>>generalize the order of the __collapse_huge_page_* and collapse_max_*
>>functions to support future mTHP collapse.
>>
>>The current mechanism for determining collapse with the
>>khugepaged_max_ptes_none value is not designed with mTHP in mind. This
>>raises a key design issue: if we support user defined max_pte_none values
>>(even those scaled by order), a collapse of a lower order can introduces
>>an feedback loop, or "creep", when max_ptes_none is set to a value greater
>>than HPAGE_PMD_NR / 2. [1]
>>
>>With this configuration, a successful collapse to order N will populate
>>enough pages to satisfy the collapse condition on order N+1 on the next
>>scan. This leads to unnecessary work and memory churn.
>>
>>To fix this issue introduce a helper function that will limit mTHP
>>collapse support to two max_ptes_none values, 0 and HPAGE_PMD_NR - 1.
>>This effectively supports two modes: [2]
>>
>>- max_ptes_none=0: never collapses if it encounters an empty PTE or a PTE
>>  that maps the shared zeropage. Consequently, no memory bloat.
>>- max_ptes_none=511 (on 4k pagesz): Always collapse to the highest
>>  available mTHP order.
>>
>>This removes the possiblilty of "creep", while not modifying any uAPI
>>expectations. A warning will be emitted if any non-supported
>>max_ptes_none value is configured with mTHP enabled.
>>
>>mTHP collapse will not honor the khugepaged_max_ptes_shared or
>>khugepaged_max_ptes_swap parameters, and will fail if it encounters a
>>shared or swapped entry.
>>
>>No functional changes in this patch; however it defines future behavior
>>for mTHP collapse.
>>
>>[1] - https://lore.kernel.org/all/e46ab3ab-a3d7-4fb7-9970-d0704bd5d05a@arm.com
>>[2] - https://lore.kernel.org/all/37375ace-5601-4d6c-9dac-d1c8268698e9@redhat.com
>>
>>Co-developed-by: Dev Jain <dev.jain@arm.com>
>>Signed-off-by: Dev Jain <dev.jain@arm.com>
>>Signed-off-by: Nico Pache <npache@redhat.com>
>>---
>> include/trace/events/huge_memory.h |   3 +-
>> mm/khugepaged.c                    | 117 ++++++++++++++++++++---------
>> 2 files changed, 85 insertions(+), 35 deletions(-)
>>
>>diff --git a/include/trace/events/huge_memory.h b/include/trace/events/huge_memory.h
>>index bcdc57eea270..443e0bd13fdb 100644
>>--- a/include/trace/events/huge_memory.h
>>+++ b/include/trace/events/huge_memory.h
>>@@ -39,7 +39,8 @@
>> 	EM( SCAN_STORE_FAILED,		"store_failed")			\
>> 	EM( SCAN_COPY_MC,		"copy_poisoned_page")		\
>> 	EM( SCAN_PAGE_FILLED,		"page_filled")			\
>>-	EMe(SCAN_PAGE_DIRTY_OR_WRITEBACK, "page_dirty_or_writeback")
>>+	EM(SCAN_PAGE_DIRTY_OR_WRITEBACK, "page_dirty_or_writeback")	\
>>+	EMe(SCAN_INVALID_PTES_NONE,	"invalid_ptes_none")
>> 
>> #undef EM
>> #undef EMe
>>diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>index f68853b3caa7..27465161fa6d 100644
>>--- a/mm/khugepaged.c
>>+++ b/mm/khugepaged.c
>>@@ -61,6 +61,7 @@ enum scan_result {
>> 	SCAN_COPY_MC,
>> 	SCAN_PAGE_FILLED,
>> 	SCAN_PAGE_DIRTY_OR_WRITEBACK,
>>+	SCAN_INVALID_PTES_NONE,
>> };
>> 
>> #define CREATE_TRACE_POINTS
>>@@ -353,37 +354,60 @@ static bool pte_none_or_zero(pte_t pte)
>>  * PTEs for the given collapse operation.
>>  * @cc: The collapse control struct
>>  * @vma: The vma to check for userfaultfd
>>+ * @order: The folio order being collapsed to
>>  *
>>  * Return: Maximum number of none-page or zero-page PTEs allowed for the
>>  * collapse operation.
>>  */
>>-static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
>>-		struct vm_area_struct *vma)
>>+static int collapse_max_ptes_none(struct collapse_control *cc,
>>+		struct vm_area_struct *vma, unsigned int order)
>> {
>>+	unsigned int max_ptes_none = khugepaged_max_ptes_none;
>> 	// If the vma is userfaultfd-armed, allow no none-page or zero-page PTEs.
>
>One thing I still want to call out: kernel code usually uses C-style
>comments :)
>
>> 	if (vma && userfaultfd_armed(vma))
>> 		return 0;
>> 	// for MADV_COLLAPSE, allow any none-page or zero-page PTEs.
>> 	if (!cc->is_khugepaged)
>> 		return HPAGE_PMD_NR;
>>-	// For all other cases repect the user defined maximum.
>>-	return khugepaged_max_ptes_none;
>>+	// for PMD collapse, respect the user defined maximum.
>>+	if (is_pmd_order(order))
>>+		return max_ptes_none;
>>+	/* Zero/non-present collapse disabled. */
>>+	if (!max_ptes_none)
>>+		return 0;
>>+	// for mTHP collapse with the sysctl value set to KHUGEPAGED_MAX_PTES_LIMIT,
>>+	// scale the maximum number of PTEs to the order of the collapse.
>>+	if (max_ptes_none == KHUGEPAGED_MAX_PTES_LIMIT)
>>+		return (1 << order) - 1;
>>+
>>+	// We currently only support max_ptes_none values of 0 or KHUGEPAGED_MAX_PTES_LIMIT.
>>+	// Emit a warning and return -EINVAL.
>>+	pr_warn_once("mTHP collapse only supports max_ptes_none values of 0 or %u\n",
>>+		      KHUGEPAGED_MAX_PTES_LIMIT);
>
>Maybe fallback to 0 instead, as David suggested earlier?
>

It looks reasonable to fallback to 0.

But as the updated Document says in patch 14:

  For mTHP collapse, only 0 or (HPAGE_PMD_NR - 1) are supported. Any other
  value will emit a warning and no mTHP collapse will be attempted.

This is why it does like this now.

    mthp_collapse()
        max_ptes_none = collapse_max_ptes_none();
        if (max_ptes_none < 0)
            return collapsed;

>max_ptes_none is mostly legacy PMD THP behavior. mTHP is new, and any
>intermediate value in (0, KHUGEPAGED_MAX_PTES_LIMIT) would implicitly
>disable it :(
>

So it depends on what we want to do here :-)

For me, I would vote for fallback to 0.

>Treating those values as 0 feels like the least surprising behavior,
>IMHO. It also gives mTHP a cleaner staring point, rather than carry over
>all the old PMD knob semantics :)
>
>Otherwise, LGTM!
>Reviewed-by: Lance Yang <lance.yang@linux.dev>
>
>>+	return -EINVAL;

-- 
Wei Yang
Help you, Help me
