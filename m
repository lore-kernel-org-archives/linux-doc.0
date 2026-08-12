Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790A4052B1;
	Wed, 12 Aug 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526650; cv=none; b=S5bJpN+8/iCDOTGo/fn4Ul9xyqNt8eFEV3pRBmMNfgrBqTqzHBKuzxTvJwlUWXMfkhDWELOBBc+jMu428jsgmlzrAaOEOFl7Poif4u0Qnnz0/mo8uwNPD1KTfN2mb3zsxL6BE8sTJsyBHSxUC8+LRaWrdI0jZG0jb3iE107joSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526650; c=relaxed/simple;
	bh=N5535XYf07aHcnETAabhRmwoXYV9Y0PIrXwZVc/2UCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEu5NlXeiAOHJy7NIHQoIdnYIUl8tSX9VcY9Wsj4CQDfTmCWeggAc+aCOsG7/uQ6l4mkYGjKv76OWDrQCNEm7lRCVUfk4dOms5CGRLvAwulXp1JrJXgK/EzEpkj1sRz0Mwu8cIkqjtKj9R2wQlYotOTC3PXJXg2xOzkj34cbNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fYowjGmY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ERmWLsxM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UgFreQx4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5xshYV/N; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fYowjGmY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ERmWLsxM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UgFreQx4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xshYV/N"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 09D463E5F;
	Wed, 12 Aug 2026 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786526643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBaU2Wn9BvxVYjypevPijiacf8bTpCRTGLYa7EXyl6Y=;
	b=fYowjGmYwDrtLjMYFtb2r9WmVlMtAwYItDujksbIUR87O2OVJMCNHc8ZdS4mwtomZ6Wcfx
	5UpfGmY5Fax3nX1nUpq89vLK+OnJsrnQGD9yqIMV/rgPbUOCDgu22zV8v1k+GOM4Q6wMdq
	RQNP2gXREiT+zptWtt6p+rDF2zylw0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786526643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBaU2Wn9BvxVYjypevPijiacf8bTpCRTGLYa7EXyl6Y=;
	b=ERmWLsxMcRnJRApGJR16Om96FXa9cpG9EF7xq1oOzLul0yb0RC6lj+jA+LtQ1eTXtWQhSG
	cinuNeX756wq2QDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786526639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBaU2Wn9BvxVYjypevPijiacf8bTpCRTGLYa7EXyl6Y=;
	b=UgFreQx4v4iX2TMSEludlSyCfO31JmcONhUrl5UKV6j9FBmLHAq3CYSPe68nZmKHjBgrqC
	0tfqnNMDhKK6Sfys/4DrC/Sbq1bZ7FvaKKCjRpvJn5fjtEXP7X741NbObAF5ELD0/hW8aU
	Arx8fzo57r5xRq3wknJWXEof12pmcG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786526639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBaU2Wn9BvxVYjypevPijiacf8bTpCRTGLYa7EXyl6Y=;
	b=5xshYV/NGWdLwDqMByLgqmpraJtbABl2gPGpRInoCDsWL296EsibdiZDz0xis6BW9kb4Dn
	Ysl4qo1KzxgfwLDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC1EE779B1;
	Wed, 12 Aug 2026 09:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G1bAJq07fGpQdgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 12 Aug 2026 09:23:57 +0000
Date: Wed, 12 Aug 2026 10:23:56 +0100
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
Subject: Re: [PATCH v4 1/7] mm/khugepaged: refactor per-scan state clearing
 into collapse_control_init_scan()
Message-ID: <anw7F4FAHEIaW0nx@pedro-suse>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-1-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-1-ddac39d61c4a@linux.dev>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,nvidia.com:email,imap1.dmz-prg2.suse.org:helo,alibaba.com:email,linux.dev:email]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Tue, Aug 11, 2026 at 06:48:33AM -0600, Nico Pache (Red Hat) wrote:
> Extract the repeated clearing of node_load, alloc_nmask, and
> mthp_present_ptes into a helper to reduce duplication in
> collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
> current use the bitmap, they will in the future, and clearing it now is

Will they? (To be clear, not opposed to clearing this regardless).

> harmless.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
