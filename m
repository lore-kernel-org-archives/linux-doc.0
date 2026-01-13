Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B03816EE
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302058; cv=none; b=TRHqewuk4Jm6elkKur1VTW/lY3/4yCkgnhjnaIxwgBaTaVgyb9gAbcanwO4CpAkRaGJbtrpc/dj0jCI84XjFxQr1xA61LUGX2GlLbkGSpXa4EIoGVdeEpaIiSeCuYAQJgwq/yUx5JMfGsSdTK5FSQ3yMFpUsFsU/3DADbrtNhPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302058; c=relaxed/simple;
	bh=WiwQjWugRhk7kpSn8K7lpjlBaN+MQGbiBQVWkN1twpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uw7ApeNRiWIRl3UVonNU33c6Y2cOi5MxipCZ5nBT1Cc9LzSKnMDQBFi4YoqXx2cPeKtz5dCGdgsz810oQHhKxGTgPo/8CCXyOlIzve3aIMUxdrByHU9wUSKvyaMxVyFMfEfQKpa+oS88rEcd+34bWUDrcvqupXJOc1MT/tDwo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=QX2ufmJc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=CJho0nAO; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=d0e0qvtG; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=SED9F9Mj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QX2ufmJc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="CJho0nAO";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="d0e0qvtG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="SED9F9Mj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E126833684;
	Tue, 13 Jan 2026 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768302055;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ggc2Jp4TAzGqHUNJ156vzhpLuR5CExJb4jyEdujNCbY=;
	b=QX2ufmJcuybsJXHDO8NaPQnTPjI015GW+WlHx6h6f5jkwmFQ77MTnVMU8V+LhUs233snqh
	9d3fyQW8cefdKkSIPLrIPxThOx7f5m1IqYEHiFe3j1pcl7gnV1rHNS3jYbDAf2AF6hPIdd
	UfZijxbqFLoA+ycIDNHlpZjFKhSulUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768302055;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ggc2Jp4TAzGqHUNJ156vzhpLuR5CExJb4jyEdujNCbY=;
	b=CJho0nAOLVVWSfGNUaTIZbcVkC8/ro4+g6XUAnk/3qflQwholFd7WTpCVy7c10ddg/9KHH
	63KyWjYSNM07l7DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=d0e0qvtG;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=SED9F9Mj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768302054;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ggc2Jp4TAzGqHUNJ156vzhpLuR5CExJb4jyEdujNCbY=;
	b=d0e0qvtGSQ0+vKp+tt2pX0swPxuWWfMsJpV5BtK5Hcv4fb4LzaTpKLKmPr4sW7d5gYfZWa
	RMYoQch+ym/uHYGKnJqcRz8y9mpLN4MItTAQS+s8xpNZSyAaAxa2lRt5JlaPTVJt2hlCwz
	zbAZBRwyi4YsHhRqukUbzgk82tx/nNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768302054;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ggc2Jp4TAzGqHUNJ156vzhpLuR5CExJb4jyEdujNCbY=;
	b=SED9F9MjGCccpMvoS4co+C9ZjblBSbNKRJDudZXUoNunT7WXrysztVcMFUpnkW8uMhuYCU
	JKpjhYRiLoioOSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A92F83EA63;
	Tue, 13 Jan 2026 11:00:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iQqgKOYlZml0ewAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 13 Jan 2026 11:00:54 +0000
Date: Tue, 13 Jan 2026 12:00:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Michael Kerrisk <mtk@man7.org>,
	Alejandro Colomar <alx@kernel.org>, man-pages@man7.org
Subject: Re: [PATCH v2 2/3] Documentation: Remove :manpage: from non-existing
 man pages
Message-ID: <20260113110053.GA306468@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-3-pvorel@suse.cz>
 <877btm2388.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877btm2388.fsf@trenco.lwn.net>
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
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.71
X-Rspamd-Queue-Id: E126833684
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

> Petr Vorel <pvorel@suse.cz> writes:

> > Removing :manpage: from non-existing man pages (xyzzy(2), xyzzyat(2),
> > fxyzzy(3) in adding-syscalls.rst, including translations) prevent
> > adding link to nonexisting man pages when using manpages_url in next
> > commit.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > New in v2.

> >  Documentation/process/adding-syscalls.rst          | 14 +++++++-------
> >  .../translations/it_IT/process/adding-syscalls.rst | 14 +++++++-------
> >  .../translations/sp_SP/process/adding-syscalls.rst | 14 +++++++-------
> >  3 files changed, 21 insertions(+), 21 deletions(-)

> > diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
> > index fc0b0bbcd34df..1f61d0b114120 100644
> > --- a/Documentation/process/adding-syscalls.rst
> > +++ b/Documentation/process/adding-syscalls.rst
> > @@ -111,7 +111,7 @@ should use a file descriptor as the handle for that object -- don't invent a
> >  new type of userspace object handle when the kernel already has mechanisms and
> >  well-defined semantics for using file descriptors.

> > -If your new :manpage:`xyzzy(2)` system call does return a new file descriptor,
> > +If your new `xyzzy(2)` system call does return a new file descriptor,

> Here, once again, you're retaining the backticks.  If we need to mark up
> those references at all, they should be ``literal``.

I'm sorry to keep the same mistake. BTW I did not notice because both real man
pages a) without manpages_url:

<em class="manpage">read(2)</em>

b) with manpages_url:

<em class="manpage">
<a class="manpage reference external" href="https://man7.org/linux/man-pages/man8/auditctl.8.html">auditctl(8)</a>
</em>

don't have specified CSS. And because my browser default has font-style: italic
for <em>, I don't see any difference for :manpage:`read(2)` and `read(2)`.

BTW I'll add in v3 CSS font-family: ..., monospace for manpages.

> (If you simply remove the backticks, you might run into conflict with
> automarkup, though I *think* that the section number will evade its
> regexp).

In my local build plain fxyzzy(3) without backticks works. I slightly prefer to
not use double ``.

Kind regards,
Petr

> Thanks,

> jon
