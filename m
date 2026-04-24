Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A613E1D02;
	Fri, 24 Apr 2026 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047923; cv=none; b=Ot+5Xv1pS+BePTKJUFRmKZrOShX7V1/m/MCF+7cZwA75GxlBTsysoTO1w/xmUVSoTl2pWXVIuzvaySWh42fBmVbma+WFhlvzqlqdDSOkgaWjOrflyhMzfLl7vXUBzBd23eCB5caTWzJmf2R2DonF5gyAV/cZctIIa39P3EuLTV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047923; c=relaxed/simple;
	bh=eGhe9aNnH5LnKxC4OpgHMgoNYHmd5+rksM+bwGfBi2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzHwCa1WRt/4jK5a6HjeVfgcegmgMXLipwLohmTIwxGOp7JfnXA+2WXcrzh4f9SGtCJBQjeHZav2x86qiqtB0bFzQ5A5UVhQaA7ghBRyEaiJ1ygKgTCNUVHX9lJd1g0Ry7ZyjIcFl7ecKtH4jfjGq8JSjBxB704Ia4JHeFZqESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqzM5Bpl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqzM5Bpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AC0C19425;
	Fri, 24 Apr 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777047923;
	bh=eGhe9aNnH5LnKxC4OpgHMgoNYHmd5+rksM+bwGfBi2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqzM5BplaihQXibm6nlVaBDDzmIOWIvxhK0wlXszfxFg5Pw05CvTodjLQN6z6pRYz
	 nANf/DnX2Ocy7PIgOh414gzXsvylzZC5lJzDH0iVw3/Vi41Ajzl6SCsvarMlcpcwSd
	 3NICzOyF4HLY9QslihWNlh7qbuC9kPbsIts0K/k7zWM+lTGhX5AgwzCTIfAgJfoqA7
	 YYPSfO0UTHNJq2yOXCVPYU+h0/UXpHqkQQ0BXofd3PqVTzHN42SMUYV/ii0XxfKlsB
	 YQlhb+i+f07L7K36MV7c1/GePQiYPFKssXHt/NpvHdqF7S12CNTIOUTcjcZvtO7oFd
	 53gsmbbEeEl2g==
Date: Fri, 24 Apr 2026 12:25:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net,
	ljs@kernel.org, Liam.Howlett@oracle.com, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, skhan@linuxfoundation.org,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/7] mm: dual-bitmap page allocator consistency checker
Message-ID: <aeuZcY0u_7PIQb6R@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <b001932c-e376-462e-895a-5e4a9c7c0dc5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b001932c-e376-462e-895a-5e4a9c7c0dc5@kernel.org>

On Fri, Apr 24, 2026 at 05:42:53PM +0200, Vlastimil Babka (SUSE) wrote:
>On 4/24/26 16:00, Sasha Levin wrote:
>> Existing memory debugging tools - KASAN, KFENCE, page_poisoning - detect
>> access violations and content corruption, but none of them can detect
>> silent corruption in the page allocator's own metadata. If a hardware
>> bit flip corrupts an allocation bitmap, the allocator hands out a page
>
>An allocation what? The page allocator is a buddy allocator, it has no
>bitmap to track free/allocated state of pages?

You're right, the cover letter is misleading there. Buddy doesn't use a bitmap:
PageBuddy lives in page_type, the free list is a list, and page->private holds
the order. The dual-bitmap is new metadata the feature adds, maintained from
the alloc/free hooks.

What it actually catches is the same PFN being handed out twice before it's
freed, or freed without having been allocated. Not every kind of buddy
corruption shows up that way, but the common bad ones do. Corruption of the
bitmap itself shows up through the complement invariant.

I'll fix the wording in v2.

-- 
Thanks,
Sasha
