Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324462;
	b=Oj3zkJxUs8+mkHx4VgtH1dwpiUXCRFUcW0+4w/BXtLNfv5gMpLvm+msJKDhDTaos9mVG
	 xp3NU7tfbNAdVY6GXrAtibVMSkf1uUI1OxsZ36o8XkkvWIu53Cu3AFug1biqeAP/Jl7RM
	 Fr3Q6VbMHPCd9F5IOuM+lIeDmWJnPWth5AdVl1Nf52nMHhvvInDu+cTMBeD8EZjHrfAr8
	 p1qOT90IH9ofrYXN0j2g9RiaqqG/VeMACGDreEOH3uzn3cYtl0y774DTK8SbVneKu6A6X
	 Sni8TaRF6w7BfGH2idBIC5Zd8uTmIrFJox3ksc29LMKgKQ4ihhtUrRZi77zQsZPUtvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324462;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aBOpD08FcZgUdX6sSVHpe8Q+9Wl4ICsDP/3Nx2bwfmI=;
	b=z9KM+/b0fmI4a7XYsC01zAri17KTJhhe4ByLxEmFANY+B65RF36CVqg4uHf9eTu2cT9C
	 mCVuLVihu460+tb9cpkF3x1iEptnXbztViZbCycB1aLJ57HHT0L9PSGwipdyMBh6L/FpE
	 lguPA8z6ixYnhxBp6G1/4q1szpArTCu7C3/UTh2w1cBMTCTp603ShfIIovzGVkvyjtoMK
	 Gov58yi0XVxOXTTawSli+9JNy9CvvNt5zncoGqZghpYj/Dn71xWbpLpw6Hem30qWI3Va/
	 piLCdKNeUTMUF9KJmVV9pk2vqKWJwx9mztHU11m3Tf6beycYrRPtueuhqT7fDSF+BdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OR+qLhkt;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53119606A320
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53119606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OR+qLhkt
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gvY+EFrn3LUi+QbgDmol5Cy3h4iylPle2lZKtkPoW2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794324458; v=1; x=1794929258;
 b=OR+qLhktr1EIyaPLVAyrm/NiuXlWjGdVW7HFby/zGsMn7+heEFKgnhY5oqQIGGm8Uv2LKXJR
 3aLuSxxJcdB+NuBSZ8sLXvUyyMOxxUn9ohJwpqP8f7n+m3AtTmK+o4t5UG3iAPP9WeWKkhCQvpA
 RJ6Ak9Vea2mgI0vDcg/HGq8A=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id dddf5df93d8bee57;
	Tue, 10 Nov 2026 15:27:38 +0000
X-Mizu-Trace-ID: dddf5df93d8bee57
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	jbohac@suse.cz,
	sourabhjain@linux.ibm.com,
	leitao@debian.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	zaslonko@linux.ibm.com,
	brads@mainlining.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory
Date: Tue, 10 Nov 2026 07:27:29 -0800
Message-ID: <20261110152731.2841707-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9d2d6f81-ceb7-48a7-99a0-18a0bb8c504f@huawei.com>
References: 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 18:39:34 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> 
> 
> 在 2026/11/7 0:51, Usama Arif 写道:
> > crashkernel=size,cma reserves a separate CMA pool. On systems that
> > already reserve several gigabytes with hugetlb_cma= (which is common in
> > the Meta fleet), the crash kernel cannot use that existing memory as
> > part of its working set. With hugetlb_cma=6G, requesting another 2G
> > with crashkernel=2G,cma brings the total CMA reservation to 8G, none of
> > which can serve unmovable kernel allocations.
> > 
> > Use existing HugeTLB CMA memory first for crashkernel=size,cma and
> > reserve dedicated CMA areas only for the remainder. With hugetlb_cma=6G,
> > a 2G request reuses 2G without reserving more CMA. With hugetlb_cma=2G,
> > a 4G request reuses 2G and reserves another 2G.
> > 
> > The full HugeTLB CMA pool remains available to HugeTLB and movable
> > allocations during normal operation. After a crash, the capture kernel
> > can use the selected ranges as working memory. The conventional
> > reservation is still required to hold the kernel image and initrd.
> > 
> > The ,cma option already opts into excluding userspace memory from the
> > vmcore. This includes allocated HugeTLB pages in the selected ranges,
> > which the capture kernel can overwrite. The existing dump completeness
> > and pending DMA risks apply to these ranges as well.
> > 
> > Have architecture code record the requested CMA size and perform the
> > reservation in mm_core_init_early(), immediately after
> > hugetlb_cma_reserve(). The HugeTLB CMA areas are then available for reuse
> > while memblock can still reserve any remainder.
> > 
> > Use the existing four range slots for both reused and dedicated memory.
> > Limit reused memory to the page-aligned request, account for dedicated
> > CMA alignment, and report any shortfall. Ignore malformed optional sizes
> > and reject requests that would overflow page rounding.
> > 
> > Suggested-by: Breno Leitao <leitao@debian.org>
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
> > v1 -> v2:
> > - Use existing HugeTLB CMA memory first for crashkernel=size,cma and
> >   reserve dedicated CMA areas only for the remainder. (Kiryl)
> > ---
> >  .../ABI/testing/sysfs-kernel-kexec-kdump      |  3 ++
> >  Documentation/admin-guide/kdump/kdump.rst     | 22 ++++++--
> >  .../admin-guide/kernel-parameters.txt         | 16 +++++-
> >  arch/arm64/mm/init.c                          |  2 +-
> >  arch/powerpc/include/asm/kexec.h              |  2 -
> >  arch/powerpc/kexec/core.c                     | 12 ++---
> >  arch/powerpc/mm/mem.c                         |  6 +--
> >  arch/riscv/mm/init.c                          |  2 +-
> >  arch/x86/kernel/setup.c                       |  2 +-
> >  include/linux/crash_reserve.h                 | 14 ++++-
> >  include/linux/hugetlb.h                       | 12 +++++
> >  kernel/crash_reserve.c                        | 51 ++++++++++++++-----
> >  mm/hugetlb_cma.c                              | 50 ++++++++++++++++++
> >  mm/mm_init.c                                  |  2 +
> >  14 files changed, 159 insertions(+), 37 deletions(-)
> 
> Should it be separated according to the architecture and framework code?
> 

IMO, the commit and change ins small and simple enough that it doesnt need
to be separated into different commits.


