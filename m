Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F0386550
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904485; cv=none; b=ekvn9KKPEm6yU33ztzqtpVherfb++uJ6adRAqyNFye9WA7np9HzuU6CrjIMrklh+RWzrjNbhnLAYI0DjSYfq0BDQZcmGCVHmYipEjAUOgV6QFwa3wD31RcJYAzEFVX9f0crkSkzY4GhL8dl948y3LD0EcQGsIzx2JKyNb/ZutsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904485; c=relaxed/simple;
	bh=CyzJ9u89Ow4fnNhFsEexe5yqj0DRaCFbLEw4ahhTDo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koNnl2c9rrqyhhvT1me5YCZ6SGSEzNlec3/EFsPi+hsFIbh60iwov7rmJSOmbzyATagxQdLUoizVTI2DXCjGI6kCXyef7vj2HWWvHhtkicyJFaWli55r8iVY0QMX2RIKYoDoG2sK/wbho0mP5T8I/a+uzf8ErwlyrEP2Yb9Mqwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UOQYKXQD; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UOQYKXQD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780904481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CyzJ9u89Ow4fnNhFsEexe5yqj0DRaCFbLEw4ahhTDo8=;
	b=UOQYKXQDWMlxueS2KveD1eFP9YEyiTVoQNYGe9ZCf7hsfPLtvsZl3JZRIEYi9Hfn472pCH
	n6gJQpBOq/1a+eHXexJrfeCgJAEOqbloKJHSlmTRkj5YoBlTDuZSriZskIOMh920Hrzmuk
	ICeMI+zNbtQtgAmUmiMn8rBsBEStbO4=
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
	zokeefe@google.com,
	bagasdotme@gmail.com
Subject: Re: [PATCH mm-unstable v19 14/14] Documentation: mm: update the admin guide for mTHP collapse
Date: Mon,  8 Jun 2026 15:41:06 +0800
Message-Id: <20260608074106.2945-1-lance.yang@linux.dev>
In-Reply-To: <20260605161422.213817-15-npache@redhat.com>
References: <20260605161422.213817-15-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Fri, Jun 05, 2026 at 10:14:21AM -0600, Nico Pache wrote:
>Now that we can collapse to mTHPs lets update the admin guide to
>reflect these changes and provide proper guidance on how to utilize it.
>
>Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>Signed-off-by: Nico Pache <npache@redhat.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
