Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE735CB7C
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979522; cv=none; b=tfsmFtOKETcpcr112DCrhyIGrNlvWWR37YWaiiwEAztdX3WNntdgmVWpbCC6P0sk/BF6aGwhoBL3BZleh8t7+BLeOOwhRuSU74Y4cid4fKN3zxzoGCwcLZ19sqCwTl5nkK7wJ2EuGDxGxTk+EMr1iqHoaYf+D04sIXnW2ADMe+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979522; c=relaxed/simple;
	bh=/O8AGckikQsGEk2VgZjiLCCH2+lzSgF3oJChkruIEXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJYKEI0Vx6Ew8aRiIkC83dVFXaNzpgIxdXVfxUmEHIotZbb1yaiBvTIRlnxfkKCbDWCYkbozSllNjFIhJ3MPoEZAprEy6aMo612Bh+VN0Xob9rhsuBUvGvsh4bCbhlUSmJiljflnQo/XPLk/wtUtCKnKCqiuXLtkO9ImD9Zlh+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bvOoIDs7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7ZwOm6iL; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bvOoIDs7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7ZwOm6iL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bvOoIDs7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7ZwOm6iL";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bvOoIDs7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7ZwOm6iL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B921333B2A;
	Fri,  9 Jan 2026 17:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767979519;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUEYvhKBMjQ9cDhL3UrBgPdkiWe/BzLX+02LYLgRBTg=;
	b=bvOoIDs7/FD4+TJqaNRPfdqDk9XOeCUK4Qnj7czNyqMMga1j2oxDg//84KKioY1MklpLwz
	GSOEFKlNQ7dkKstAXr8m1apj/gakeS7HZ8W9D02CtCQ8hUWdDJdOoJZSaboKRMAzUpg7Fp
	ZtxchutrGdCDfypEnkJFi/Q6Z+0qgzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767979519;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUEYvhKBMjQ9cDhL3UrBgPdkiWe/BzLX+02LYLgRBTg=;
	b=7ZwOm6iLW0FI0UWzh5XVXuKWebgN6dUcWAm9YZsgVrq9aZxrH0TtpW7TfrFUK4aLQpb7OQ
	xxcA8a0xRIdYUOCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bvOoIDs7;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=7ZwOm6iL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767979519;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUEYvhKBMjQ9cDhL3UrBgPdkiWe/BzLX+02LYLgRBTg=;
	b=bvOoIDs7/FD4+TJqaNRPfdqDk9XOeCUK4Qnj7czNyqMMga1j2oxDg//84KKioY1MklpLwz
	GSOEFKlNQ7dkKstAXr8m1apj/gakeS7HZ8W9D02CtCQ8hUWdDJdOoJZSaboKRMAzUpg7Fp
	ZtxchutrGdCDfypEnkJFi/Q6Z+0qgzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767979519;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUEYvhKBMjQ9cDhL3UrBgPdkiWe/BzLX+02LYLgRBTg=;
	b=7ZwOm6iLW0FI0UWzh5XVXuKWebgN6dUcWAm9YZsgVrq9aZxrH0TtpW7TfrFUK4aLQpb7OQ
	xxcA8a0xRIdYUOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57AC33EA63;
	Fri,  9 Jan 2026 17:25:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Js76EP85YWlAWwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 09 Jan 2026 17:25:19 +0000
Date: Fri, 9 Jan 2026 18:25:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: bug-hunting.rst: Remove wrong 'file:'
 syntax
Message-ID: <20260109172517.GA102040@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260109152336.84674-1-pvorel@suse.cz>
 <874iou4wde.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874iou4wde.fsf@trenco.lwn.net>
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
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:replyto,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B921333B2A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi Jonathan, all,

> Thanks for working to improve our docs

> Petr Vorel <pvorel@suse.cz> writes:

> > Link to another document does not require 'file:', therefore it was
> > shown in generated html.

> > Preformatted text requires just ``...``.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  Documentation/admin-guide/bug-hunting.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)

> > diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> > index 7da0504388ece..32b1b0c3d7ee4 100644
> > --- a/Documentation/admin-guide/bug-hunting.rst
> > +++ b/Documentation/admin-guide/bug-hunting.rst
> > @@ -52,14 +52,14 @@ line is usually required to identify and handle the bug. Along this chapter,
> >  we'll refer to "Oops" for all kinds of stack traces that need to be analyzed.

> >  If the kernel is compiled with ``CONFIG_DEBUG_INFO``, you can enhance the
> > -quality of the stack trace by using file:`scripts/decode_stacktrace.sh`.
> > +quality of the stack trace by using ``scripts/decode_stacktrace.sh``.

> >  Modules linked in
> >  -----------------

> >  Modules that are tainted or are being loaded or unloaded are marked with
> >  "(...)", where the taint flags are described in
> > -file:`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is
> > +`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is

> Can I ask you to remove the `quotes` too?  They aren't needed and can
> prevent the automarkup code from doing its thing.

Do you mean to really show the name of the file (no html link)?

Documentation/admin-guide/tainted-kernels.rst, "being loaded" is

This shows Documentation/admin-guide/tainted-kernels.rst in generated html.

But `Documentation/admin-guide/tainted-kernels.rst` will have link:

Text:
Tainted kernels, “being loaded”

Real XHTML:
<a class="reference internal" href="tainted-kernels.html"><span class="doc">Tainted kernels</span></a>
, “being loaded” is

I think in generated HTML is better to have clickable links than show filename.
And if one clicks to the link (https://docs.kernel.org/admin-guide/tainted-kernels.html)
it will see "Page source" link
(https://docs.kernel.org/_sources/admin-guide/tainted-kernels.rst.txt, just one
needs to remove ".txt" from URL).

Kind regards,
Petr

> Thanks,

> jon
