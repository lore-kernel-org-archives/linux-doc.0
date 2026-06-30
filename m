Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4933E34B;
	Tue, 30 Jun 2026 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845108; cv=none; b=GiFta5aOFXYCaKBF8OWdovIMa+39gcUVkw8UpnC7jn7CRviVpZxNRi67INBxPLDrWR8/rZGD1fTL68/edUbkmELQy75xQMrn4s9yIAF8cdwd1ybKo+fjymtWgXGpanjW54XdSR4Vz7s+HYmQUbtOZ107ibb4f44COKLiCcVtssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845108; c=relaxed/simple;
	bh=HWuef1dlSVTJu7gF5ZW1fEGsnqAMyGvK5B5poXvEiJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft7bAWFtqhgOgbCt/EVpbnvz2Cd78yosbS57IQdTHnb+NvPu1m1QVL3NlMxbPEtjcN/+jdu+QHLH0C7WGFRWJb5pqLFMmEScTYVjMbdBfu5M+bt/wzvlNuk/k8rOicPpSDScxWRL/XYWO/chFWzCjC0QSgTFO+ejRvETj0b/GV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CEPvZMAE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CEPvZMAE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jReEXMEt9w7e8G03i0VZobwWvCQscFhS+MP89RBwgUY=; b=CEPvZMAEUl5oWd4tHF/wDMOX+Z
	V/7/eF8tTgTAjXDeLq16jkyOqccJFN7TCrkdiUJxXrOlZeSBmj4xmXWDSFgnPtjmwN6krQWCS9td9
	OCrBkvICmi8YoAsgTYlXO/0sivMgUtErAjsNqYqFC9JYj6+0w8j4su2Ftxd2n62XJPCAoVw84iJyl
	tBWqAFrGXnnvJy5G/vjIjZIiPVvlHcJ+DDopZDCd2UrYtJn/6N7GZYo+H24+5UdClwS0lvkSlZJLy
	c96SrpxUj7cVrPtSRerCMsGs5pdXR2S41++hC1UW0oYybqIk7b8bCXEdDpon4STiYT/Uabl9XA6Hn
	cpLP1XvA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedRo-00000005O2g-2yzs;
	Tue, 30 Jun 2026 18:44:40 +0000
Date: Tue, 30 Jun 2026 19:44:40 +0100
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
Subject: Re: [PATCH v6 2/3] mm: rename swap.c to folio.c
Message-ID: <akQOmJOy1TYrhlq5@casper.infradead.org>
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
 <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-2-d4f648963382@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-2-d4f648963382@gmail.com>

On Wed, Jul 01, 2026 at 12:27:33AM +0800, Jianyue Wu wrote:
> @@ -17057,7 +17057,6 @@ F:	include/linux/swap.h
>  F:	include/linux/swapfile.h
>  F:	include/linux/swapops.h
>  F:	mm/page_io.c
> -F:	mm/swap.c
>  F:	mm/swap.h
>  F:	mm/swap_table.h
>  F:	mm/swap_state.c

I would argue that folio.c is now not part of the "MEMORY MANAGEMENT -
SWAP" responsibility.  Agree that it's part of the LRU maintainership
still.

