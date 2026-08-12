Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1E41378D;
	Wed, 12 Aug 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527391; cv=none; b=Z1E9oSwC/gj7p9BHcETmJ4DZ4CGpIjUYcFB+j3WA1UtIyH+kFFSTo+Skv0QJOuc7qrFt+15pKFMOCvdReNCTsNvrSSDsAqouCSx6VMLGbZcn8Rcjpzwz5HaE4bt0NEuf6BEmxU9masUXFumN7Z1UV5z0Dw9/IRCFXicIPfmNWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527391; c=relaxed/simple;
	bh=KyET9dfVTh3CWelwwUhdHWZrQJOadl4k3Xqr8MHbjEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsVPXzFoVpWkQ6ylSg5mlpuEm+HKQwqMiIIPmBlazZv6q5rt4tKHLPXzdZiEF5Ria4+n9FslPqBuJAzonLWJ1CVZ8CsVR8TvY8zURLwYt+3WRyWUF9OAXlkf2/Ljo/po/92qcFwB1kWdX03h5YagmYPQSyaWDn2Ka83WSJ2Rabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m8GGtF6X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=utSR7Dso; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jUmOWDIi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/3PMGy8Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m8GGtF6X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="utSR7Dso";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jUmOWDIi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/3PMGy8Y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 42BB23E50;
	Wed, 12 Aug 2026 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786527380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5m2rqBH/Ah6lf7nFwFeHrsDpb9GfTC3w+B+47Xs24Nw=;
	b=m8GGtF6XklCvzBprTznmHbacWiZP2M8520eAyRLAra+O6UpOb/hGvTLAo8D4PzNMzuHeZM
	ZupAC899WLlpXMBC7oCzTloC9YfQHzsvG0CFIqjCYaQRrG5ymqiu/uIj0gE6kWEa/hvkVP
	jaGASGxGVxtppPFIbWZVEPRNfhbLVyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786527380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5m2rqBH/Ah6lf7nFwFeHrsDpb9GfTC3w+B+47Xs24Nw=;
	b=utSR7Dso4bX2slVZ6GLc3cHrjeStHUNJhvAzhQm9kzFxDsluOSqmkqfqDhNwg74BNxy0XX
	wFLUEY/FhncMV3BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jUmOWDIi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/3PMGy8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786527376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5m2rqBH/Ah6lf7nFwFeHrsDpb9GfTC3w+B+47Xs24Nw=;
	b=jUmOWDIiuVoLHMp2/59xweK6NIjfOdOE5CkF8lle+dvBw1DC5tVPYxMM+7aU4IbPHYnu68
	oOExW2xww4/VFGVfLFXgIWjF9zvZHyAkeUPI9wJGijZ3KaO3M3bg8kXndCAFNQNg1/EUeX
	ReywErtAit4icugdSkdCEIYWWXo4AFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786527376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5m2rqBH/Ah6lf7nFwFeHrsDpb9GfTC3w+B+47Xs24Nw=;
	b=/3PMGy8YSbdr0qkHdLxH/WULoIYRpGa8WE3E0ykdHEwtbfxTWfCLiQ1oCGCNVuLg6pvONg
	AB8QnkOt61BUKaCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3E74779B1;
	Wed, 12 Aug 2026 09:36:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WWtUNI4+fGoKAwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 12 Aug 2026 09:36:14 +0000
Date: Wed, 12 Aug 2026 10:36:13 +0100
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
Subject: Re: [PATCH v4 3/7] mm/khugepaged: introduce a count_collapse_event()
 helper
Message-ID: <anw80fOYcFcLsGV_@pedro-suse>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-3-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-3-ddac39d61c4a@linux.dev>
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 42BB23E50
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,alibaba.com:email,linux.dev:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, Aug 11, 2026 at 06:48:35AM -0600, Nico Pache (Red Hat) wrote:
> Provide a simple helper function to help reduce a often used, and
> duplicate pattern across the khugepaged code.
> 
> When collapsing to a PMD we need to record a vm_event and the mTHP_stat
> event. When doing mTHP collapse we only update the mTHP stat.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---
>  mm/khugepaged.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 8babd4c97db6..cae510aa2914 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -688,6 +688,14 @@ static inline bool folio_pte_referenced(struct folio *folio,
>  	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
>  }
>  
> +static void count_collapse_event(unsigned int order, enum vm_event_item vm_event,
> +		enum mthp_stat_item mthp_event)
> +{
> +	if (is_pmd_order(order))
> +		count_vm_event(vm_event);
> +	count_mthp_stat(order, mthp_event);

Maintaining two counters for the same thing is Peak Tech Debt. Would it be
somehow possible to redirect /proc/vmstat to PMD_ORDER mTHP stats?

> +}
> +
>  static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
>  		unsigned int order, struct list_head *compound_pagelist)
> @@ -708,9 +716,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		if (pte_none_or_zero(pteval)) {
>  			if (++none_or_zero > max_ptes_none) {
>  				result = SCAN_EXCEED_NONE_PTE;
> -				if (is_pmd_order(order))
> -					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> -				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_NONE);
> +				count_collapse_event(order, THP_SCAN_EXCEED_NONE_PTE,
> +						     MTHP_STAT_COLLAPSE_EXCEED_NONE);

This is nicer than open coding the add, though. One step at a time :)

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
