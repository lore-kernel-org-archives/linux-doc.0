Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B57D379C55;
	Wed, 12 Aug 2026 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563602; cv=none; b=uLzkEcmBfEEL7kHZK4gpWmkzx57oFH+7UHNu1cnPcrtI3axo8BysO1Q/Xs33z1qWTNKAf0YG0PuOn1Z2D40rBZsZhkUuuhzwGDPqZzYZnno6SVTp63y1E0SNcpbgoCeG4IAgK0F0fwfBSaCs3LJ+gwvZWwTVXrJnbMQguN8c808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563602; c=relaxed/simple;
	bh=FTHAe+5GNibfE2sRWIC9oI01fsGHQ9AKF3/QqGdXlvs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Rnwo7xHuZe377/vLS59Vp4yuMA5ToqpXTCNNxNL4iVnCaCeguHq904gzGML6Y5omaN2b1nHZCxP/WmGYkyfeH0CyjpjmuXhZq2XsoHIqSoiYcJ8rU1UKT2dOMhcMuhD1b1kg/O/EZ1OOfo9Mud1ec53l0WLC7KcjTqD09pQDxYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=grY6uH5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="grY6uH5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94D61F000E9;
	Wed, 12 Aug 2026 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786563600;
	bh=+V5LRdd/R0h7cXLztn08lUOOQg5FGK1eTSy1m6UYH7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=grY6uH5B5e7oU07jxKUcXRUTvgah3znWUvLf/RPTAQ79zlaNVQQXG6MjeAD/xOE2P
	 WpFg6jk41ydmKaN6fruJLpLygB6f9qaTPylVu9zqffvl5udMPOQVWywIA5d8drCxQi
	 YDFel4GnlHOgYngShUjJiUWjsxiKDv1LcfAiAA6Q=
Date: Wed, 12 Aug 2026 12:39:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Lorenzo Stoakes
 <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 5/7] mm/khugepaged: Refactor the PTE state checks
 into a helper
Message-Id: <20260812123959.d4e31d68e8db85b9fd3981eb@linux-foundation.org>
In-Reply-To: <f1371b4d-6e98-4699-8c1b-7612f6d70f02@kernel.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
	<20260811-khugepaged_pte_refactor-v4-5-ddac39d61c4a@linux.dev>
	<f1371b4d-6e98-4699-8c1b-7612f6d70f02@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 10:40:08 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 8/11/26 14:48, Nico Pache (Red Hat) wrote:
> > For anonymous collapse, the collapse_scan_pmd() and
> > __collapse_huge_page_isolate() functions share a large portion of their
> > logic. These functions both check the state of the PTEs and verify the
> > following:
> > 	- max_pte_* values are not exceeded
> > 	- uffd is not active
> > 	- lazyfree properties
> > 	- non-anonymous
> > 
> > Merge these checks into a helper collapse_check_pte() to reduce code
> > duplication. We also add a helper struct for this function called
> > pte_check_context which allows us to pass the required parameters in a
> > clean and elegant manner.
> > 
> > A helper function is also introduced pte_check_fail() to provide a clean
> > interface to set the pte_check_context failure results and return
> > PTE_CHECK_FAIL state. This helps reduce code duplications across the new
> > collapse_check_pte function.
> > 
> > Two slight modifications are done to the original functionality. We now
> > warn (instead of crash) if the anon test fails, and we leverage the
> > vm_normal_folio function instead of page->folio, this should be
> > functionally equivalent.
> > 
> > No other functional changes intended.
> > 
> > This patch is heavily based off work done by Lance Yang, but modified to
> > deal with conflicts and feedback received during the review cycle [1].
> > 
> 
> TL;DR, I think this patch here needs some more work, and we should not fast
> track it at this point.

This has been floating around since July 6, so it's never been
fast-tracked!

> @Andrew, can we delay this patch here for this merge window? Removing it from
> mm-unstable shouldn't conflict with any other patch in this series.

np.  "cleanups" aren't high priority.

I'll move the entire series into mm-new (and hence out of linux-next)
and shall await developments.

