Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B441C2F8;
	Mon, 17 Aug 2026 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970299; cv=none; b=R9679voOyRzV5NQ+d1xIR6gbmGAXvfnWnErnbsp7DEyUdicMvLXHdeBAPT3ApywNODq61uK7ENgrWdhhYDNA1gJUMCIOe8+5veMmxmg7okvwEZNch4dxt1HzXLEawgyZEEEzXxZX/91Kfw+J2HD/ANezq69V1gt9TqImyoRv3ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970299; c=relaxed/simple;
	bh=R3jSGdT6H7vGqQcc+28ZLhoSf8Jmq75jA6G2MuTQMGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZThXKQ2WPMcgWoORz8l0bdf10NcY3o5MmwvL1AMYaS6kuMc95zSWNmqWB8BcfcIzCsWCJqmplA13v/oVwDVkSK1cMXQfcoF3WO0Zq8c3fmLLYby/zUQ72VeuS/loMaJicudYteet5qFyK6iVOUYaEKX3KAynQv+AOTUD0T0xGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nt9JknIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nt9JknIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE791F00A3A;
	Mon, 17 Aug 2026 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970295;
	bh=jan4OzxJD6YHTXR8sL9zOUPXJbJ02yzXDRqgLQqZmDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nt9JknIUypwluAT0Ji5LQTyrFOwSkVwDvkrda5dvgtXQy7U9YgSYXXEWUionZIWjL
	 Ba/+IVsdJRP9OzsBQSOpGKoJVfI48sw3KnPL40Mm6WMf2wTBtYI5phjNgur1BlP3Fj
	 OWL6PNOCC9KpfAQZ/6O7YGY2D+LeFJhdbgLvEOoY7uFT05MfMmwcrD7nqUgz2jUXgk
	 g9ehqX7GSzo2ILJHxeI+1xHdHXJgoFqwEbXljMvAk+NEVLrWJZ7JXjSpB4yQRD71hi
	 VgZhyJym8+fRVjUW5Qpn/T/jz1woo/5WOFXqICkq9apxed+UuaJp9q/BlqyHHWgT6X
	 QITpVBN6IbbbQ==
Date: Mon, 17 Aug 2026 13:37:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 7/7] mm: Documentation: clarify where the mTHP stats
 live
Message-ID: <aoMAkG9hGAXAh9va@lucifer>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-7-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-7-ddac39d61c4a@linux.dev>

On Tue, Aug 11, 2026 at 06:48:39AM -0600, Nico Pache (Red Hat) wrote:
> The note about khugepaged counters references /proc/vmstat for the PMD
> case, but never mentions where the mTHPs stats can be found
> (i.e.: /sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)
> Add a small addition to this section for clarity.
>
> Also fix a missing period while we are at it.
>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

Thanks! LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


> ---
>  Documentation/admin-guide/mm/transhuge.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index 16f37135ed80..b187d618452f 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -224,7 +224,7 @@ khugepaged will be automatically started when any THP size is enabled
>  (either of the per-size anon control or the top-level control are set
>  to "always" or "madvise"), and it'll be automatically shutdown when
>  all THP sizes are disabled (when both the per-size anon control and the
> -top-level control are "never")
> +top-level control are "never").
>
>  process THP controls
>  --------------------
> @@ -301,7 +301,9 @@ being replaced by a PMD mapping, or (2) physical pages replaced by one
>  hugepage of various sizes (PMD-sized or mTHP). Each may happen independently,
>  or together, depending on the type of memory and the failures that occur.
>  As such, this value should be interpreted roughly as a sign of progress,
> -and counters in /proc/vmstat consulted for more accurate accounting)::
> +and counters in /proc/vmstat consulted for more accurate accounting.
> +Per-order mTHP collapse statistics are also available under
> +/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)::
>
>  	/sys/kernel/mm/transparent_hugepage/khugepaged/pages_collapsed
>
>
> --
> 2.55.0
>

--
Cheers, Lorenzo
