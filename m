Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1DC37BE77
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379791; cv=none; b=n6SBuJunHlCH9K1XfpL7aOg8BvObSY+7KqtVZh6N1VfVKQMofoS2r+s06QefTXtT+1H2FYS7cObWRZBPPIsw5URxQd/pe1fJETh7PrE+u+CNAV8lmkqEkpUDUgEHl1164Z1NIxi6IkBOdEHCAE+f3fmTCQ0gghQPfj+Zqmz9qBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379791; c=relaxed/simple;
	bh=few3iZhx+kHkdMj5YDGlVDP9ZfIWIBaqXlXKyyXupvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae/qjt5A5/mxKnlWwAVd25FhKpdkS8GpHTI+f5uTsm4nuo/lQKekcwk8IYelOuBxxOBKANWDBkXoCOgtrp+fitjWIaMng4p3dI4vXQlhgcC1bhiNWQMmlGsrhC9y0/QdDI5JIDZd6nQbKya7CpUa8WWrKKXXIgaKF09snaN93qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Jf125Tc1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ShJgPBTD; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Jf125Tc1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ShJgPBTD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Jf125Tc1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ShJgPBTD";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Jf125Tc1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ShJgPBTD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCB5E5BDD6;
	Wed, 14 Jan 2026 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768379779;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr4r38zJPdh5UpWL5gWOvhp55oh3aYKSkyt4u2tggWo=;
	b=Jf125Tc1PONb7OKwnXtjwKYJ3usXMUVMvKmOgNAXtUyUGMDO+Itb3OMMuyqwWJzXiCycmz
	OUJG6S7TbZ8YKH4MP4sLU+N7242IV10Gr8VOt5YmD8xhEOejKkimFnoaCh7Se4YoAv7hDM
	+26GtrpMDB3bN5Kd88bB5qG8bKZ4BTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768379779;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr4r38zJPdh5UpWL5gWOvhp55oh3aYKSkyt4u2tggWo=;
	b=ShJgPBTDJXf6HhsRPU89W1FK7hTyCbmbMs5FUzhs7AcwOqGNqV5t4Hueev0VI6N4SqjTv5
	J0r21OeQIJhD0kDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Jf125Tc1;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ShJgPBTD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768379779;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr4r38zJPdh5UpWL5gWOvhp55oh3aYKSkyt4u2tggWo=;
	b=Jf125Tc1PONb7OKwnXtjwKYJ3usXMUVMvKmOgNAXtUyUGMDO+Itb3OMMuyqwWJzXiCycmz
	OUJG6S7TbZ8YKH4MP4sLU+N7242IV10Gr8VOt5YmD8xhEOejKkimFnoaCh7Se4YoAv7hDM
	+26GtrpMDB3bN5Kd88bB5qG8bKZ4BTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768379779;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr4r38zJPdh5UpWL5gWOvhp55oh3aYKSkyt4u2tggWo=;
	b=ShJgPBTDJXf6HhsRPU89W1FK7hTyCbmbMs5FUzhs7AcwOqGNqV5t4Hueev0VI6N4SqjTv5
	J0r21OeQIJhD0kDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5D6F3EA63;
	Wed, 14 Jan 2026 08:36:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YiJzK4NVZ2liWQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 14 Jan 2026 08:36:19 +0000
Date: Wed, 14 Jan 2026 09:36:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Alejandro Colomar <alx@kernel.org>, man-pages@man7.org
Subject: Re: [PATCH v3 3/3] Documentation: CSS: Improve man page font
Message-ID: <20260114083614.GA334250@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <20260113113612.315748-4-pvorel@suse.cz>
 <aWbLEeeVuY1X-YjA@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWbLEeeVuY1X-YjA@archie.me>
X-Spam-Score: -3.71
X-Spamd-Result: default: False [-3.71 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:replyto];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DCB5E5BDD6
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

> On Tue, Jan 13, 2026 at 12:36:10PM +0100, Petr Vorel wrote:
> > +
> > +a.manpage {
> > +	font-style: normal;
> > +	font-weight: bold;
> > +	font-family: "Courier New", Courier, monospace;
> > +}

> Shouldn't font-family be the same as Alabaster's default for consistency?:

> font-family: 'Consolas', 'Menlo', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', monospace;

Probably yes. FYI I took this from
Documentation/sphinx-static/theme_overrides.css, maybe span.menuselection,
code.kbd, code.kbd span should be fixed too.

Kind regards,
Petr

> Thanks.
