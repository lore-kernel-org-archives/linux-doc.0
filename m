Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E536D513;
	Sun, 28 Jun 2026 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680606; cv=none; b=rP7uG3xSdp0EZ2w+nFXhexxfiz2Slwonsty5Z7ZWZnVMERYaxxjbrgDryXCwZsuxaNrGz966RySt4AcuZKiwITrzk8KZlXmBQpk5ABR27pDklhjSHJwi+THeiRqXk86HoLGDTFJJ7tNqY3EiXSorPVtk8lBDnPO4x3nTsc49g1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680606; c=relaxed/simple;
	bh=HtLx3MtE7bDH2wLmsxRez3o4DNEkkCQ7M1lA1NU+qUI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DHr2IM2zBqYXRcPH6PYGzumDh8VUZR1qwrWp2TKqn1FtwkNETLSmIeL9Ewc5veSiAsLqshn5aeOzulQCXDv6Zl3j+aABOqvf3ZXTYNIKJ1KCJGXLImSy+xqjS1scxGdDKGLFf/ygBlhochaubETjkG//PUou0ePhU6g0QjlOX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45231F000E9;
	Sun, 28 Jun 2026 21:03:23 +0000 (UTC)
Date: Sun, 28 Jun 2026 14:03:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Johannes
 Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal
 Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mm: clean up folio LRU and swap declarations
Message-Id: <20260628140322.c3ce1a7428d6c6d021069e7d@linux-foundation.org>
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 03 Jun 2026 21:05:31 +0800 Jianyue Wu <wujianyue000@gmail.com> wrote:

> The previous version moved the folio LRU helpers out of mm/swap.c in
> one step. Based on review feedback from Johannes, Baoquan and Barry,
> split the cleanup into smaller steps:
> 
>   - move the page-cluster sysctl next to swap readahead in mm/swap_state.c
>   - rename mm/swap.c to mm/folio_lru.c after the swap-specific bits move out
>   - move MM-internal reclaim declarations out of include/linux/swap.h
> 
> After this series, swap cache and swap-in readahead stay in mm/swap_state.c,
> folio LRU helpers live in mm/folio_lru.c, and MM-internal reclaim/workingset
> declarations move from include/linux/swap.h to mm/internal.h (public LRU
> helpers used outside mm/ remain in swap.h).
> 
> The first patch handles the swap-specific page-cluster state before the
> file rename, so the rename commit only carries folio LRU code. The last
> patch keeps the LRU helpers used outside mm/ in include/linux/swap.h and
> moves the internal reclaim/workingset declarations to mm/internal.h.
> 
> This series is based on Christoph Hellwig's swap_ops series, which
> moves swap I/O dispatch behind swap_ops and leaves mm/swap.c with less
> swap-specific state. That makes the folio LRU cleanup more natural to
> split out on top.

Patchset looks good and is well-reviewed (thanks, all).

But it's a little old and Sashiko was unable to apply it and I'm seeing
at least one (probably trivial) reject.

So please can you refresh, retest, gather the ack/review tags and
resend?

Thanks.
