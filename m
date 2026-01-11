Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6659199230
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768172804; cv=none; b=HbcKGeYgn8hHyfkd1puDNeElAgxaWWhkC4pxV+MbRFQP+hUWTnKqoROyejsoh1vC3Z2KBBqmPvRucrw2Ts3mITJNCDXBlsBfZY3lhbHvdHldGRYYBVJEIRGwN58v8wn7l2dZcX3MziUdcWsXJos9s/0YwutWEHAjJtOanXB0NsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768172804; c=relaxed/simple;
	bh=m4Ke92MgXBk+oXTA3LfWYE0BDQauh2s4H8Mlc8AYK6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwf7zzotj8TtP3NVfxp62z6FeOlT0GaNNg5SpLhUSv0SiHJS+HfhWROvN5n+xdoUKIRPljsRHIXUPVmZV/Jtln9uUScdqtjQdKh9h5CWmJN8nKvrcys9b99AdUdx+qj5jL9jkhVwuuvaP93GiBBS/2DFZJ0RbPJlRWGBuIfJg9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JcBS92ig; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=tA41J/1x; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JcBS92ig; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=tA41J/1x; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JcBS92ig";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="tA41J/1x";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JcBS92ig";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="tA41J/1x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1EE49336B3;
	Sun, 11 Jan 2026 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768172801;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfsbgMbqzx3cfOExuXVFvpKeFibufte8f2Jhx6V60oE=;
	b=JcBS92ig2ZEC+RbhcgvKjxYzVzRwK9l7wZBcvIemQjf5pPBVagH6ztu1vbLttk1sacdbC5
	QQQ4q2BJPfozI1VPSLP2yHLlwKKOekn5kl6S3clMpX5+yNajIUhVjEXraEfbY1LFrzao1H
	1cEqB7rKwurx4/8AG7FEzpeJy1IYY9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768172801;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfsbgMbqzx3cfOExuXVFvpKeFibufte8f2Jhx6V60oE=;
	b=tA41J/1xouosxjeYBXspEj/8gl00fkXezfD9C3w5P4fN6BLyfg1iniNmgid+Zx4akumFAA
	Dd6v4qMumfqkMCDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=JcBS92ig;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="tA41J/1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768172801;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfsbgMbqzx3cfOExuXVFvpKeFibufte8f2Jhx6V60oE=;
	b=JcBS92ig2ZEC+RbhcgvKjxYzVzRwK9l7wZBcvIemQjf5pPBVagH6ztu1vbLttk1sacdbC5
	QQQ4q2BJPfozI1VPSLP2yHLlwKKOekn5kl6S3clMpX5+yNajIUhVjEXraEfbY1LFrzao1H
	1cEqB7rKwurx4/8AG7FEzpeJy1IYY9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768172801;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfsbgMbqzx3cfOExuXVFvpKeFibufte8f2Jhx6V60oE=;
	b=tA41J/1xouosxjeYBXspEj/8gl00fkXezfD9C3w5P4fN6BLyfg1iniNmgid+Zx4akumFAA
	Dd6v4qMumfqkMCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEAD03EA63;
	Sun, 11 Jan 2026 23:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VFJZNAAtZGkQfAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 23:06:40 +0000
Date: Mon, 12 Jan 2026 00:06:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <20260111230639.GB170559@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260109183012.114372-1-pvorel@suse.cz>
 <aWFnRcjl5SogBakq@devuan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWFnRcjl5SogBakq@devuan>
X-Spam-Score: -3.71
X-Spamd-Result: default: False [-3.71 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	REPLYTO_EQ_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1EE49336B3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

> Hi Petr!

> On Fri, Jan 09, 2026 at 07:30:09PM +0100, Petr Vorel wrote:
> > Convert mentioned man pages in docs to pages online in
> > https://man7.org/. Use new extension sphinx.ext.extlinks + format
> > custom CSS.

> > NOTE: Keep :manpage: (plain text instead of link) for non-existing man
> > pages (xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst
> > (including translations).

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi all,

> > @Michael @Alejandro (or whoever is responsible for man7.org),
> > feel free to shout if you don't like extra traffic from kernel.org doc.

> <man7.org> is Michael's website.

> > @Jonathan I chose man7.org as it looks as the most complete and the most
> > up to date man page collection.

> FWIW, Michael has been following recent releases of the project quite
> promptly (faster than distros), so it's reasonable to use it.


> > Kind regards,
> > Petr

> >  Documentation/admin-guide/LSM/landlock.rst    |  2 +-
> >  Documentation/admin-guide/initrd.rst          |  6 +--
> >  Documentation/arch/powerpc/dexcr.rst          |  6 +--
> >  Documentation/bpf/prog_lsm.rst                |  4 +-
> >  Documentation/conf.py                         |  9 ++++
> >  Documentation/dev-tools/kunit/start.rst       |  2 +-
> >  Documentation/process/adding-syscalls.rst     | 30 ++++++------
> >  Documentation/security/landlock.rst           |  2 +-
> >  Documentation/sphinx-static/custom.css        |  7 ++-
> >  .../it_IT/process/adding-syscalls.rst         | 30 ++++++------
> >  .../sp_SP/process/adding-syscalls.rst         | 30 ++++++------
> >  Documentation/userspace-api/check_exec.rst    | 10 ++--
> >  Documentation/userspace-api/landlock.rst      | 46 +++++++++----------
> >  Documentation/userspace-api/spec_ctrl.rst     |  6 +--
> >  14 files changed, 102 insertions(+), 88 deletions(-)

> > diff --git a/Documentation/admin-guide/LSM/landlock.rst b/Documentation/admin-guide/LSM/landlock.rst
> > index 9e61607def087..8b1e8ba36b719 100644
> > --- a/Documentation/admin-guide/LSM/landlock.rst
> > +++ b/Documentation/admin-guide/LSM/landlock.rst
> > @@ -143,7 +143,7 @@ filters to limit noise with two complementary ways:

> >  - with sys_landlock_restrict_self()'s flags if we can fix the sandboxed
> >    programs,
> > -- or with audit rules (see :manpage:`auditctl(8)`).
> > +- or with audit rules (see :man8:`auditctl`).

> >  Additional documentation
> >  ========================

> [...]

> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > index 1ea2ae5c6276c..e6b972f1f1b02 100644
> > --- a/Documentation/conf.py
> > +++ b/Documentation/conf.py
> > @@ -38,6 +38,14 @@ doctree = os.path.abspath(".")
> >  # Exclude of patterns that don't contain directory names, in glob format.
> >  exclude_patterns = []

> > +extlinks = {
> > +    # when adding new section update also custom.css
> > +    'man2': ('https://man7.org/linux/man-pages/man2/%s.2.html', '%s(2)'),
> > +    'man3': ('https://man7.org/linux/man-pages/man3/%s.3.html', '%s(3)'),
> > +    'man7': ('https://man7.org/linux/man-pages/man7/%s.7.html', '%s(7)'),
> > +    'man8': ('https://man7.org/linux/man-pages/man8/%s.8.html', '%s(8)'),
> > +}

> I wonder if this could be implemented in a way that wouldn't need
> changing any lines of documentation.

Good point. Yes, there is sphinx way to do it as one liner (no need for any
python scripting):
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

But the problem is that it creates links also for non-existing man pages
(xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst. I'll convert them not
being man pages.

Kind regards,
Petr

> I'm thinking of something like this shell script (sorry, I don't speak
> python):

> 	$ echo 'syscall(2)' \
> 	| sed 's,\(.*\)(\([0-9]\)),https://man7.org/linux/man-pages/man\2/\1.\2.html &,';
> 	https://man7.org/linux/man-pages/man2/syscall.2.html syscall(2)


> Have a lovely night!
> Alex

> > +
> >  # List of patterns that contain directory names in glob format.
> >  dyn_include_patterns = []
> >  dyn_exclude_patterns = ["output"]

> [...]
