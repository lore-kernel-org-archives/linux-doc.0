Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063493B42EB;
	Wed, 15 Jul 2026 04:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784090484; cv=none; b=iWnxjPOIVhQ1ijOIMPuoKrRTcQPPwJLrCe5s/AdwL4W77ACnwU0DsMlmilxI4KrFKtBVX3Pw4zcMFqmYsCtbiQnNoOBqFHEXF4MDDJkVpVjPVLgNf1H0G4F5/NUYeqUmU7fnb0foFPo1+iO2WqLTvMwWG9L3ZITtQBkME2on4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784090484; c=relaxed/simple;
	bh=c84O1i+DMJAEkO1hCNo5FEK6WcGpoxdtxC6E0RCnP0I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PUXDDy0iRd9Sc2XgDj5dGYzThhKzBOOp64aH8egKieYQhEAlB3iFg9X3VmCwzWi4fa4eXFdnvMEzsuYzW+Msrj13FOSzO7YQxXSzTOeUEpyBJ8gA4EF8CTuy5KAoNoJB1uTEtMGhZAkNyY0h9Fw00qT8Iqzd0sC9tXkm7KFtky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W2reuqY6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W2reuqY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6DD1F000E9;
	Wed, 15 Jul 2026 04:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784090482;
	bh=VXT4Aj8D0nBxWmP7AWbFJoCX0BgnTx7n4mqxGFSGxfY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=W2reuqY69WB9XdpPaCi4jiKfr5TQa2U+kzxJO7K9J0f3qhx7/IjmjTrR6e5qJyFE8
	 rm7HTdJqCChCdcMmL5cSFb+G6XX9EssXM6dN8TNTHvIdwczwXpEatn9/1Nlwr7siTF
	 mNm3eenCcrMwaXPZvYdLTxgsfQk1ibJvQh/DbA9A=
Date: Tue, 14 Jul 2026 21:41:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 0/7] mm/khugepaged: several cleanups
Message-Id: <20260714214121.090238f5f0f318f8d82cbaa2@linux-foundation.org>
In-Reply-To: <20260715025941.1571316-1-npache@redhat.com>
References: <20260715025941.1571316-1-npache@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 20:59:29 -0600 Nico Pache <npache@redhat.com> wrote:

> The following changes stem from a number of reviews during my khugepaged
> mTHP support series [1]. Some of these are minor code cleanups, issues or
> reviews that we decided to deferred to a followup series, or in the case
> of the more major patch of the series, changes [2] Lance Yang attempted
> while my series was in-flight and we decided to wait till later to try.
> 
> The first 3 patches introduce helper functions to increase code reuse and
> readability. This includes a per-scan state clearing function, extracting
> the young page check into a helper, and a count_collapse_event() function
> to reduce a repetative pattern used across mTHP collapse.
> 
> The 4th patch was the byproduct of me throwing Claude at all the
> comments in khugepaged verifying and looking for any outdated info.
> 
> The 5th patch is based on Lance Yang's commit series [2] trying to extract
> the PTE state checking into a helper function. This required a bit of
> rewriting due to differences after mTHP collapse was introduced. I also
> took into account the changes requested during his patches review cycle.
> 
> The remaining 2 patches were review points during my mTHP series that we
> agreed can be deferred to a later series.
> 
> Thank you to those whos reviews and work I leveraged to achieve these
> cleanups.

Sashiko seems to have a good point about [5/7]:
	https://sashiko.dev/#/patchset/20260715025941.1571316-1-npache@redhat.com
