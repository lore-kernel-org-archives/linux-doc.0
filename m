Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549FA340A76
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773747387; cv=none; b=VUFWk55hwcYVpTTOARJn8roA/xd8/70g1mEuXJpqH3vR2i8HPE3giAhaIorSrHUcSowumK05FrEFqySJ5sXHTJeJCPuPCpDYasQAA1onoR5OAUBypqppgO9tbR3nX53RsQN02755gn3u90zRFBfand8h4NQGqY8qK7B1ioHkEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773747387; c=relaxed/simple;
	bh=qXVwz+a7RXH6pZP4G1hmQAvL9cfyQMVTaqsy0blKXNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esObc8dco4zlk5iIzinRGHu8e3v+NwV9wpwzahRMmJCRFwLv+pD+jmUhQd0GsNrQntd7Y5Q1XaTEpEWNyTP0Uy7YUxD39x7bs2HQGPKfuk8FXuizfutx47zQl7cYZfVinDqw3uBnZ08in2Nnjnb/fnA+J2wiqjTes1XYo8Fd7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dwppiON6; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dwppiON6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773747382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VT+l0NoxtCN2POSc30sRXgy/SfJJNPBcPtl6tSMxKRI=;
	b=dwppiON6++TNajZIhgZNiFzR8/cX90H08HvMApiMyr1F4NW6yiLXBbD+CFIXFPOcDaI5JW
	GKh1yHSxEQUglU/Uao3Gw2tg9/XukokBGXTUVK/YBYZRniXj7kkWL0YKeU5E4OhvSCj0ow
	E84M77Y/Tvyx7cQYrH7ZQTaDJ8iQl3M=
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com,
	npache@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	byungchul@sk.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jack@suse.cz,
	jackmanb@google.com,
	jannh@google.com,
	jglisse@google.com,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	pfalcato@suse.de,
	rakie.kim@sk.com,
	raquini@redhat.com,
	rdunlap@infradead.org,
	richard.weiyang@gmail.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shivankg@amd.com,
	sunnanyong@huawei.com,
	surenb@google.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.de,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	willy@infradead.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	zokeefe@google.com
Subject: Re: [PATCH mm-unstable v15 12/13] mm/khugepaged: run khugepaged for all orders
Date: Tue, 17 Mar 2026 19:36:11 +0800
Message-Id: <20260317113611.94006-1-lance.yang@linux.dev>
In-Reply-To: <20260226032650.234386-1-npache@redhat.com>
References: <20260226032650.234386-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Wed, Feb 25, 2026 at 08:26:50PM -0700, Nico Pache wrote:
>From: Baolin Wang <baolin.wang@linux.alibaba.com>
>
>If any order (m)THP is enabled we should allow running khugepaged to
>attempt scanning and collapsing mTHPs. In order for khugepaged to operate
>when only mTHP sizes are specified in sysfs, we must modify the predicate
>function that determines whether it ought to run to do so.
>
>This function is currently called hugepage_pmd_enabled(), this patch
>renames it to hugepage_enabled() and updates the logic to check to
>determine whether any valid orders may exist which would justify
>khugepaged running.
>
>We must also update collapse_allowable_orders() to check all orders if
>the vma is anonymous and the collapse is khugepaged.
>
>After this patch khugepaged mTHP collapse is fully enabled.
>
>Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Nico Pache <npache@redhat.com>
>---
> mm/khugepaged.c | 30 ++++++++++++++++++------------
> 1 file changed, 18 insertions(+), 12 deletions(-)
>
>diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>index 388d3f2537e2..e8bfcc1d0c9a 100644
>--- a/mm/khugepaged.c
>+++ b/mm/khugepaged.c
>@@ -434,23 +434,23 @@ static inline int collapse_test_exit_or_disable(struct mm_struct *mm)
> 		mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm);
> }
> 
>-static bool hugepage_pmd_enabled(void)
>+static bool hugepage_enabled(void)
> {
> 	/*
> 	 * We cover the anon, shmem and the file-backed case here; file-backed
> 	 * hugepages, when configured in, are determined by the global control.
>-	 * Anon pmd-sized hugepages are determined by the pmd-size control.
>+	 * Anon hugepages are determined by its per-size mTHP control.
> 	 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
> 	 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
> 	 */
> 	if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
> 	    hugepage_global_enabled())
> 		return true;
>-	if (test_bit(PMD_ORDER, &huge_anon_orders_always))
>+	if (READ_ONCE(huge_anon_orders_always))
> 		return true;
>-	if (test_bit(PMD_ORDER, &huge_anon_orders_madvise))
>+	if (READ_ONCE(huge_anon_orders_madvise))
> 		return true;
>-	if (test_bit(PMD_ORDER, &huge_anon_orders_inherit) &&
>+	if (READ_ONCE(huge_anon_orders_inherit) &&
> 	    hugepage_global_enabled())
> 		return true;
> 	if (IS_ENABLED(CONFIG_SHMEM) && shmem_hpage_pmd_enabled())
>@@ -521,8 +521,14 @@ static unsigned int collapse_max_ptes_none(unsigned int order)
> static unsigned long collapse_allowable_orders(struct vm_area_struct *vma,
> 			vm_flags_t vm_flags, bool is_khugepaged)
> {
>+	unsigned long orders;
> 	enum tva_type tva_flags = is_khugepaged ? TVA_KHUGEPAGED : TVA_FORCED_COLLAPSE;
>-	unsigned long orders = BIT(HPAGE_PMD_ORDER);
>+
>+	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
>+	if (is_khugepaged && vma_is_anonymous(vma))
>+		orders = THP_ORDERS_ALL_ANON;
>+	else
>+		orders = BIT(HPAGE_PMD_ORDER);
> 
> 	return thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
> }

IIUC, an anonymous VMA can pass collapse_allowable_orders() even if it
is smaller than 2MB ...

But collapse_scan_mm_slot() still scans only full PMD-sized windows:

		hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
		hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
		if (khugepaged_scan.address > hend) {
			cc->progress++;
			continue;
		}

and hugepage_vma_revalidate() still requires PMD suitability:

	/* Always check the PMD order to ensure its not shared by another VMA */
	if (!thp_vma_suitable_order(vma, address, PMD_ORDER))
		return SCAN_ADDRESS_RANGE;


>@@ -531,7 +537,7 @@ void khugepaged_enter_vma(struct vm_area_struct *vma,
> 			  vm_flags_t vm_flags)
> {
> 	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) &&
>-	    hugepage_pmd_enabled()) {
>+	    hugepage_enabled()) {
> 		if (collapse_allowable_orders(vma, vm_flags, /*is_khugepaged=*/true))
> 			__khugepaged_enter(vma->vm_mm);

I wonder if we should also require at least one PMD-sized scan window
here? Not a big deal, just might be good to tighten the gate a bit :)

Apart from that, LGTM!
Reviewed-by: Lance Yang <lance.yang@linux.dev>
