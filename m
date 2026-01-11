Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46F347DD
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768174160; cv=none; b=IJYLsndocZ1PBHOLpOs3cd2auhbMxbwnUzGue8Q1q+VqXyKGnCSxEK6NBCn0vGxtfmc2uFur3DC7Bc13dLoM7jUXNny/db9FYyGiCSI/SYbWI59OQfd1eKH+1lfiApe7LxLbbToAtLks52daOyaoDSO7jt3IuC1vC7qKCLsoa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768174160; c=relaxed/simple;
	bh=9/hKF8mAMRz6+Cupm0Vm4oCLGenWaXbhiRxUYk0iubs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyfoD8P+zoI5RxkmJ+4xlR1fM5vekB3Moo5GkFY2Hm6ZJZ2NS4GZ3xechPkIlWlFTH+RLUyAD9PCpNDGI/YRBzlPW0nECCumvlxLRvSYCvSRpkUg2HxQ/VgMVzgfgZJkt5S/UoKhOM1svNV4i0zGKm2C4+hXW2WOEKBl8glIiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HnNj3NCt; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=yhV7W53Q; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HnNj3NCt; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=yhV7W53Q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HnNj3NCt";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="yhV7W53Q";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HnNj3NCt";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="yhV7W53Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DDBB336B3;
	Sun, 11 Jan 2026 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174156;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eNWmdlhPgeCPGvwIt+nSXkAQWokLJs+fqNT5O2Erq+M=;
	b=HnNj3NCtxaLCxtR2eHhOaEUCny9633X2DdR2JLbNjS4GVO90dv2cu+y8QgmB7Ha7a5MmeX
	mtWYZnw61vmJ4J7gCmfH+vf0iayet39xtsorEbcpV0s7oHdJtHWxrmQSEfwql+XRnji7ec
	EG1REm0RbfmM5FNfYltjXtEX4w+oXXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174156;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eNWmdlhPgeCPGvwIt+nSXkAQWokLJs+fqNT5O2Erq+M=;
	b=yhV7W53Ql2ZSffsUHQ0Wke6Kin8WnHUwhWibq3r0eZ0atpp7QlEz4B5bUtGlBU1uXH8/u1
	ESlJWI60c//ogGDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174156;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eNWmdlhPgeCPGvwIt+nSXkAQWokLJs+fqNT5O2Erq+M=;
	b=HnNj3NCtxaLCxtR2eHhOaEUCny9633X2DdR2JLbNjS4GVO90dv2cu+y8QgmB7Ha7a5MmeX
	mtWYZnw61vmJ4J7gCmfH+vf0iayet39xtsorEbcpV0s7oHdJtHWxrmQSEfwql+XRnji7ec
	EG1REm0RbfmM5FNfYltjXtEX4w+oXXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174156;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eNWmdlhPgeCPGvwIt+nSXkAQWokLJs+fqNT5O2Erq+M=;
	b=yhV7W53Ql2ZSffsUHQ0Wke6Kin8WnHUwhWibq3r0eZ0atpp7QlEz4B5bUtGlBU1uXH8/u1
	ESlJWI60c//ogGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FE0E3EA63;
	Sun, 11 Jan 2026 23:29:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T+1lGUwyZGl+EQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 23:29:16 +0000
Date: Mon, 12 Jan 2026 00:29:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <20260111232915.GC170559@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260109183012.114372-1-pvorel@suse.cz>
 <aWFnRcjl5SogBakq@devuan>
 <20260111230639.GB170559@pevik>
 <aWQwVdF3ea1hmgjG@devuan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWQwVdF3ea1hmgjG@devuan>
X-Spamd-Result: default: False [-2.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	URL_IN_SUBJECT(1.00)[man7.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sphinx-doc.org:url,imap1.dmz-prg2.suse.org:helo,man7.org:url,suse.cz:replyto];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.50
X-Spam-Level: 

> Hi Petr,

> On Mon, Jan 12, 2026 at 12:06:39AM +0100, Petr Vorel wrote:
> > > I wonder if this could be implemented in a way that wouldn't need
> > > changing any lines of documentation.

> > Good point. Yes, there is sphinx way to do it as one liner (no need for any
> > python scripting):
> > https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

> > But the problem is that it creates links also for non-existing man pages
> > (xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst. I'll convert them not
> > being man pages.

> Maybe we could solve that.  Do you have a list of undocumented syscalls?
> We could quickly add small manual pages for all of them, documenting
> only the SYNOPSIS.

> The rest of the documentation could come later, but some documentation
> would be better than no documentation.

> What do you think?

IMHO these xyzzy(2), xyzzyat(2), fxyzzy(3) are examples for new syscalls
(like "foo" and "bar" or example.org). I don't think it'd be good to create a
real man page for them. Instead I just remove :manpage: from them.

Kind regards,
Petr


> Have a lovely night!
> Alex


> > Kind regards,
> > Petr
