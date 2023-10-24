Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8C2107
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pb/4pTPT"
X-Greylist: delayed 543 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 Oct 2023 20:27:31 PDT
Received: from out-209.mta1.migadu.com (out-209.mta1.migadu.com [IPv6:2001:41d0:203:375::d1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8FD98
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:27:31 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698117505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jv5wXdaC3y/S8EnSqXGexSgMX0Jo/OO/p9IJYjDjWjI=;
	b=pb/4pTPTJob6cVNmJP/eiunXtJq5Nj5DXabg0FA+SZ0gGWycYhyNiaXuLeIh0yf97FmDjH
	Xtfe+JhVp+2N3C9rq1xwxHzYD83Fx4ULAFI81ZFrlSfuGfP6x8WWWJHaQDSzMK7ukhvm4/
	qqyf3b8qDHbLy6ZMi5pXfoSAt/UxikY=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH] mm: hugetlb_vmemmap: fix reference to nonexistent file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20231022185619.919397-1-vegard.nossum@oracle.com>
Date: Tue, 24 Oct 2023 11:17:43 +0800
Cc: Mike Kravetz <mike.kravetz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux-MM <linux-mm@kvack.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wu XiangCheng <bobwxc@email.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <3D383A26-5F91-43E7-8969-C2A3E380D2AA@linux.dev>
References: <20231022185619.919397-1-vegard.nossum@oracle.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
X-Migadu-Flow: FLOW_OUT



> On Oct 23, 2023, at 02:56, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> 
> The directory this file is in was renamed but the reference didn't
> get updated. Fix it.
> 
> Fixes: ee65728e103b ("docs: rename Documentation/vm to Documentation/mm")
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Wu XiangCheng <bobwxc@email.cn>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

