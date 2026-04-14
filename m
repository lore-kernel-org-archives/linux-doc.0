Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A511D3D47D4
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162257; cv=none; b=mUc17kq/CRS+GMq0111Y5D4Ew/0tB0b1MBmVcU64vG1dsq10nOxuxUwS7bDPLuvB3R8CMQFdjh9dqLOUiYLds1ArN3erfoTTye3S9J6KsUJX2LQwiDpCME5ACvbGtpndUBmV92VEfCNEtVy0Da7qlehpTmmrGxVKeNeoLknU1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162257; c=relaxed/simple;
	bh=2BL+neO7LmJ+HNU090lBbp1DXJFhaAi8zgcbYx5Q6NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr5Nl3ZMJkkO0doNPhShurvnpw2pKTv8rMGazqBKMRkr2ZaE+0x6sZs5vpLpAruhJhKNNs8x9Q1wrhZV9GNqkMz6O+tUKYKmfbuFGGaEN4MyfnzASfnIiveT22SE2zESlEJ7yMVTGr3pHqCjtFuct739VPwR1LNqqF6TVZOUrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJHri+FZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D1Xd3iMg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJHri+FZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D1Xd3iMg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJHri+FZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D1Xd3iMg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJHri+FZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D1Xd3iMg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D6B15BDBD;
	Tue, 14 Apr 2026 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776162248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSxrZ6WcjGESr28Ykjg3UuGrekyih0+Pqu8H/Jh6JWg=;
	b=HJHri+FZcOxFxW6g2tJoBiNgbeAio4SlL5/Mz1S5HzbPGAFzom40S6mSUw885yd2Z6WjUb
	XL3ww6C1XnOlbqojJcnnCfviHoBEbezbiSwljJ8wL2n+M1EdR+i40VbKWVF5y9HoBEw71Y
	ngiX3UHWqjiF+FOfuYJlIIHU4X7Ljic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776162248;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSxrZ6WcjGESr28Ykjg3UuGrekyih0+Pqu8H/Jh6JWg=;
	b=D1Xd3iMgkMYrzrmT//KFF50MmPDMgidUo/Lfl4pTg2qbm6bGw3zwklTyQSF+NU3YKUBiOq
	XM5CTBxLXAK4lTBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776162248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSxrZ6WcjGESr28Ykjg3UuGrekyih0+Pqu8H/Jh6JWg=;
	b=HJHri+FZcOxFxW6g2tJoBiNgbeAio4SlL5/Mz1S5HzbPGAFzom40S6mSUw885yd2Z6WjUb
	XL3ww6C1XnOlbqojJcnnCfviHoBEbezbiSwljJ8wL2n+M1EdR+i40VbKWVF5y9HoBEw71Y
	ngiX3UHWqjiF+FOfuYJlIIHU4X7Ljic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776162248;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSxrZ6WcjGESr28Ykjg3UuGrekyih0+Pqu8H/Jh6JWg=;
	b=D1Xd3iMgkMYrzrmT//KFF50MmPDMgidUo/Lfl4pTg2qbm6bGw3zwklTyQSF+NU3YKUBiOq
	XM5CTBxLXAK4lTBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63D8A4B3C5;
	Tue, 14 Apr 2026 10:24:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IuzNFccV3mkaBwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 Apr 2026 10:24:07 +0000
Date: Tue, 14 Apr 2026 12:23:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] hugetlb: make hugetlb_add_to_page_cache() use
 PAGE_SIZE-based index
Message-ID: <ad4VvdlMEGN9PaUm@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-6-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-6-jane.chu@oracle.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.de:email,imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On Thu, Apr 09, 2026 at 05:41:56PM -0600, Jane Chu wrote:
> hugetlb_add_to_page_cache() currently takes a parameter named 'idx',
> but internally converts it from hugetlb page units into PAGE_SIZE-based
> page-cache index units before calling __filemap_add_folio().
> 
> Make hugetlb_add_to_page_cache() take a PAGE_SIZE-based index directly
> and update its callers accordingly.  This removes the internal shift,
> keeps the index units consistent with filemap_lock_folio() and
> __filemap_add_folio(), and simplifies the surrounding code.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
