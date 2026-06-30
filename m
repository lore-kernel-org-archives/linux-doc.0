Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F722264A86;
	Tue, 30 Jun 2026 01:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781971; cv=none; b=Nw1MQlmaX/Y5YKdOE9PipEPVXeSHvaU2DVRz5qIoJOLiu4Jb8CbupdIgedRKPzypmCvoti/f5qtVVovVwggtm0D8EkLKLLitA1pv+c2MSuaKyE+gQLpipJMTRdooAbV+XC9iijOgqrCnGGwchFrriAr0j+ljtgjUmiSWa1JSwPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781971; c=relaxed/simple;
	bh=9/QSqUsrlyhwCAocMiKbQUKduCLyGb8BZZwx2oSk+xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0ccd+McneF+yJahywTe6GRtdWhg464tAoT+BTPILFwloz0LJBucfPZlheCvPlaTQD6KgqEv2AoLaHE7QI8rc70UbjzYttdrEXcsQKbbHG4S7pGlkCfvcXvQa+rW34Aa/clg1X8urKJ9Eii4AivwRNwY92OF6j6rxm36sLj8EaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JyaUNIkL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JyaUNIkL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=inHqJ400rPcs/rHocBQUUyc71tWcLt7G6vrd2M4T2zQ=; b=JyaUNIkLY57rBH8S+mg/T3Sbgj
	JDSh7P0QK0847LxoRYy34jt8lO2+YgI2mCiW9hZbuwhqhzJ/YdgJyyV9YbFfYWMzvZis8V0tBKT58
	4vI3NaaZz29zTfu/V5JMnFlf4nDSQh5FgXSoa8QQjOCupPb6gJ4Kn7of6hwkfPwgWiS8WBCe/5p1n
	Ykv3+Ri1UyBdByCbWnMOArG2uPnT7IvRpUWkG+76UYzqFRU+OsWnk6wfDNHctZyoay/bP28DPnXpe
	aEvQvSYD+GDo1w499vc2DrXCFrTpgPnTejm5Kurk1d2OVZlfmx15Lxu6ILocFhYlb0+oY/yrDsV2X
	DheBXclg==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN1S-0000000452m-3j2W;
	Tue, 30 Jun 2026 01:12:23 +0000
Date: Tue, 30 Jun 2026 02:12:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] mm: rename swap.c to folio_lru.c
Message-ID: <akMX9hoSgBmulBzv@casper.infradead.org>
References: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
 <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-2-4627aba8ed1e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-2-4627aba8ed1e@gmail.com>

On Tue, Jun 30, 2026 at 09:08:18AM +0800, Jianyue Wu wrote:
> Rename mm/swap.c to mm/folio_lru.c so the filename better matches
> the code's main responsibility.

I said I didn't want this.  Rename it to folio.c instead, and then we
can move some other things there too.
