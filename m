Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629CD32695F
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366572; cv=none; b=M2bpDjpgaCsRtLL5C3ayMnYWunza86ohjE9n+lymEXQUqaB3N0T/DrkuP7ZrnFUgkqfVuVuj0Bjf87GJ/V+q3uOyQmtFt27jZu5zDwonSJG8iRi2VhGL+GXV6ADec5J4iIqZfGcezYef0/8yYsglZDdcpHmXgvG+x7rN/aQJC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366572; c=relaxed/simple;
	bh=v/AKNkQz/8HhPJ27UHq6JwvQlC57RSINy1p5uSdIZJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0GFSuw3HOKsn+H5LFrqCpzV4dmoJzULcJGPZzpkwN68gNk+uqAhBuTtR0Q8VgIthJkExGK/F6C+Yqzwy6wKHMyn8E2s7FVZ3Nxs07u8aR+o5cT8h/3RQ2RdhmRRz9bMcu7Wi9VJ+GsA3SYtF9KWOLKRDdaxQ4b507hkd8PoS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qGlCqtSe; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qGlCqtSe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783366567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKOOB8091REAB20/dFjGniXL7whpPkyQEvMp5z3q8ug=;
	b=qGlCqtSeE5ojWLjY+aTSybLJw0mxSITB3DJVnpmTfBQREA1VJLO6hMgd1zZH4szY5bDLUB
	KFeYELcFDIVt4og1yBQzL0nktIuf7HOLEvoG6OHFtqTgCipiqffKHgEkuDcKyy8D7UvTXQ
	1Ljn7pxC/4i4JdbPY/7AA3XhlxmSIX0=
From: Usama Arif <usama.arif@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 7/8] mm/khugepaged: clarify a comment regarding max_ptes_none check
Date: Mon,  6 Jul 2026 12:35:55 -0700
Message-ID: <20260706193556.876676-1-usama.arif@linux.dev>
In-Reply-To: <20260706154500.39178-8-npache@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon,  6 Jul 2026 09:44:54 -0600 Nico Pache <npache@redhat.com> wrote:

> While reading collapse_scan_pmd, one may be confused on where the deferred
> max_ptes_none check is done. Expand on this current comment by explaining
> which function the max_ptes_none check is now done.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 3c6f1254deca..388045a524a3 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1728,7 +1728,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  
>  	/*
>  	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
> -	 * scan all pages to populate the bitmap for mTHP collapse.
> +	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
> +	 * is then checked again in mthp_collapse() for each attempted order.

Could be combined with patch 4?

  	 */
>  	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
>  		ctx.max_ptes_none = KHUGEPAGED_MAX_PTES_LIMIT;
> -- 
> 2.54.0
> 
> 
