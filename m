Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73B3C7DF1
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160397; cv=none; b=OxP4a3hHlKh22ghzqcX1qPAQGOy9QxiTiIo25r1HZ5o+KNFvhNPJ4o/8Z8vgoUwlK43JZnamiQAjkJz9SbseZCdFRQaEj9eXQyzeWZTzBjegUfamJ8sG8OqVGNvOBM2hBPOc/R/Cg0TxsvvMIIobZgLCHdSqbL71cymcLHFh4+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160397; c=relaxed/simple;
	bh=OZOQ4v4L1L0eqIWqXUWHBOiDyaaDsybUZEZeT3jC8Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZazhO+0BCq0lmseUBn+ZQEs6LHcUuVYRBC6+cpBieuqLqbM1q1HIjtLMELvLpXBGXIToDVfyKFBA/6C9YlNHtaBKVcjZ4d2WNF8u13kKnwRoZXEpQcw1Y7hylQ72znbQZw08VddWev5wAjE7gtiKFOszbyTYkftdW+8TWbslGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QK/ZOkL6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XyCOi7I8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ldW0heS5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eDY9yA7I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QK/ZOkL6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XyCOi7I8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ldW0heS5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eDY9yA7I"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E84EE6A7FD;
	Tue, 14 Apr 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776160393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pPD5JZWXLOXJK2CA5dw/48scjaOqjpDP5gnVdaxSMmU=;
	b=QK/ZOkL6r4fU6O+gor08Pai79piFrmp2r4Fam2U2BYrzwYs6gOTcpRKXDpTKM34ncUruQz
	t6aSl/vdi+lj42pK36OyyuQpbsxwcE0VUpqEk2z3fo+0CWOirQ7YIoIUWzVIVUWiACWNtX
	VNpw/1oCwWSQFpNDPO2h0noh66hGIsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776160393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pPD5JZWXLOXJK2CA5dw/48scjaOqjpDP5gnVdaxSMmU=;
	b=XyCOi7I81m/DD+MuTT92PsbyWhkBhhMM6ItWy1qpDZnhj8No6VoiqYPSuXXYeIUz4rYALX
	K377bQZ/WAhA75BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ldW0heS5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eDY9yA7I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776160392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pPD5JZWXLOXJK2CA5dw/48scjaOqjpDP5gnVdaxSMmU=;
	b=ldW0heS57tSYJqsYHBM+df1+cAWOzkw3dseiwFDNU//v/FNXRZFbl+bhNR3IornHJeaGGo
	9qzlmQ1bpLN/kBfJNp7GwUmpVnLNpSzmpTOx+91+LSd0pCFHUUZzTRuYY5af96c590RBnS
	bA6Lqm8iYWEJjoaHZF7xf9h0yAdncSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776160392;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pPD5JZWXLOXJK2CA5dw/48scjaOqjpDP5gnVdaxSMmU=;
	b=eDY9yA7INydVASNMf8xbIpzO178bIet8WbflFAfM6KSNUwqJfNNyhujCbTxgNK7Nt2oSMS
	pwWoDfgN+Zkm8aCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FC574B3A7;
	Tue, 14 Apr 2026 09:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1bCGCYgO3mlLZwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 Apr 2026 09:53:12 +0000
Date: Tue, 14 Apr 2026 11:53:07 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] hugetlb: drop vma_hugecache_offset() in favor of
 linear_page_index()
Message-ID: <ad4Og_719Yq4yshf@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-5-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-5-jane.chu@oracle.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: E84EE6A7FD
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

On Thu, Apr 09, 2026 at 05:41:55PM -0600, Jane Chu wrote:
> vma_hugecache_offset() converts a hugetlb VMA address into a mapping
> offset in hugepage units. While the helper is small, its name is not very
> clear, and the resulting code is harder to follow than using the common MM
> helper directly.
> 
> Use linear_page_index() instead, with an explicit conversion from
> PAGE_SIZE units to hugepage units at each call site, and remove
> vma_hugecache_offset().
> 
> This makes the code a bit more direct and avoids a hugetlb-specific helper
> whose behavior is already expressible with existing MM primitives.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>


Looks good to me, the only thing is the conversion to hugepage units
which may not be very clear to the casual reader, but you already
mentioned that you will add a helper, so all good.

 

-- 
Oscar Salvador
SUSE Labs
