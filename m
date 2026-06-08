Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390832B134
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893296; cv=none; b=Bc195rRLJGSXeWcXPOEvKWcVpmmg2/TrFjRxqqBo9hHI8ZTXtYJJLYJg29ye5UAJOMw0P5LRYbYYi7kJeq1PraGhGwBc9LJ9tbTHMXy/5aPU+0FGHm/hv/IBP108z4A2nslaZyU2LXXuBOuzx0ScI98mmJIdJQW+UJIBto4olVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893296; c=relaxed/simple;
	bh=LEGSgRbxhASAeu5c+j0JYp3vSZy8pgb96WObfdHnflg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8ESjDi34tLxiQGu3W9P7LCSotJRiNNDd9o79SLr+d49NWR3wRByW3gjqoDxRFISzhHgG46zpzJnn5DiSspj4U7mS/bCufWSQPfa0OpuTlqbZj2bvS72O0vH2xnE7lq1+ad/8gHOLV6/CG9Vesh6Z5/c1+U9Nr65LR5niOhhS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VPOCIBhM; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VPOCIBhM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780893281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEGSgRbxhASAeu5c+j0JYp3vSZy8pgb96WObfdHnflg=;
	b=VPOCIBhMy3bhMys4tjIwpTNUtzP6MGv+Nn6NObx2oWwjAimmM3rk21c2FPdqpv4YaDBpr6
	0+eQK5sDLTwER1nbC9LUzt9Lo5gKkA2lIBYpEHSVZAfPNQXBG+/72ec7a4XSNLj89zDlRT
	6qmoBbe0Ok0yW6VRRc/UfKW3DXnFbbc=
From: Lance Yang <lance.yang@linux.dev>
To: npache@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
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
	liam@infradead.org,
	ljs@kernel.org,
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
Subject: Re: [PATCH mm-unstable v19 05/14] mm/khugepaged: require collapse_huge_page to enter/exit with the lock dropped
Date: Mon,  8 Jun 2026 12:34:24 +0800
Message-Id: <20260608043424.55432-1-lance.yang@linux.dev>
In-Reply-To: <20260605161422.213817-6-npache@redhat.com>
References: <20260605161422.213817-6-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Fri, Jun 05, 2026 at 10:14:12AM -0600, Nico Pache wrote:
>Currently the collapse_huge_page function requires the mmap_read_lock to
>enter with it held, and exit with it dropped. This function moves the
>unlock into its parent caller, and changes this semantic to requiring it
>to enter/exit with it always unlocked.
>
>In future patches, we need this expectation, as for in mTHP collapse, we
>may have already dropped the lock, and do not want to conditionally
>check for this by passing through the lock_dropped variable.
>
>No functional change is expected as one of the first things the
>collapse_huge_page function does is drop this lock before allocating the
>hugepage.
>
>Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Signed-off-by: Nico Pache <npache@redhat.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
