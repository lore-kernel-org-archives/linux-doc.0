Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2DB4FC8D0
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859445; cv=none; b=bPgf5H6kaxtDPYK/9/sZA5+iGfJoiQidn1tqmzAv/InNryJVERrn1ZGbC0mFw/sD1hDvJjT26I0JJp7mXTySOlHll15Xh1wrBXtxUTA8872N3NJQn5XQcb4HzMbF9LHrzY0SEbxZtoNZBJY9dGkwSKlpvBDoZdThpDAipis8EQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859445; c=relaxed/simple;
	bh=Lq4ARpMbanal89TxHuI1tA2YfFgMGpzO1BWcDeL62IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcSCI0pTggyRo0U+ixQrZJlECVXOHBhwFQEacdorrZ/8tAS2cyPaTFNqshy54EWMTQMi/XiPVO3XmwmNH0XX0IeoP1iowStGGjezjP3Zz7dnkePIfxRGmShQKGonYWG/CPTzcDNXKRoAUwv8ko1+EIEI02iinxmqrOFxpTRAVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q1Wlwc1t; arc=none smtp.client-ip=95.215.58.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q1Wlwc1t"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Lq4ARpMbanal89TxHuI1tA2YfFgMGpzO1BWcDeL62IM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788859441; v=1; x=1789464241;
 b=q1Wlwc1tM+J8SYWg8S7iejZ2/QZ2aXPSQnppHpP1bMmlnNWxW5wCpgLIG40TPtcw7RIBi7Rj
 LvV+ThsluTG0LBe0G4Spoxikele24s034tqj3W1wtLi+OMSKwfOxPQrmCZcfw7AMk4H/WWmCHw2
 hpglh/bDvK+DiVFYi6ZkgXhU=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98e59e83dd11dcc5;
	Tue, 08 Sep 2026 09:24:01 +0000
X-Mizu-Trace-ID: 98e59e83dd11dcc5
X-Migadu-Flow: FLOW_OUT
Message-ID: <bb30518c-9046-418e-b190-9f3f1b542cbe@linux.dev>
Date: Tue, 8 Sep 2026 17:23:54 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] mm/sparse-vmemmap: drop unused
 section_nr_vmemmap_pages() arguments
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-11-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260908030335.96549-11-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 11:03 AM, Muchun Song wrote:
> section_nr_vmemmap_pages() no longer uses the altmap or pgmap
> arguments, so drop them from the helper and its callers.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 10 ++++------
>   mm/sparse.c         |  3 +--
>   mm/sparse.h         |  6 ++----
>   3 files changed, 7 insertions(+), 12 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

