Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4831E82B
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240208; cv=none; b=jMCqAUoAoXxiLa5K+y3cKgy3vVgj5pDMraON8sXe4cpqZMHGCwWlRF0VMmYpjMIqcZjsFq+ACnopkVRxYd6OwAk74i8xTOMJJmToN3hl1eG4XlBxdASm2t0jBVUqcL3mbpRHe8YXibvVSQcSBy0ACxIOf0SCDddBUJ89epJIPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240208; c=relaxed/simple;
	bh=azfOfIAGzgUEzn9HTmzI02qqPi5oOKZyAy5PI9Wd7zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORp/LYjWsjBXxs0ILjuuy840EjFViX4L/0dBlAd9RqR533o6OqbfLnDNZl6NLYONw4yf5OVTsy9bq+SSzQlx6/HR17DkRJxDRuSzxjf4/xFqEmWgKZ+SAVMBdnbAigLu+/JU5+v2rAdG1aN2t9JPCu7gonxbbZvybDZw5APiFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oKON00JV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SA8BaCQd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oKON00JV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SA8BaCQd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oKON00JV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SA8BaCQd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oKON00JV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SA8BaCQd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B7125BD08;
	Wed, 15 Apr 2026 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776240205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HisAXEBH96eOi+Da34sQ2Z5rf72m88k4vWZJ1xIlaEI=;
	b=oKON00JVDPRbEhZ4y6Fa1x2nACr/YwsVHI+8BihRDLAQuBUv+Joi1TPF+KZbVOndclBAP+
	URZUinY6rPC1TLR7QG1FTqUAgRZvAySaCRffGsPZ95yM+E22bMHA6KjV7HdZQzfnemu8SL
	t3lEczv4SFiqV3lWopaoK189k4Y4O54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776240205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HisAXEBH96eOi+Da34sQ2Z5rf72m88k4vWZJ1xIlaEI=;
	b=SA8BaCQdZE7LqXBQ14jo4vZ3n/DN8HDqKUejdjfq6xtuCoPFJQJxaJoNT9XlKA5vX4fp+D
	UXxV3KA/0J+fktDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776240205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HisAXEBH96eOi+Da34sQ2Z5rf72m88k4vWZJ1xIlaEI=;
	b=oKON00JVDPRbEhZ4y6Fa1x2nACr/YwsVHI+8BihRDLAQuBUv+Joi1TPF+KZbVOndclBAP+
	URZUinY6rPC1TLR7QG1FTqUAgRZvAySaCRffGsPZ95yM+E22bMHA6KjV7HdZQzfnemu8SL
	t3lEczv4SFiqV3lWopaoK189k4Y4O54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776240205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HisAXEBH96eOi+Da34sQ2Z5rf72m88k4vWZJ1xIlaEI=;
	b=SA8BaCQdZE7LqXBQ14jo4vZ3n/DN8HDqKUejdjfq6xtuCoPFJQJxaJoNT9XlKA5vX4fp+D
	UXxV3KA/0J+fktDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA06C4B8DC;
	Wed, 15 Apr 2026 08:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 10jUJkxG32lsIQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 15 Apr 2026 08:03:24 +0000
Date: Wed, 15 Apr 2026 10:03:23 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] hugetlb: normalize exported interfaces to use
 base-page indices
Message-ID: <ad9GS_hRv5hbLfl3@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-1-jane.chu@oracle.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Thu, Apr 09, 2026 at 05:41:51PM -0600, Jane Chu wrote:
> This series stems from a discussion with David. [1]
> The series makes a small cleanup to a few hugetlb interfaces used
> outside the subsystem by standardizing them on base-page indices.
> Hopefully this makes the interface semantics a bit more coherent with
> the rest of mm, while the internal hugetlb code continue to use hugepage
> indices where that remains the more natural fit.
> 
> It is based off mm-stable, 3/30/2026, b2c31180b9d6.
> 
> [1] https://lore.kernel.org/linux-mm/9ec9edd1-0f4c-4da2-ae78-0e7b251a9e25@kernel.org/

It seems you got some trailing spaces issues:

Applying: hugetlb: open-code hugetlb folio lookup index conversion
.git/rebase-apply/patch:64: trailing whitespace.
	pgoff_t index = start >> PAGE_SHIFT;

Applying: hugetlb: make hugetlb_fault_mutex_hash() take PAGE_SIZE index
.git/rebase-apply/patch:161: trailing whitespace.
	key[1] = index >> huge_page_order(hstate_inode(mapping->host));

Applying: hugetlb: drop vma_hugecache_offset() in favor of linear_page_index()
.git/rebase-apply/patch:44: trailing whitespace.
	start = linear_page_index(vma, vma->vm_start); 
.git/rebase-apply/patch:46: trailing whitespace.
	end = linear_page_index(vma, vma->vm_end);

Applying: hugetlb: pass hugetlb reservation ranges in base-page indices
.git/rebase-apply/patch:237: trailing whitespace.
		next_index = index + pages_per_huge_page(h)



-- 
Oscar Salvador
SUSE Labs
