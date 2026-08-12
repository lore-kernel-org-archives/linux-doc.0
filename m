Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5E42CB05;
	Wed, 12 Aug 2026 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531858; cv=none; b=uCADlbRZOcwboQwOrrU6eI5DvQUfRif2M/3fNJW9+P0qPZR/HJwuU/VfEWbq2svWL7mxNvAU+56VcITwuI9VeaMXZO5Y6gtvZ+DncuExdrck7kb8ylAh/F5YfncjutGllxyEjWqqzxLftudJM+hU/a4c0uXfPo4R2jjrygEbIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531858; c=relaxed/simple;
	bh=eNJJut9Th9+2T0pPLT8femETz2DP/81QRmGEE8bXI+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpqaCwEYxfeOuzl5m2ZXrqURxn0SnGwakdzqbIAeNf+kvqm5O/rK8Yl37cVL1zkBPNgAVGqKuS6J2KpKf1KYuRxeHM2Oct5gtfJFxpekTjsFOiF2oz8s5bUYFKjCgLqEXoWLkLM3dsdVaRNzV44PhwE2LhYFFiU+IHnUF6KdufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oGoittdM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=scBGa8Hd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S6lOfvp7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZThrv6N3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oGoittdM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="scBGa8Hd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S6lOfvp7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZThrv6N3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB2928224D;
	Wed, 12 Aug 2026 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786531849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtE6Yx2HNNmNt17xsrGAWYsQEss7hpz4O8ku3vflf/Q=;
	b=oGoittdMDb3ThZvRf9L1kywp8nX5c9YIpHpax1LVFmkCKJ/In4n/0Ygc/Xjw7/SKJTmajr
	uGuV7XOPMslMBITAr1DMpUkxlzVzSuqdKiFEMeXYuHwYshY9v82nSn0GWQlgP0bREyMgSI
	0ieE0VYNKXZYIQ/i+qeB6x876ZZc3U0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786531849;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtE6Yx2HNNmNt17xsrGAWYsQEss7hpz4O8ku3vflf/Q=;
	b=scBGa8Hdhv42zKidMn+WeSsbTq5cPNn1R7LCXcaN/e6Hyv5R6sPYvmQwr0H18rTxV+IXIq
	PJsEDctSqTppAUBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786531845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtE6Yx2HNNmNt17xsrGAWYsQEss7hpz4O8ku3vflf/Q=;
	b=S6lOfvp7PwSIadMy+hGB33tMwS7ZlFJWxQ6pJxyIe6pdv00uAOEPXCk1wM9y+ku/nzlKMS
	mbFmScm8JP0jVBGCgGV4Bijfl1Rngsjcpo5PL2M9W9befArJVGYLxRx0Godyn4pE7X/aq+
	rSy++d8SP6cLkc1JXsUxbwvlBZoWpro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786531845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtE6Yx2HNNmNt17xsrGAWYsQEss7hpz4O8ku3vflf/Q=;
	b=ZThrv6N3Df9nPUuxRFgXRoxh75MI9vcqRejU99vJTmvLzwHIUnPYc2Xbp9Z6UxIHDCICRX
	OkQoUj/Er1NNuIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FBCF779B1;
	Wed, 12 Aug 2026 10:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JNP5FwRQfGquSgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 12 Aug 2026 10:50:44 +0000
Date: Wed, 12 Aug 2026 11:50:42 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 5/7] mm/khugepaged: Refactor the PTE state checks into
 a helper
Message-ID: <anxPu3TBiI9bi53x@pedro-suse>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-5-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-5-ddac39d61c4a@linux.dev>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Tue, Aug 11, 2026 at 06:48:37AM -0600, Nico Pache (Red Hat) wrote:
> For anonymous collapse, the collapse_scan_pmd() and
> __collapse_huge_page_isolate() functions share a large portion of their
> logic. These functions both check the state of the PTEs and verify the
> following:
> 	- max_pte_* values are not exceeded
> 	- uffd is not active
> 	- lazyfree properties
> 	- non-anonymous
> 
> Merge these checks into a helper collapse_check_pte() to reduce code
> duplication. We also add a helper struct for this function called
> pte_check_context which allows us to pass the required parameters in a
> clean and elegant manner.
> 
> A helper function is also introduced pte_check_fail() to provide a clean
> interface to set the pte_check_context failure results and return
> PTE_CHECK_FAIL state. This helps reduce code duplications across the new
> collapse_check_pte function.
> 
> Two slight modifications are done to the original functionality. We now
> warn (instead of crash) if the anon test fails, and we leverage the
> vm_normal_folio function instead of page->folio, this should be
> functionally equivalent.
> 
> No other functional changes intended.
> 
> This patch is heavily based off work done by Lance Yang, but modified to
> deal with conflicts and feedback received during the review cycle [1].
> 
> [1] https://lore.kernel.org/linux-mm/20251008043748.45554-1-lance.yang@linux.dev/
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---
>  mm/khugepaged.c | 298 +++++++++++++++++++++++++++++---------------------------
>  1 file changed, 157 insertions(+), 141 deletions(-)

Ugh, this is quite a big change, can you break it down into a bunch of
patches? It's quite hard to properly review otherwise.

The spirit of the change looks good itself, but the devil is always in the
details :)

-- 
Pedro
