Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E3E3164A9
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941501; cv=none; b=c+WH7kD/RSXpZtUgIfGKMhgvpiffMmskeb/TmFOIQoQtZym2296J6+qvYQDddzX1QaOyOlXXZnaS1+xdmIft3Yw0Hruu/bQNd37r+tSlOX0bNyQP7RkQ7tU51lG1uRUY4ZaXpz/PNkmV6GeK6WcfisLxS4sgU/jomqdbDEI/3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941501; c=relaxed/simple;
	bh=xOHwnTiFuri86GASwSq3CIVJEuwTbQrjluV8yec3aok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crRpH1zJC/g6O6NRJQKZGLJG9PDSGASlH4C+WzUqstpy54owByEa/HVfc79/AhX8z0N2t3nzeSUS7V+A0Leb/qSMQatM2cIzU0IPtCGIwgf98HZQVg6duif5A80A3WXL/wfQo2M2/xQHCtjEUUWFbxcwxhPTm8opUwXT4K3zQss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hsAfWcA0; arc=none smtp.client-ip=91.218.175.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hsAfWcA0"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xOHwnTiFuri86GASwSq3CIVJEuwTbQrjluV8yec3aok=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786941498; v=1; x=1787546298;
 b=hsAfWcA0Zxbnzbp+ahbPMk5b1yO3r6PmhKEsT1uWb1uuKJe6eUfKxa9bVLN+rOA5FDcxejLu
 LJh1DBGhszV2veB/SMBxbS5jlPqfXsJ8l8oiSbv3ynh93oxwEBINQtnI4txGzEqjv8bm+Ii1nxb
 5LnA+RPcre8gegpOg/QKklfE=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 47ac407481a84769;
	Mon, 17 Aug 2026 04:38:07 +0000
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: nico.pache@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v4 4/7] mm/khugepaged: fix outdated comments
Date: Mon, 17 Aug 2026 12:37:55 +0800
Message-Id: <20260817043755.84350-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-4-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-4-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 11, 2026 at 06:48:36AM -0600, Nico Pache (Red Hat) wrote:
>Fix comment in collapse_scan_pmd() that still described the old
>folio_mapcount() > folio_ref_count() check and a "512" false-positive
>scenario. The code now uses folio_expected_ref_count() != folio_ref_count()
>which doesn't suffer from the same limitation.
>
>Fix comment in collapse_huge_page() that referenced ptep_clear_flush,
>when the code actually uses pmdp_collapse_flush.
>
>Fix comment in __collapse_huge_page_swapin() that referenced the old
>function name khugepaged_scan_pmd, now collapse_scan_pmd.
>
>Also clean up some simple typos and stale terminology (mmap_sem ->
>mmap_lock, PG_lock -> folio lock, page -> folio, grammar).
>
>We also clarify a comment regarding where the max_ptes_none check is
>deferred to in mthp_collapse() from the original collapse_scan_pmd check.
>
>Update all comments that references a function to include parentheses.
>
>Acked-by: Usama Arif <usama.arif@linux.dev>
>Assisted-by: Cursor(claude-sonnet-4):4.6
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
