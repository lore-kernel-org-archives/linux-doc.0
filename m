Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE0E42CB07;
	Wed, 12 Aug 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531919; cv=none; b=gsmFZ99Q3aJHs4CgatZQf66xa2vU8LuzH+sUf0JPbWG9GHA9YdP4letC6ecWolJK7aSItFQvaGh6jVswB6iDmw6WhLOt25LgmSgqgaJYS5u0ma5W6q2oFCuGU5oIok9+JyZqOS5gL22sGhvXTWlYqcgLKNOKWI01pjQNEMkRrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531919; c=relaxed/simple;
	bh=MpXe3g9/IaLuBIAfincU6YZ5C3JZLuEWF0r4SSlVriI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+wvQRuTox5A/8AMIVSBzpZH1ZXMG5PG1xrmj9M2gXSrJGVVhkrfbSYva6h0xyyOZNGHP1P40SzwBsDnzZmcW1AXmnPPJBLpcNdQ4nx3sPPs/6JjnKClpR0oSDVxwbwuttlqc4Gesy6IM/6PADEzeyoUmAYpEaMRVfYkJrOF+PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nEaJ9gED; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HnYI4tCT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpUhZpzC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UCi97sZ7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nEaJ9gED";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HnYI4tCT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpUhZpzC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UCi97sZ7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B0AE82250;
	Wed, 12 Aug 2026 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786531912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+em0Spp2GVSY5hXTNLCjA9ODhlqN5jS8d6CBWbJP9Mc=;
	b=nEaJ9gED6WkYmp5DVeUuGwnFUL/YQC589Re8TutWF7qHa3jBUe4n++lHsSy3GuugzxJ+hZ
	Y9dFaG+ZXk/VRfJD7E0DngzyJ3bdqRpihm5RCUhQ12vCBG5MRF3lXcu5/mk7Pgj8voa1cL
	a0D3wpztzwCCbn22L3SaZChS1/OXRKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786531912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+em0Spp2GVSY5hXTNLCjA9ODhlqN5jS8d6CBWbJP9Mc=;
	b=HnYI4tCTBwnT0/+oc13M1fhiNJzmCyKYtQx93kM7YEHPiweN5pTrsFQKmvsbHffO0+/lYP
	CeWA114WtUm0UdDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wpUhZpzC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UCi97sZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786531908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+em0Spp2GVSY5hXTNLCjA9ODhlqN5jS8d6CBWbJP9Mc=;
	b=wpUhZpzCUySvhqllHAQD+/P15k5lCkoi9z0POQYVHx8wfTc72Em9Wwl1/acBnxnHfjSwNH
	83BCekhcXI54hLUF1x2KnRRvQ2/MzB5yp/tDfUM2LW1SkMp2WbVyje8uuf1PjuTxJg3uqx
	+UO68RaQO+vZ6aWPJXDWT1WQ8MDuIE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786531908;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+em0Spp2GVSY5hXTNLCjA9ODhlqN5jS8d6CBWbJP9Mc=;
	b=UCi97sZ7Wi0b938tfBMsOJvWaw2saD18uRKGief7/Q7ratmtUUBcL3IiNXNBEm2ZK4wa+j
	0BCZJEU8kCrK92Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEBC1779B1;
	Wed, 12 Aug 2026 10:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5fYzL0JQfGr5SwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 12 Aug 2026 10:51:46 +0000
Date: Wed, 12 Aug 2026 11:51:45 +0100
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
Subject: Re: [PATCH v4 6/7] mm/khugepaged: unmap pte before releasing vma
 write lock
Message-ID: <anxQLGly0Rnb0TsB@pedro-suse>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2B0AE82250
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, Aug 11, 2026 at 06:48:38AM -0600, Nico Pache (Red Hat) wrote:
> We are currently dropping the anon_vma write lock before unmapping the
> PTE. Although this is safe, due to us still holding the mmap_write_lock,
> its safer and less confusing to switch the order of these two operations.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
