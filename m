Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410C241CB2
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768170514; cv=none; b=QFThvsjNCo3vYHR+40zbHSfrpA/JPtOmmBXarjnG/w5P2EO3K1UNf8olci+/iF6ia6PmoOpCMWf0Yt80ezOBJjdlAzrBG0xGtjHpuCcmIIYU5WkUhYSIjhXORTK0He0HvfkVtFH2Q9WuY7sQh7Zo1DWViwBkZzVxVb7IC5Fziow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768170514; c=relaxed/simple;
	bh=tJm1EpnPrgKrpD5XJHLm1EtXZDMxC1fvOPhdoH+znlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQzAvMAtTsbpTkHiAMuRrYMfHHEiJzC7gzj/ULkfoibWd9fPeIU9lMbpcE9g0Gj4l9NPt1Ep7znBBYCuw59wJ2rKNkEqhI2vQgOmuLVnvKtTGYw2Yi1Hc1p1NN2WKCyOzqF0WK9S32N1UlKv6BE3jTI7X82hcTBKFitO8t415Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lT+edgYN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9oBR0FHE; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lT+edgYN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9oBR0FHE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lT+edgYN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9oBR0FHE";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lT+edgYN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9oBR0FHE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1464B5BCFB;
	Sun, 11 Jan 2026 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768170511;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxFUq/xQOjmXmTPklpnBxVPywpgodvS1JSdXJDlVEw8=;
	b=lT+edgYNsQ7EwRiOfrq2pAnib1a2IlwNahYwX0lqAkk15z/V7SEFM7U7oyOh6LGhJr2Hjr
	cST25u6cKctowpOKGUwEH3BXfU212gtED9AIGEd7qeMjmg++JU8dMdyHFTyeIyBhumM1pO
	NbFdFdFlLoTt7F5/zcbyI2GCsOTncPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768170511;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxFUq/xQOjmXmTPklpnBxVPywpgodvS1JSdXJDlVEw8=;
	b=9oBR0FHEozX1QTTHt6gnRw+LZzxpJon9/j3RQQtTiX5W2V7ZztaQTkNiJVio/OowJm+VEq
	U/UY2C1wcPd6OXAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768170511;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxFUq/xQOjmXmTPklpnBxVPywpgodvS1JSdXJDlVEw8=;
	b=lT+edgYNsQ7EwRiOfrq2pAnib1a2IlwNahYwX0lqAkk15z/V7SEFM7U7oyOh6LGhJr2Hjr
	cST25u6cKctowpOKGUwEH3BXfU212gtED9AIGEd7qeMjmg++JU8dMdyHFTyeIyBhumM1pO
	NbFdFdFlLoTt7F5/zcbyI2GCsOTncPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768170511;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxFUq/xQOjmXmTPklpnBxVPywpgodvS1JSdXJDlVEw8=;
	b=9oBR0FHEozX1QTTHt6gnRw+LZzxpJon9/j3RQQtTiX5W2V7ZztaQTkNiJVio/OowJm+VEq
	U/UY2C1wcPd6OXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E22C63EA63;
	Sun, 11 Jan 2026 22:28:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nDx1NA4kZGnkWQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 22:28:30 +0000
Date: Sun, 11 Jan 2026 23:28:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: bug-hunting.rst: Remove wrong 'file:'
 syntax
Message-ID: <20260111222825.GA170559@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260109152336.84674-1-pvorel@suse.cz>
 <874iou4wde.fsf@trenco.lwn.net>
 <20260109172517.GA102040@pevik>
 <87sece34f8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sece34f8.fsf@trenco.lwn.net>
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.50
X-Spam-Level: 

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Jonathan, all,

> >> Thanks for working to improve our docs

> >> Petr Vorel <pvorel@suse.cz> writes:

> >> > Link to another document does not require 'file:', therefore it was
> >> > shown in generated html.

> >> > Preformatted text requires just ``...``.

> >> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> >> > ---
> >> >  Documentation/admin-guide/bug-hunting.rst | 6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)

> >> > diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> >> > index 7da0504388ece..32b1b0c3d7ee4 100644
> >> > --- a/Documentation/admin-guide/bug-hunting.rst
> >> > +++ b/Documentation/admin-guide/bug-hunting.rst
> >> > @@ -52,14 +52,14 @@ line is usually required to identify and handle the bug. Along this chapter,
> >> >  we'll refer to "Oops" for all kinds of stack traces that need to be analyzed.

> >> >  If the kernel is compiled with ``CONFIG_DEBUG_INFO``, you can enhance the
> >> > -quality of the stack trace by using file:`scripts/decode_stacktrace.sh`.
> >> > +quality of the stack trace by using ``scripts/decode_stacktrace.sh``.

> >> >  Modules linked in
> >> >  -----------------

> >> >  Modules that are tainted or are being loaded or unloaded are marked with
> >> >  "(...)", where the taint flags are described in
> >> > -file:`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is
> >> > +`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is

> >> Can I ask you to remove the `quotes` too?  They aren't needed and can
> >> prevent the automarkup code from doing its thing.

> > Do you mean to really show the name of the file (no html link)?

> > Documentation/admin-guide/tainted-kernels.rst, "being loaded" is

> > This shows Documentation/admin-guide/tainted-kernels.rst in generated html.

> > But `Documentation/admin-guide/tainted-kernels.rst` will have link:

> > Text:
> > Tainted kernels, “being loaded”

> Not true - the quotes are not needed for the automarkup code to do its
> thing.  The backticks will just have the effect of setting the title in
> italics, and may interfere with the automarkup.  Better to leave them
> out.

I'm sorry, I got confused by doc:`file.rst` syntax. Sure, I'll remove them in
v2.

Kind regards,
Petr

> Thanks,

> jon
