Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A971EB5CE
	for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699436; cv=none; b=D+4mzTebIye+SNg4afBGODx5UMzqqFLg99nD//tDEJq9WbIqImYJnec+OSGgLKxuR2HjTtOZVBgztWwalyJD0uxqbNXj4dp6EoZvR46K+gL0zjAuWAyYq5Bw2xdDRiw/FMruaGrQoIfXrH5YtRNIqZWFJ62fJnO9YFvB90ZILRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699436; c=relaxed/simple;
	bh=+imE8epIy9NkalbHxs3meJ15GdHHssni65dx+hm5PNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuoR73Ic0JFTfGAyzDhmHc0kKvHCLQtBtaEBpFSBtoWM9dzX4DybCd6/F8Gu/wi6dQMK+h1DbyFK9TZ25ImVoddrPMgQLnAKAlS2pVfvcCzUv6HAtSNfViRmO0P1/FaYSgf05xreXfhXYEVjF89C/ulVN3bYwmFxlU/LErPFoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TolJBDx7; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TolJBDx7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776699422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhKXz21irPByGBa7VXYiJn8tYPqBAC8fQ5GrPsI59Tk=;
	b=TolJBDx7xE/H9YRYEOaaa2c59QbAENz915P8NEt1sDN2YLJOzN6LkfmvImpF9Dh5/0Xs6+
	gf9i+ca+ZqcN2IT85QX0vNIVoGwAprWrxdRqy8IuT2/vM2+BprjQmXu6llX+CEoU0R5Swi
	XILVICuLYFXBJDmwoW5IMq2RfMhlvs8=
From: Usama Arif <usama.arif@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
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
	Liam.Howlett@oracle.com,
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
Subject: Re: [PATCH 7.2 v16 06/13] mm/khugepaged: skip collapsing mTHP to smaller orders
Date: Mon, 20 Apr 2026 08:36:40 -0700
Message-ID: <20260420153641.215894-1-usama.arif@linux.dev>
In-Reply-To: <20260419185750.260784-7-npache@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Sun, 19 Apr 2026 12:57:43 -0600 Nico Pache <npache@redhat.com> wrote:

> khugepaged may try to collapse a mTHP to a smaller mTHP, resulting in
> some pages being unmapped. Skip these cases until we have a way to check
> if its ok to collapse to a smaller mTHP size (like in the case of a
> partially mapped folio). This check is also not done during the scan phase
> as the current collapse order is unknown at that time.
> 
> This patch is inspired by Dev Jain's work on khugepaged mTHP support [1].
> 
> [1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.com/
> 
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Co-developed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Usama Arif <usama.arif@linux.dev>
 
