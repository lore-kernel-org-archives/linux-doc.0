Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C43624AE;
	Wed, 12 Aug 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527547; cv=none; b=qKzfGMIcBRx4CeSvcZHi6tNTQLpOC+o8WRAxY6sUq7nKtVnR9hSnjUnKvZD87c1CF0XqvVFQGPW7kMxKN+YmeZpm2x6vKcyfB8fxgsO+hs0P0K89dRW+HZpC3U602uZql23FyaMc7h9aqM5cb14NFkxGeNbsQjJld6eFN1TXNGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527547; c=relaxed/simple;
	bh=XlqzL4DkJ/L1+pkVKbuXxJAqbLsm8QfiQS92ZKUE1UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2AWm1dGsWMBVSal4W01IOrTSiyqRiEeKCn70nCz+hBOdLE6rd4bIGbeBrPqfPaYPQY+M/CmuJzoAWCwPJl6og4ye2ve6sGrp8+E43/GFWJYd9Wt6zcP2rYeda7OqqoQemmjHQ2swl8sGTQYYLBJXNHshI+eNv8f4gWA28vXMI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xiMd7nu9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cxJDaTPQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hrix0hut; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3oQZNh6q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xiMd7nu9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cxJDaTPQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hrix0hut";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3oQZNh6q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D21F821AD;
	Wed, 12 Aug 2026 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786527538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDyc87rtaYvBOaEu1VDS0tXBuH6KkTDubLpiL49NFJY=;
	b=xiMd7nu93CryAR2rFBoBVW+cmWLhGAcjylTTcp1HZHZdt7pJtdoKCVNHhf/hBExlYBjIHY
	xnsfYmJ7joAVKeARoJn3khw1yzgw8psa79skhSdQ8yFHItLO0x1LuyGsNBMy0edoBG8E+l
	H2Pf+MK4EmeU53eURjDTUllzlpNpOAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786527538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDyc87rtaYvBOaEu1VDS0tXBuH6KkTDubLpiL49NFJY=;
	b=cxJDaTPQ6hRNHa/34EViiEdgcS6MwLw5g9YugF2yYnhFCHq2ci5Kk7TUtGuhNoJyfUDx1z
	uZgiDYiK7sJnrUAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hrix0hut;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3oQZNh6q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786527534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDyc87rtaYvBOaEu1VDS0tXBuH6KkTDubLpiL49NFJY=;
	b=Hrix0hutKT3vVvH62mE4PMdM32mB1PUYRldKmXEKyENCtTlrosGIKa62RZR1jyRSVOtSTG
	N/G7JmIwe3RVs0CXK4Mq8sMXziYgbf3a8zXskqyaR1qT1SFeiIuEh2F20VukrpwrImTfkU
	dbS4C1vJl2pdPbXopu24A8DO+UFtXh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786527534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDyc87rtaYvBOaEu1VDS0tXBuH6KkTDubLpiL49NFJY=;
	b=3oQZNh6qCrTjPqwipueFCeCoYzB5Oce7/z3sSBJIEsinoPWyoRjHZWDEHI0G58roItWBoi
	iamTlsCp0OK5aGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ECA0779B1;
	Wed, 12 Aug 2026 09:38:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gK7/By0/fGqrBQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 12 Aug 2026 09:38:53 +0000
Date: Wed, 12 Aug 2026 10:38:51 +0100
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
Subject: Re: [PATCH v4 4/7] mm/khugepaged: fix outdated comments
Message-ID: <anw_Fh7bBTPmmNQ-@pedro-suse>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-4-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-4-ddac39d61c4a@linux.dev>
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux.dev:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -5.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 8D21F821AD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, Aug 11, 2026 at 06:48:36AM -0600, Nico Pache (Red Hat) wrote:
> Fix comment in collapse_scan_pmd() that still described the old
> folio_mapcount() > folio_ref_count() check and a "512" false-positive
> scenario. The code now uses folio_expected_ref_count() != folio_ref_count()
> which doesn't suffer from the same limitation.
> 
> Fix comment in collapse_huge_page() that referenced ptep_clear_flush,
> when the code actually uses pmdp_collapse_flush.
> 
> Fix comment in __collapse_huge_page_swapin() that referenced the old
> function name khugepaged_scan_pmd, now collapse_scan_pmd.
> 
> Also clean up some simple typos and stale terminology (mmap_sem ->
> mmap_lock, PG_lock -> folio lock, page -> folio, grammar).
> 
> We also clarify a comment regarding where the max_ptes_none check is
> deferred to in mthp_collapse() from the original collapse_scan_pmd check.
> 
> Update all comments that references a function to include parentheses.
> 
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Assisted-by: Cursor(claude-sonnet-4):4.6
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
