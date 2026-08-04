Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9923BD05;
	Tue,  4 Aug 2026 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885126; cv=none; b=QOrEM1k6lxKyaDwKFXLViGrsknaSYstb67f+o50dC4nECmhhOUGDO4mHTq7fXrhY8xN57NVC+Ud410jnmbaupiCtTZW7SKkz9TGir/vB4NSHpJo5j4VKnZcS6qCGe8IRxTNj/PWTI/tVm8+wvdy03kTzaRCpAzo0TF2pdjNQyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885126; c=relaxed/simple;
	bh=U/MfI8AmED2nppgJIxRbDDD7w1Gpqu+tOqDxnw07sC0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JYlG1aaA/CgfBnCp3XIER7sJuxT98df4NJoC/Qu3G/mlMO0TILAtaY78GhWH7FZCSTeTH+xIfIyBVLRu5aFqEDN+JJjyqpGIC7khrd2ueMua5eX5SEtCyR13bx+ataMTfVRA+5fzy21L7B6qVthyTTY6vgzDJAv1aJQlIpeWHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qdlse2fh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qdlse2fh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3DF1F000E9;
	Tue,  4 Aug 2026 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785885125;
	bh=h4QTWJQpnYCgvZMOp8Lec9E0diWM87JoBrgrWTI3fCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qdlse2fhDvX1iCH+zgWT3U3of8I1Z+o+aamxuKtzmTGoXI59i313At07ihexnsu/m
	 g8hEgtaAnrvi+IZR+Ve5r/boz1nLIcfZf97yrtcCd4uRq2vwUTx9x0sFepV+kI6eMD
	 MTAsoJ7ffNw+2qTiBQchiyETAYCVEbLdtnNI2UFU=
Date: Tue, 4 Aug 2026 16:12:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 0/7] mm/khugepaged: several cleanups
Message-Id: <20260804161204.140bb3b8e482c43cbbacc2bd@linux-foundation.org>
In-Reply-To: <20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev>
References: <20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 04 Aug 2026 13:24:58 -0600 "Nico Pache (Red Hat)" <nico.pache@linux.dev> wrote:

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

So "no functional change intended"?

Sashiko had a little doc niggle:
	https://sashiko.dev/#/patchset/20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev
