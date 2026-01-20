Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B84F3B5304
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906280; cv=none; b=Lo7IThXAzZKSBy4D14R4z70xL6R5SeuFw88ACKQhdsT+pZRiErdWVgQWNOo6AhcolYkAq5CMpspunNDt6IuTql6IM5Sy4MLyK5A9bxaGA91Ou2QXxQ50C0UuQiJBdqzwQwreuYx4Bi9PYHvyScK0TC3MJLzBlaWXz/stHLYDc9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906280; c=relaxed/simple;
	bh=SCqqQcX4iNRq2beo/J8FVWJcdA2ii8h/ong8dbXvz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQ9hF5oVzC9toTTr4fIaNcY2r0ozulpHO0aX1rJjsCurjwW/SCH6wDEeYmcXZeH4K6sZe26GHZHcLpJ2oIX0B1iFMsssCFbB1nRJdXqMb9qL2unsxD3FpAwISUdwovnqccSWagflA6KNP+lQT/9uPVYOtkJNKxIxgXVdeuk7QS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ud5LeZdE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ppZhhzG4; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ud5LeZdE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ppZhhzG4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ud5LeZdE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ppZhhzG4";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ud5LeZdE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ppZhhzG4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 058EB337DE;
	Tue, 20 Jan 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768906277;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jujmVwZrt71kGNemDEG4npNv9U09SmxpQyYr5zcZ0wM=;
	b=Ud5LeZdE8uO89XWEigNsjcBBWeADA0Ipj8+ZxMq+Vfi/5Lw61gQcfvHCoaTY4gqevfj5XQ
	gdMDhxntilaatcLL3U09CsqYSv+VaQZ5V4YxyV44RpG8wdUjR2Iu6K3bwfcMMQvHvtKW1n
	1oN7mLkk338QV70rcfWPQbFt0MsurFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768906277;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jujmVwZrt71kGNemDEG4npNv9U09SmxpQyYr5zcZ0wM=;
	b=ppZhhzG4mw7fZr7XrygMWPHNFh8b98kXjF3KTYkA2AwclKvWIYW/1+YWtuFXz5M9RwGCQ/
	DdoPOlBvz9+qu4Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Ud5LeZdE;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ppZhhzG4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768906277;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jujmVwZrt71kGNemDEG4npNv9U09SmxpQyYr5zcZ0wM=;
	b=Ud5LeZdE8uO89XWEigNsjcBBWeADA0Ipj8+ZxMq+Vfi/5Lw61gQcfvHCoaTY4gqevfj5XQ
	gdMDhxntilaatcLL3U09CsqYSv+VaQZ5V4YxyV44RpG8wdUjR2Iu6K3bwfcMMQvHvtKW1n
	1oN7mLkk338QV70rcfWPQbFt0MsurFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768906277;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jujmVwZrt71kGNemDEG4npNv9U09SmxpQyYr5zcZ0wM=;
	b=ppZhhzG4mw7fZr7XrygMWPHNFh8b98kXjF3KTYkA2AwclKvWIYW/1+YWtuFXz5M9RwGCQ/
	DdoPOlBvz9+qu4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C56E3EA63;
	Tue, 20 Jan 2026 10:51:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DJ4IFSReb2mIBAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 20 Jan 2026 10:51:16 +0000
Date: Tue, 20 Jan 2026 11:51:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	man-pages@man7.org
Subject: Re: [PATCH v3 0/3] Documentation: Link man pages to https://man7.org/
Message-ID: <20260120105113.GB32438@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <87a4ydo1hf.fsf@trenco.lwn.net>
 <aWqg5XwPRXlzq4FI@devuan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWqg5XwPRXlzq4FI@devuan>
X-Spamd-Result: default: False [-3.71 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[man7.org:url,suse.cz:replyto,suse.cz:dkim,suse.cz:email];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.71
X-Rspamd-Queue-Id: 058EB337DE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

> Hi Jon,

> On Fri, Jan 16, 2026 at 11:29:16AM -0700, Jonathan Corbet wrote:
> > Petr Vorel <pvorel@suse.cz> writes:

> > > Changes v1->v2:
> > > * Remove `...` (italic) from non-existing man pages (Jonathan).
> > > * Squash fix for sp_SP to following commit (Jonathan).
> > > * Remove :manpage: also from fxyzzy(3) (non-existing man page).
> > > * Add CSS for man page.

> > > Link to v2:
> > > https://lore.kernel.org/linux-doc/20260111233534.183272-1-pvorel@suse.cz/

> > > Link to v1:
> > > https://lore.kernel.org/linux-doc/20260109183012.114372-1-pvorel@suse.cz/

> > > Petr Vorel (3):
> > >   Documentation: Remove :manpage: from non-existing man pages
> > >   Documentation: Link man pages to https://man7.org/
> > >   Documentation: CSS: Improve man page font

> > >  Documentation/conf.py                            |  3 +++
> > >  Documentation/process/adding-syscalls.rst        | 16 ++++++++--------
> > >  Documentation/sphinx-static/custom.css           |  8 +++++++-
> > >  .../it_IT/process/adding-syscalls.rst            | 16 ++++++++--------
> > >  .../sp_SP/process/adding-syscalls.rst            | 16 ++++++++--------
> > >  5 files changed, 34 insertions(+), 25 deletions(-)

> > I have applied this set, thanks.

> > Even nicer, of course, would be to have automarkup recognize man-page
> > references and add the links automatically so we wouldn't need the
> > :manpage: noise.  Something for another day, I guess...

> We had some old scripts within the manual pages, which did something
> similar, and they had false positives.  For example, 'exit(1)' is
> ambiguous, since a script can't know if it refers to calling exit(3)
> with value 1, or if it's a reference to the shell builtin.

Ah, so there are false positives.

Kind regards,
Petr

> I'd recommend being cautious about it.  :)


> Have a lovely night!
> Alex
