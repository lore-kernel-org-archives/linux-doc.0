Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFDA3ED13E
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906482; cv=none; b=dMmgStYf3Ss3EJ3/CpR1XJBUcc2D4VTwFpjRCRtSuEIcvr53OyyC3F1BLxz2qBC7/5l71KstiXsl9m+/gvDeqyCU1JksK6mUWcjYiFd/9s+My/4IYsUHzNgDhLVq/+vgXHWvhlbvzDdAwX0EZknk3BHYGUUebxEzQPV5xOZnvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906482; c=relaxed/simple;
	bh=6CqzJWy6qkgkRmJBR/Gg5I+HjP2tUW6HLtnhsLw++9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOhiFdahXFpqe7/AJL6XeASCfv9zcgE/WsZr96wEF/JoAP+Ys2Ce9OFFN6sgAQedDvyT3DBDll4dNuqEPNnRBbsE0EMRftBG1lj1AA7iiMx+OrtA/BcyooL3AhkT90wmNG4OdwymxU4c+CvrA2AbGQVBym8ZV1jedhAEOyqRS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=D1X1Ulhm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qYLcEHt7; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=D1X1Ulhm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qYLcEHt7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="D1X1Ulhm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qYLcEHt7";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="D1X1Ulhm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qYLcEHt7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AA773370C;
	Tue, 20 Jan 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768906097;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXkBkQ2/zo65Gb3sPuUGKK21okcCRycSHc2xNMBYGlw=;
	b=D1X1UlhmqxqnrT2dJw5LeSzNfjKFac38nhK/2MvIo0gqok1bK8xhODvPawKNY1JmpikLjb
	t/FCJFz5Vk4rFqtNwprkZeQUov5GOcDf551mi1mVwhPKLIvT++8cTv8HjaSvse2Do/Q1Tj
	fV6xpaAdJbvuBKH1u294KijuchsKeFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768906097;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXkBkQ2/zo65Gb3sPuUGKK21okcCRycSHc2xNMBYGlw=;
	b=qYLcEHt7UVIYm4+/PSBFN187fuVxakQEfB6PLKYsgIFw3NYrA/1vNfgzO1w6caK4+t/bYX
	GsxzChSlIe66UuDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768906097;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXkBkQ2/zo65Gb3sPuUGKK21okcCRycSHc2xNMBYGlw=;
	b=D1X1UlhmqxqnrT2dJw5LeSzNfjKFac38nhK/2MvIo0gqok1bK8xhODvPawKNY1JmpikLjb
	t/FCJFz5Vk4rFqtNwprkZeQUov5GOcDf551mi1mVwhPKLIvT++8cTv8HjaSvse2Do/Q1Tj
	fV6xpaAdJbvuBKH1u294KijuchsKeFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768906097;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXkBkQ2/zo65Gb3sPuUGKK21okcCRycSHc2xNMBYGlw=;
	b=qYLcEHt7UVIYm4+/PSBFN187fuVxakQEfB6PLKYsgIFw3NYrA/1vNfgzO1w6caK4+t/bYX
	GsxzChSlIe66UuDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F13B53EA63;
	Tue, 20 Jan 2026 10:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RwfgNHBdb2mfAQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 20 Jan 2026 10:48:16 +0000
Date: Tue, 20 Jan 2026 11:48:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: Re: [PATCH v3 0/3] Documentation: Link man pages to https://man7.org/
Message-ID: <20260120104814.GA32438@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <87a4ydo1hf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4ydo1hf.fsf@trenco.lwn.net>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[man7.org:url,imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:email];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

> Petr Vorel <pvorel@suse.cz> writes:

> > Changes v1->v2:
> > * Remove `...` (italic) from non-existing man pages (Jonathan).
> > * Squash fix for sp_SP to following commit (Jonathan).
> > * Remove :manpage: also from fxyzzy(3) (non-existing man page).
> > * Add CSS for man page.

> > Link to v2:
> > https://lore.kernel.org/linux-doc/20260111233534.183272-1-pvorel@suse.cz/

> > Link to v1:
> > https://lore.kernel.org/linux-doc/20260109183012.114372-1-pvorel@suse.cz/

> > Petr Vorel (3):
> >   Documentation: Remove :manpage: from non-existing man pages
> >   Documentation: Link man pages to https://man7.org/
> >   Documentation: CSS: Improve man page font

> >  Documentation/conf.py                            |  3 +++
> >  Documentation/process/adding-syscalls.rst        | 16 ++++++++--------
> >  Documentation/sphinx-static/custom.css           |  8 +++++++-
> >  .../it_IT/process/adding-syscalls.rst            | 16 ++++++++--------
> >  .../sp_SP/process/adding-syscalls.rst            | 16 ++++++++--------
> >  5 files changed, 34 insertions(+), 25 deletions(-)

> I have applied this set, thanks.

Thanks!

> Even nicer, of course, would be to have automarkup recognize man-page
> references and add the links automatically so we wouldn't need the
> :manpage: noise.  Something for another day, I guess...

Ah, you don't like :manpage: in the rst sources. I try to look into it later.

It looked to me safer than regexp, but hopefully any word following by \([1-8]\)
should be a man page.

Advantage would be that other man pages yet declared would be matched [1],
although some [2] would require to remove code formatting (``...``).

Kind regards,
Petr

[1] https://docs.kernel.org/admin-guide/LSM/Smack.html#file-system-interfaces
[2] https://docs.kernel.org/bpf/prog_cgroup_sysctl.html#context

> Thanks,

> jon
