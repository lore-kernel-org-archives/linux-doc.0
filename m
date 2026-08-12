Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A924052B1;
	Wed, 12 Aug 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526759; cv=none; b=LTFJXXjRnCvEJhLw8jCiZY4oTCAsOZZBpPd88Jqo1NqU3PPDgqi7Cnk6zpxXnMCxXeCrGVYdFCFjfwuIjcetCPmV0Cj5/fIzf27ZcVkjlVMQbLdgkMo6kYlQvZ05e28JViRPn+ITqbuciUQgbAfKxUNMT+NItpNId5gS+GJ3iUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526759; c=relaxed/simple;
	bh=PzHD12o8yjwQEMc0y90x63/SyAcoDzZuonJeyCkoWFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSz/0xz+7CDPlkziiV6cc0wiuiPIYPcs9rGckAIHvn7dZ0gpHXii27um0fYlsItoKDqr8shDneet2ipJvfAw6phrew8WQRyGUAMuDb+CPLiPfSrhtnHtI+XgwRA2aMiLxqXibfhOIt7lcjWP0wreoX8IJHoNA4LuNEnmp4GqDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tt9x+QhR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FBOa9hNc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BM4NJrdN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LjGPtZZg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tt9x+QhR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FBOa9hNc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BM4NJrdN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LjGPtZZg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8F3E8217A;
	Wed, 12 Aug 2026 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786526749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSXmi/X6VIXJSpaHbALVzu1i81Tq5CI7DGOYzCoOXrA=;
	b=Tt9x+QhROvIfFwZjVNm9ekk8BGR0sR4WPttfxa+R0dgwUKVu3SXdOGD1edgOBiYpA3GXSG
	gRpmE+x66hknl9GP5SZls1v+fvmaIZkIZf5ddV9+pZDGBrb2K0g5fdAoTPdZl03WPD8+Cv
	QZ6kniSRQTlj092YdiQto2t/wy7uACU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786526749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSXmi/X6VIXJSpaHbALVzu1i81Tq5CI7DGOYzCoOXrA=;
	b=FBOa9hNcNO05tO0llJw/rXx5POcJsm8g5ND+Y9DhW4zschHYYlSnebPQKrOyOpioRTJtqh
	ecK/vmzNnLs4kZDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786526745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSXmi/X6VIXJSpaHbALVzu1i81Tq5CI7DGOYzCoOXrA=;
	b=BM4NJrdNfHX4WvnnG43VCgDgtRLNe2XTPPlP4FHYpduIFPUdrB/RJmKjZucd99D9CDMwdh
	aqFHOmQs/hwpwPlGt+X86wT/8Fz35E3zn52bd87BZR13FZAlJApOb+4jOYRUi3jU1p56a7
	7rrpdF1+v55q/XK5OQjbX9GPkR/CYt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786526745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSXmi/X6VIXJSpaHbALVzu1i81Tq5CI7DGOYzCoOXrA=;
	b=LjGPtZZgOFpnYYJORh6I+4YMMTIyvIOMF5q2EtN535M853tinYDAX2vMo5yfRD54XNIczs
	du1nCdTKDvvDFJDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61A83779B1;
	Wed, 12 Aug 2026 09:25:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aolgEhg8fGpJeAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 12 Aug 2026 09:25:44 +0000
Date: Wed, 12 Aug 2026 10:25:42 +0100
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
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
Message-ID: <anw7_Y5zCoL3DhLf@pedro-suse>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Tue, Aug 11, 2026 at 06:48:34AM -0600, Nico Pache (Red Hat) wrote:
> This change deduplicates the "is this PTE/folio referenced enough to be
> considered for a collapse" condition that was repeated in both
> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
> a single inline helper function.
> 
> Also move the comment and use it as the function header. While we are at
> it, updated the comment to clarify that a young pte is a recently accessed
> one.
> 

Nice!

Reviewed-by: Pedro Falcato <pfalcato@suse.de>


-- 
Pedro
